import { inspect } from "util";
import { parse } from "./grammar";

describe('grammar', () => {
    it('should parse basic arithmetic', () => {
        expect(parse('c123 + 123 * a + 0x121341 - 9 / 19')).toMatchSnapshot();
    });
});