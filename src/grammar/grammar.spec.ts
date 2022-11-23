import { inspect } from "util";
import { parse } from "./grammar";

describe('grammar', () => {
    // it('should parse basic arithmetic', () => {
    //     expect(parse('c123 + 123 * a + 0x121341 - 9 / 19')).toMatchSnapshot();
    // });
    it('should parse basic arithmetic', () => {

        const source = `
        struct Hello {
            var a: Int32;
            var B: String;
        }
        contract World {
            var a: Hello;
            fun hello(a: Int32, b: String): Int256 {
                let a = 123 * self.a + self.a.abs();
                return a;
            }
        }
        `;

        console.warn(inspect(parse(source), false, 1000, true));
    });
});