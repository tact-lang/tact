import { CompilerContext } from "../ast/context";
import { resolveExpressionTypes } from "./resolveExpressionType";
import { resolveTypeDescriptors } from "./resolveTypeDescriptors";

const source = `
    primitive Void;
    primitive Int;
    primitive Bool;
    
    contract Test {
        var a: Int;
        fun hello(a: Int, b: Int): Int {
            let c: Int = 123 * a + self.a;
            return c;
        }
    }
`;

describe('resolveExpressionType', () => {
    it('should resolve types', () => {
        let ctx = CompilerContext.fromSources([source]);
        ctx = resolveTypeDescriptors(ctx);
        ctx = resolveExpressionTypes(ctx);
    });
});