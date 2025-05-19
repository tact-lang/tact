//type Test = { expr: string; isValue: boolean };

import { getAstFactory, isLiteral } from "@/ast/ast-helpers";
import { getParser } from "@/grammar/index";
import { step } from "@/test/allure/allure";

const valueExpressions: string[] = ["1", "true", "false", "null"];

const notValueExpressions: string[] = [
    "g",

    // Even if these three struct instances have literal fields, raw struct instances are not literals because they need to go through
    // the interpreter to get transformed into struct values.
    "Test {f1: 0, f2: true}",
    "Test {f1: 0, f2: true, f3: null}",
    "Test {f1: Test2 {c:0}, f2: true}",

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

async function testIsValue(expr: string, expected: boolean): Promise<void> {
    const ast = getAstFactory();
    const { parseExpression } = getParser(ast);
    await step(
        `'${expr}' should ${expected ? "" : "NOT "}be identified as a value`,
        () => {
            expect(isLiteral(parseExpression(expr))).toBe(expected);
        },
    );
}

describe("expression-is-value", () => {
    it("should correctly identify value expressions", async () => {
        for (const expr of valueExpressions) {
            await testIsValue(expr, true);
        }
    });

    it("should correctly identify non‑value expressions", async () => {
        for (const expr of notValueExpressions) {
            await testIsValue(expr, false);
        }
    });
});
