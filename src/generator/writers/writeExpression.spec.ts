import { __DANGER_resetNodeId } from "../../grammar/ast";
import { CompilerContext } from "../../context";
import { resolveExpressionTypes } from "../../types/resolveExpressionType";
import { getStaticFunction, resolveDescriptors } from "../../types/resolveDescriptors";
import { WriterContext } from "../Writer";
import { writeExpression } from "./writeExpression";
import { openContext } from "../../grammar/store";

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
    let e: Bool = a > 1 || b < 2 && c == 3 || !(d != 4 && true && !false);
    let h: Int = f1(a);
    let i: A = A{a: 1, b: 2};
    let j: Int = i.a;
    let k: Int = A{a: 1, b: 2}.b;
    let l: Int = -i.b + a;
    let l: Int = -i.b + a + (+b);
    let m: Int? = null;
    let n: Int? = m!! + 1;
    let o: Cell = abi.pack_cell(i);
}
`;

const golden: string[] = [
    '1',
    '2',
    '(a + b)',
    '(a + (b * c))',
    '(a + (b / c))',
    'true',
    'false',
    '(((a > 1) | ((b > 2) & (c == 3))) | (~ (((d != 4) & true) & (~ false))))',
    'f1(a)',
    '__tact_to_tuple([1, 2])',
    'at(i, 0)',
    'at(__tact_to_tuple([1, 2]), 1)',
    '((- at(i, 1)) + a)',
    '(((- at(i, 1)) + a) + (+ b))',
    'null()',
    '(__tact_not_null(m) + 1)',
    '__gen_writecell_A(i)'
]

describe('writeExpression', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should write expression', () => {
        let ctx = openContext([code]);
        ctx = resolveDescriptors(ctx);
        ctx = resolveExpressionTypes(ctx);
        let main = getStaticFunction(ctx, 'main');
        if (main.ast.kind !== 'def_function') {
            throw Error('Unexpected function kind');
        }
        let i = 0;
        for (const s of main.ast.statements) {
            if (s.kind !== 'statement_let') {
                throw Error('Unexpected statement kind');
            }
            let wctx = new WriterContext(ctx);
            wctx.fun('main', () => {
                expect(writeExpression(s.expression, wctx)).toBe(golden[i]);
            });
            i++
        }
    });
});