import { CompilerContext } from "../../ast/context";
import { resolveExpressionTypes } from "../../types/resolveExpressionType";
import { getStaticFunction, resolveTypeDescriptors } from "../../types/resolveTypeDescriptors";
import { WriterContext } from "../Writer";
import { writeExpression } from "./writeExpression";

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
    'tpush(tpush(empty_tuple(), 1), 2)',
    '__tact_get(i, 0)',
    '__tact_get(tpush(tpush(empty_tuple(), 1), 2), 1)',
    '((- __tact_get(i, 1)) + a)',
    '(((- __tact_get(i, 1)) + a) + (+ b))',
    'null()',
    '(__tact_not_null(m) + 1)',
    '__gen_writecell_A(i)'
]

describe('writeExpression', () => {
    it('should write expression', () => {
        let ctx = CompilerContext.fromSources([code]);
        ctx = resolveTypeDescriptors(ctx);
        ctx = resolveExpressionTypes(ctx);
        let main = getStaticFunction(ctx, 'main');
        if (main.ast.kind !== 'def_function') {
            throw Error('Unexpected function kind');
        }
        let i = 0;
        for (let s of main.ast.statements) {
            if (s.kind !== 'statement_let') {
                throw Error('Unexpected statement kind');
            }
            let wctx = new WriterContext();
            expect(writeExpression(ctx, s.expression, wctx)).toBe(golden[i]);
            i++
        }
    });
});