//type Test = { expr: string; isValue: boolean };

import { getAstFactory, isValue } from "../ast";
import { getParser } from "../";
import { defaultParser } from "../grammar";

const valueExpressions: string[] = [
    "1",
    "true",
    "false",
    '"one"',
    "null",
    "Test {f1: 0, f2: true}",
    "Test {f1: 0, f2: true, f3: null}",
    "Test {f1: Test2 {c:0}, f2: true}",
];

const notValueExpressions: string[] = [
    "g",
    "Test {f1: 0, f2: b}",
    "Test {f1: a, f2: true}",
    "f(1)",
    "f(1,4)",
    "s.f(1,4)",
    "+4",
    "-4",
    "!true",
    "g!!",
    "~6",
    "0 + 1",
    "0 - 1",
    "0 * 2",
    "1 / 3",
    "2 % 4",
    "10 >> 2",
    "10 << 2",
    "10 & 4",
    "10 | 4",
    "10 ^ 4",
    "10 != 4",
    "10 > 3",
    "10 < 3",
    "10 >= 5",
    "10 <= 2",
    "10 == 7",
    "true && false",
    "true || false",
    "true ? 0 : 1",
    "s.a",
    "s.a.a",
    "Test {a: 0, b: 1}.a",
    "initOf a(0,1,null)",
];

function testIsValue(expr: string, testResult: boolean) {
    const ast = getAstFactory();
    const { parseExpression } = getParser(ast, defaultParser);
    expect(isValue(parseExpression(expr))).toBe(testResult);
}

describe("expression-is-value", () => {
    valueExpressions.forEach((test) => {
        it(`should correctly determine that '${test}' is a value expression.`, () => {
            testIsValue(test, true);
        });
    });
    notValueExpressions.forEach((test) => {
        it(`should correctly determine that '${test}' is NOT a value expression.`, () => {
            testIsValue(test, false);
        });
    });
});
