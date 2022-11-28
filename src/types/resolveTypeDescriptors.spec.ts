import { CompilerContext } from "../ast/context";
import { getType, resolveTypeDescriptors } from "./resolveTypeDescriptors";

const source = `
    primitive Int;
    contract Test {
        var a: Int;
        fun hello(a: Int, b: Int): Int {
            let c: Int = 123 * a + self.a;
            return c;
        }
    }
`

describe('resolveTypeDescriptors', () => {
    it('should resolve types', () => {
        let ctx = CompilerContext.fromSources([source]);
        ctx = resolveTypeDescriptors(ctx);
        expect(getType(ctx, 'Int')).toMatchSnapshot();
        expect(getType(ctx, 'Test')).toMatchSnapshot();
    });
});