import { CompilerContext } from "../ast/context";
import { checkTypes } from "./checkTypes";

const source = `
    contract Test {
        var a: Int;
        fun hello(a: Int, b: Int): Int {
            let c: Int = 123 * a + self.a;
            return c;
        }
    }
`

describe('checkTypes', () => {
    it('should resolve a type', () => {
        let ctx = CompilerContext.fromSources([source]);
        checkTypes(ctx);
        // const type = resolveType('string');
        // expect(type).toBe(String);
    });
});