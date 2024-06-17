import { __DANGER_resetNodeId } from "../../grammar/ast";
import {
    getStaticFunction,
    resolveDescriptors,
} from "../../types/resolveDescriptors";
import { WriterContext } from "../Writer";
import { writeExpression } from "./writeExpression";
import { openContext } from "../../grammar/store";
import { resolveStatements } from "../../types/resolveStatements";
import { CompilerContext } from "../../context";

const code = `

primitive Int;
primitive Bool;
primitive Builder;
primitive Cell;
primitive Slice;

fun f1(a: Int): Int {
    return a;
}

struct A {
    a: Int;
    b: Int;
}

fun main() {
    let a: Int = 1;
    let b: Int = 2;
    let c: Int = a + b;
    let d: Int = a + b * c;
    let e: Int = a + b / c;
    let f: Bool = true;
    let g: Bool = false;
    let h: Bool = a > 1 || b < 2 && c == 3 || !(d != 4 && true && !false);
    let i: Int = f1(a);
    let j: A = A{a: 1, b: 2};
    let k: Int = j.a;
    let l: Int = A{a: 1, b}.b;
    let m: Int = -j.b + a;
    let n: Int = -j.b + a + (+b);
    let o: Int? = null;
    let p: Int? = o!! + 1;
    let q: Cell = j.toCell();
}
`;

const golden: string[] = [
    "1",
    "2",
    "($a + $b)",
    "($a + ($b * $c))",
    "($a + ($b / $c))",
    "true",
    "false",
    "( (( (($a > 1)) ? (true) : (( (($b < 2)) ? (($c == 3)) : (false) )) )) ? (true) : ((~ ( (( (($d != 4)) ? (true) : (false) )) ? (true) : (false) ))) )",
    "$global_f1($a)",
    "$A$_constructor_a_b(1, 2)",
    `$j'a`,
    "$A$_get_b($A$_constructor_a_b(1, $b))",
    `((- $j'b) + $a)`,
    `(((- $j'b) + $a) + (+ $b))`,
    "null()",
    "(__tact_not_null($o) + 1)",
    `$A$_store_cell(($j'a, $j'b))`,
];

describe("writeExpression", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should write expression", () => {
        let ctx = openContext(
            new CompilerContext(),
            [{ code: code, path: "<unknown>", origin: "user" }],
            [],
        );
        ctx = resolveDescriptors(ctx);
        ctx = resolveStatements(ctx);
        const main = getStaticFunction(ctx, "main");
        if (main.ast.kind !== "def_function") {
            throw Error("Unexpected function kind");
        }
        let i = 0;
        for (const s of main.ast.statements!) {
            if (s.kind !== "statement_let") {
                throw Error("Unexpected statement kind");
            }
            const wCtx = new WriterContext(ctx, "Contract1");
            wCtx.fun("$main", () => {
                wCtx.body(() => {
                    expect(writeExpression(s.expression, wCtx)).toBe(golden[i]);
                });
            });
            i++;
        }
    });
});
