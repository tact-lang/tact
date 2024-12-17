import { __DANGER_resetNodeId, eqExpressions } from "../ast";
import { getParser } from "../prev";

type Test = { expr1: string; expr2: string; equality: boolean };

const valueExpressions: Test[] = [
    { expr1: "1", expr2: "1", equality: true },
    { expr1: "1", expr2: "true", equality: false },
    { expr1: "1", expr2: '"one"', equality: false },
    { expr1: "1", expr2: "null", equality: false },
    { expr1: "1", expr2: "g", equality: false },
    { expr1: "false", expr2: "true", equality: false },
    { expr1: "false", expr2: '"false"', equality: false },
    { expr1: "false", expr2: "false", equality: true },
    { expr1: "false", expr2: "null", equality: false },
    { expr1: "false", expr2: "g", equality: false },
    { expr1: '"one"', expr2: '"one"', equality: true },
    { expr1: '"one"', expr2: '"onw"', equality: false },
    { expr1: '"one"', expr2: "null", equality: false },
    { expr1: '"one"', expr2: "g", equality: false },
    { expr1: "null", expr2: "null", equality: true },
    { expr1: "null", expr2: "g", equality: false },
];

const functionCallExpressions: Test[] = [
    { expr1: "f(1,4)", expr2: "f(1)", equality: false },
    { expr1: "f(1,4)", expr2: "f(1,4)", equality: true },
    { expr1: "f(1,4)", expr2: "1", equality: false },
    { expr1: "f(1,4)", expr2: "g(1,4)", equality: false },
    { expr1: "f(1,4)", expr2: "true", equality: false },
    { expr1: "f(1,4)", expr2: "null", equality: false },
    { expr1: "f(1,4)", expr2: "f", equality: false },
    { expr1: 'f("a",0)', expr2: 'f("a",0)', equality: true },
    { expr1: 'f("a",0)', expr2: 'f("a",null)', equality: false },
    { expr1: "f(true,0)", expr2: "f(0,true)", equality: false },
    { expr1: "f(true,0)", expr2: "f(true,0)", equality: true },
    { expr1: "f(g(1))", expr2: "g(f(1))", equality: false },

    { expr1: "s.f(1,4)", expr2: "s.f(1)", equality: false },
    { expr1: "s.f(1,4)", expr2: "s.f(1,4)", equality: true },
    { expr1: "s.f(1,4)", expr2: "1", equality: false },
    { expr1: "s.f(1,4)", expr2: "s.g(1,4)", equality: false },
    { expr1: "s.f(1,4)", expr2: "true", equality: false },
    { expr1: "s.f(1,4)", expr2: "null", equality: false },
    { expr1: 's.f("a",0)', expr2: 's.f("a",0)', equality: true },
    { expr1: 's.f("a",0)', expr2: 's.f("a",null)', equality: false },
    { expr1: "s.f(true,0)", expr2: "s.f(0,true)", equality: false },
    { expr1: "s.f(true,0)", expr2: "s.f(true,0)", equality: true },
    { expr1: "s.f(s.g(1))", expr2: "s.g(s.f(1))", equality: false },

    { expr1: "s.f(0)", expr2: "f(0)", equality: false },
];

const unaryOpExpressions: Test[] = [
    { expr1: "+4", expr2: "+4", equality: true },
    { expr1: "+4", expr2: "-4", equality: false },
    { expr1: "+4", expr2: "!g", equality: false },
    { expr1: "+4", expr2: "!!g", equality: false },
    { expr1: "+4", expr2: "g!!", equality: false },
    { expr1: "+4", expr2: "~g", equality: false },
    { expr1: "-4", expr2: "-4", equality: true },
    { expr1: "-4", expr2: "!g", equality: false },
    { expr1: "-4", expr2: "!!g", equality: false },
    { expr1: "-4", expr2: "g!!", equality: false },
    { expr1: "-4", expr2: "~g", equality: false },
    { expr1: "!g", expr2: "!g", equality: true },
    { expr1: "!g", expr2: "!!g", equality: false },
    { expr1: "!g", expr2: "g!!", equality: false },
    { expr1: "!g", expr2: "~g", equality: false },
    { expr1: "g!!", expr2: "g!!", equality: true },
    { expr1: "g!!", expr2: "~g", equality: false },
    { expr1: "~g", expr2: "~g", equality: true },
];

const binaryOpExpressions: Test[] = [
    { expr1: "g + r", expr2: "g + r", equality: true },
    { expr1: "g + r", expr2: "r + g", equality: false },
    { expr1: "g + r", expr2: "+r", equality: false },
    { expr1: "g + r", expr2: "g - r", equality: false },
    { expr1: "g + r", expr2: "g * r", equality: false },
    { expr1: "g + r", expr2: "g / r", equality: false },
    { expr1: "g + r", expr2: "g % r", equality: false },
    { expr1: "g + r", expr2: "g >> r", equality: false },
    { expr1: "g + r", expr2: "g << r", equality: false },
    { expr1: "g + r", expr2: "g & r", equality: false },
    { expr1: "g + r", expr2: "g | r", equality: false },
    { expr1: "g + r", expr2: "g ^ r", equality: false },
    { expr1: "g + r", expr2: "g != r", equality: false },
    { expr1: "g + r", expr2: "g > r", equality: false },
    { expr1: "g + r", expr2: "g < r", equality: false },
    { expr1: "g + r", expr2: "g >= r", equality: false },
    { expr1: "g + r", expr2: "g <= r", equality: false },
    { expr1: "g + r", expr2: "g == r", equality: false },
    { expr1: "g + r", expr2: "g && r", equality: false },
    { expr1: "g + r", expr2: "g || r", equality: false },
    { expr1: "g - r", expr2: "g - r", equality: true },
    { expr1: "g - r", expr2: "-r", equality: false },
    { expr1: "g - r", expr2: "r - g", equality: false },
    { expr1: "g - r", expr2: "g * r", equality: false },
    { expr1: "g - r", expr2: "g / r", equality: false },
    { expr1: "g - r", expr2: "g % r", equality: false },
    { expr1: "g - r", expr2: "g >> r", equality: false },
    { expr1: "g - r", expr2: "g << r", equality: false },
    { expr1: "g - r", expr2: "g & r", equality: false },
    { expr1: "g - r", expr2: "g | r", equality: false },
    { expr1: "g - r", expr2: "g ^ r", equality: false },
    { expr1: "g - r", expr2: "g != r", equality: false },
    { expr1: "g - r", expr2: "g > r", equality: false },
    { expr1: "g - r", expr2: "g < r", equality: false },
    { expr1: "g - r", expr2: "g >= r", equality: false },
    { expr1: "g - r", expr2: "g <= r", equality: false },
    { expr1: "g - r", expr2: "g == r", equality: false },
    { expr1: "g - r", expr2: "g && r", equality: false },
    { expr1: "g - r", expr2: "g || r", equality: false },
    { expr1: "g * r", expr2: "g * r", equality: true },
    { expr1: "g * r", expr2: "r * g", equality: false },
    { expr1: "g * r", expr2: "g / r", equality: false },
    { expr1: "g * r", expr2: "g % r", equality: false },
    { expr1: "g * r", expr2: "g >> r", equality: false },
    { expr1: "g * r", expr2: "g << r", equality: false },
    { expr1: "g * r", expr2: "g & r", equality: false },
    { expr1: "g * r", expr2: "g | r", equality: false },
    { expr1: "g * r", expr2: "g ^ r", equality: false },
    { expr1: "g * r", expr2: "g != r", equality: false },
    { expr1: "g * r", expr2: "g > r", equality: false },
    { expr1: "g * r", expr2: "g < r", equality: false },
    { expr1: "g * r", expr2: "g >= r", equality: false },
    { expr1: "g * r", expr2: "g <= r", equality: false },
    { expr1: "g * r", expr2: "g == r", equality: false },
    { expr1: "g * r", expr2: "g && r", equality: false },
    { expr1: "g * r", expr2: "g || r", equality: false },
    { expr1: "g / r", expr2: "g / r", equality: true },
    { expr1: "g / r", expr2: "r / g", equality: false },
    { expr1: "g / r", expr2: "g % r", equality: false },
    { expr1: "g / r", expr2: "g >> r", equality: false },
    { expr1: "g / r", expr2: "g << r", equality: false },
    { expr1: "g / r", expr2: "g & r", equality: false },
    { expr1: "g / r", expr2: "g | r", equality: false },
    { expr1: "g / r", expr2: "g ^ r", equality: false },
    { expr1: "g / r", expr2: "g != r", equality: false },
    { expr1: "g / r", expr2: "g > r", equality: false },
    { expr1: "g / r", expr2: "g < r", equality: false },
    { expr1: "g / r", expr2: "g >= r", equality: false },
    { expr1: "g / r", expr2: "g <= r", equality: false },
    { expr1: "g / r", expr2: "g == r", equality: false },
    { expr1: "g / r", expr2: "g && r", equality: false },
    { expr1: "g / r", expr2: "g || r", equality: false },
    { expr1: "g % r", expr2: "g % r", equality: true },
    { expr1: "g % r", expr2: "r % g", equality: false },
    { expr1: "g % r", expr2: "g >> r", equality: false },
    { expr1: "g % r", expr2: "g << r", equality: false },
    { expr1: "g % r", expr2: "g & r", equality: false },
    { expr1: "g % r", expr2: "g | r", equality: false },
    { expr1: "g % r", expr2: "g ^ r", equality: false },
    { expr1: "g % r", expr2: "g != r", equality: false },
    { expr1: "g % r", expr2: "g > r", equality: false },
    { expr1: "g % r", expr2: "g < r", equality: false },
    { expr1: "g % r", expr2: "g >= r", equality: false },
    { expr1: "g % r", expr2: "g <= r", equality: false },
    { expr1: "g % r", expr2: "g == r", equality: false },
    { expr1: "g % r", expr2: "g && r", equality: false },
    { expr1: "g % r", expr2: "g || r", equality: false },
    { expr1: "g >> r", expr2: "g >> r", equality: true },
    { expr1: "g >> r", expr2: "r >> g", equality: false },
    { expr1: "g >> r", expr2: "g << r", equality: false },
    { expr1: "g >> r", expr2: "g & r", equality: false },
    { expr1: "g >> r", expr2: "g | r", equality: false },
    { expr1: "g >> r", expr2: "g ^ r", equality: false },
    { expr1: "g >> r", expr2: "g != r", equality: false },
    { expr1: "g >> r", expr2: "g > r", equality: false },
    { expr1: "g >> r", expr2: "g < r", equality: false },
    { expr1: "g >> r", expr2: "g >= r", equality: false },
    { expr1: "g >> r", expr2: "g <= r", equality: false },
    { expr1: "g >> r", expr2: "g == r", equality: false },
    { expr1: "g >> r", expr2: "g && r", equality: false },
    { expr1: "g >> r", expr2: "g || r", equality: false },
    { expr1: "g << r", expr2: "g << r", equality: true },
    { expr1: "g << r", expr2: "r << g", equality: false },
    { expr1: "g << r", expr2: "g & r", equality: false },
    { expr1: "g << r", expr2: "g | r", equality: false },
    { expr1: "g << r", expr2: "g ^ r", equality: false },
    { expr1: "g << r", expr2: "g != r", equality: false },
    { expr1: "g << r", expr2: "g > r", equality: false },
    { expr1: "g << r", expr2: "g < r", equality: false },
    { expr1: "g << r", expr2: "g >= r", equality: false },
    { expr1: "g << r", expr2: "g <= r", equality: false },
    { expr1: "g << r", expr2: "g == r", equality: false },
    { expr1: "g << r", expr2: "g && r", equality: false },
    { expr1: "g << r", expr2: "g || r", equality: false },
    { expr1: "g & r", expr2: "g & r", equality: true },
    { expr1: "g & r", expr2: "r & g", equality: false },
    { expr1: "g & r", expr2: "g | r", equality: false },
    { expr1: "g & r", expr2: "g ^ r", equality: false },
    { expr1: "g & r", expr2: "g != r", equality: false },
    { expr1: "g & r", expr2: "g > r", equality: false },
    { expr1: "g & r", expr2: "g < r", equality: false },
    { expr1: "g & r", expr2: "g >= r", equality: false },
    { expr1: "g & r", expr2: "g <= r", equality: false },
    { expr1: "g & r", expr2: "g == r", equality: false },
    { expr1: "g & r", expr2: "g && r", equality: false },
    { expr1: "g & r", expr2: "g || r", equality: false },
    { expr1: "g | r", expr2: "g | r", equality: true },
    { expr1: "g | r", expr2: "r | g", equality: false },
    { expr1: "g | r", expr2: "g ^ r", equality: false },
    { expr1: "g | r", expr2: "g != r", equality: false },
    { expr1: "g | r", expr2: "g > r", equality: false },
    { expr1: "g | r", expr2: "g < r", equality: false },
    { expr1: "g | r", expr2: "g >= r", equality: false },
    { expr1: "g | r", expr2: "g <= r", equality: false },
    { expr1: "g | r", expr2: "g == r", equality: false },
    { expr1: "g | r", expr2: "g && r", equality: false },
    { expr1: "g | r", expr2: "g || r", equality: false },
    { expr1: "g ^ r", expr2: "g ^ r", equality: true },
    { expr1: "g ^ r", expr2: "r ^ g", equality: false },
    { expr1: "g ^ r", expr2: "g != r", equality: false },
    { expr1: "g ^ r", expr2: "g > r", equality: false },
    { expr1: "g ^ r", expr2: "g < r", equality: false },
    { expr1: "g ^ r", expr2: "g >= r", equality: false },
    { expr1: "g ^ r", expr2: "g <= r", equality: false },
    { expr1: "g ^ r", expr2: "g == r", equality: false },
    { expr1: "g ^ r", expr2: "g && r", equality: false },
    { expr1: "g ^ r", expr2: "g || r", equality: false },
    { expr1: "g != r", expr2: "g != r", equality: true },
    { expr1: "g != r", expr2: "r != g", equality: false },
    { expr1: "g != r", expr2: "g > r", equality: false },
    { expr1: "g != r", expr2: "g < r", equality: false },
    { expr1: "g != r", expr2: "g >= r", equality: false },
    { expr1: "g != r", expr2: "g <= r", equality: false },
    { expr1: "g != r", expr2: "g == r", equality: false },
    { expr1: "g != r", expr2: "g && r", equality: false },
    { expr1: "g != r", expr2: "g || r", equality: false },
    { expr1: "g > r", expr2: "g > r", equality: true },
    { expr1: "g > r", expr2: "r > g", equality: false },
    { expr1: "g > r", expr2: "g < r", equality: false },
    { expr1: "g > r", expr2: "g >= r", equality: false },
    { expr1: "g > r", expr2: "g <= r", equality: false },
    { expr1: "g > r", expr2: "g == r", equality: false },
    { expr1: "g > r", expr2: "g && r", equality: false },
    { expr1: "g > r", expr2: "g || r", equality: false },
    { expr1: "g < r", expr2: "g < r", equality: true },
    { expr1: "g < r", expr2: "r < g", equality: false },
    { expr1: "g < r", expr2: "g >= r", equality: false },
    { expr1: "g < r", expr2: "g <= r", equality: false },
    { expr1: "g < r", expr2: "g == r", equality: false },
    { expr1: "g < r", expr2: "g && r", equality: false },
    { expr1: "g < r", expr2: "g || r", equality: false },
    { expr1: "g >= r", expr2: "g >= r", equality: true },
    { expr1: "g >= r", expr2: "r >= g", equality: false },
    { expr1: "g >= r", expr2: "g <= r", equality: false },
    { expr1: "g >= r", expr2: "g == r", equality: false },
    { expr1: "g >= r", expr2: "g && r", equality: false },
    { expr1: "g >= r", expr2: "g || r", equality: false },
    { expr1: "g <= r", expr2: "g <= r", equality: true },
    { expr1: "g <= r", expr2: "r <= g", equality: false },
    { expr1: "g <= r", expr2: "g == r", equality: false },
    { expr1: "g <= r", expr2: "g && r", equality: false },
    { expr1: "g <= r", expr2: "g || r", equality: false },
    { expr1: "g == r", expr2: "g == r", equality: true },
    { expr1: "g == r", expr2: "r == g", equality: false },
    { expr1: "g == r", expr2: "g && r", equality: false },
    { expr1: "g == r", expr2: "g || r", equality: false },
    { expr1: "g && r", expr2: "g && r", equality: true },
    { expr1: "g && r", expr2: "r && g", equality: false },
    { expr1: "g && r", expr2: "g || r", equality: false },
    { expr1: "g || r", expr2: "g || r", equality: true },
    { expr1: "g || r", expr2: "r || g", equality: false },
];

const conditionalExpressions: Test[] = [
    { expr1: "g ? a : b", expr2: "g ? a : b", equality: true },
    { expr1: "g ? a : b", expr2: "g ? b : a", equality: false },
    { expr1: "g ? a : b", expr2: "b ? g : a", equality: false },
    { expr1: "g ? a : b", expr2: "b ? a : g", equality: false },
    { expr1: "g ? a : b", expr2: "a ? b : g", equality: false },
    { expr1: "g ? a : b", expr2: "a ? g : b", equality: false },
    { expr1: "g ? a : b", expr2: "g", equality: false },
    { expr1: "g ? a : b", expr2: "b", equality: false },
    { expr1: "g ? a : b", expr2: "a", equality: false },
];

const structExpressions: Test[] = [
    {
        expr1: "Test {f1: a, f2: b}",
        expr2: "Test {f1: a, f2: b}",
        equality: true,
    },
    {
        expr1: "Test {f1: a, f2: b}",
        expr2: "Test2 {f1: a, f2: b}",
        equality: false,
    },
    {
        expr1: "Test {f1: a, f2: b}",
        expr2: "Test {f3: a, f2: b}",
        equality: false,
    },
    {
        expr1: "Test {f1: a, f2: b}",
        expr2: "Test {f1: a, f3: b}",
        equality: false,
    },
    {
        expr1: "Test {f1: a, f2: b}",
        expr2: "Test {f1: c, f2: b}",
        equality: false,
    },
    {
        expr1: "Test {f1: a, f2: b}",
        expr2: "Test {f1: a, f2: c}",
        equality: false,
    },
    { expr1: "Test {f1: a, f2: b}", expr2: "Test {f1: a}", equality: false },
    {
        expr1: "Test {f1: a, f2: b}",
        expr2: "Test {f1: a, f2: b, f3: c}",
        equality: false,
    },
    { expr1: "Test {f1: a, f2: b}", expr2: "Test", equality: false },
    { expr1: "Test {f1: a, f2: b}", expr2: "f1", equality: false },
    { expr1: "Test {f1: a, f2: b}", expr2: "f2", equality: false },
    { expr1: "Test {f1: a, f2: b}", expr2: "a", equality: false },
    { expr1: "Test {f1: a, f2: b}", expr2: "b", equality: false },
];

const fieldAccessExpressions: Test[] = [
    { expr1: "s.a", expr2: "s.a", equality: true },
    { expr1: "s.a", expr2: "s.a(0)", equality: false },
    { expr1: "s.a", expr2: "a(0)", equality: false },
    { expr1: "s.a", expr2: "a", equality: false },
    { expr1: "s.a", expr2: "s.a.a", equality: false },
    { expr1: "s.a", expr2: "Test {a: e1, b: e2}.a", equality: false },
    { expr1: "s.a.a", expr2: "s.a.a", equality: true },
    { expr1: "s.a.a", expr2: "s.a.a(0)", equality: false },
    { expr1: "s.a.a", expr2: "s.a(0)", equality: false },
    { expr1: "s.a.a", expr2: "a(0)", equality: false },
    { expr1: "s.a.a", expr2: "a", equality: false },
    { expr1: "s.a.a", expr2: "Test {a: e1, b: e2}.a", equality: false },
    {
        expr1: "Test {a: e1, b: e2}.a",
        expr2: "Test {a: e1, b: e2}.a",
        equality: true,
    },
    { expr1: "Test {a: e1, b: e2}.a", expr2: "a", equality: false },
    { expr1: "Test {a: e1, b: e2}.a", expr2: "s.a", equality: false },
    { expr1: "Test {a: e1, b: e2}.a", expr2: "s.a(0)", equality: false },
    { expr1: "Test {a: e1, b: e2}.a", expr2: "a(0)", equality: false },
    { expr1: "Test {a: e1, b: e2}.a", expr2: "s.a.a", equality: false },
    {
        expr1: "Test {a: e1, b: e2}.a",
        expr2: "Test {a: e1, b: e2}.b",
        equality: false,
    },
];

const initOfExpressions: Test[] = [
    { expr1: "initOf a(b,c,d)", expr2: "initOf a(b,c,d)", equality: true },
    { expr1: "initOf a(b,c,d)", expr2: "initOf g(b,c,d)", equality: false },
    { expr1: "initOf a(b,c,d)", expr2: "initOf a(f,c,d)", equality: false },
    { expr1: "initOf a(b,c,d)", expr2: "initOf a(b,f,d)", equality: false },
    { expr1: "initOf a(b,c,d)", expr2: "initOf a(b,c,f)", equality: false },
    { expr1: "initOf a(b,c,d)", expr2: "initOf a(b)", equality: false },
    { expr1: "initOf a(b,c,d)", expr2: "initOf a(b,c)", equality: false },
    { expr1: "initOf a(b,c,d)", expr2: "initOf a(b,c,d,e)", equality: false },
    { expr1: "initOf a(b,c,d)", expr2: "a(b,c,d)", equality: false },
    { expr1: "initOf a(b,c,d)", expr2: "s.a(b,c,d)", equality: false },
];

function testEquality(expr1: string, expr2: string, equal: boolean) {
    const { parseExpression } = getParser();
    expect(eqExpressions(parseExpression(expr1), parseExpression(expr2))).toBe(
        equal,
    );
}

describe("expression-equality", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should correctly determine if two expressions involving values are equal or not.", () => {
        valueExpressions.forEach((test) => {
            testEquality(test.expr1, test.expr2, test.equality);
        });
    });
    it("should correctly determine if two expressions involving function calls are equal or not.", () => {
        functionCallExpressions.forEach((test) => {
            testEquality(test.expr1, test.expr2, test.equality);
        });
    });
    it("should correctly determine if two expressions involving unary operators are equal or not.", () => {
        unaryOpExpressions.forEach((test) => {
            testEquality(test.expr1, test.expr2, test.equality);
        });
    });
    it("should correctly determine if two expressions involving binary operators are equal or not.", () => {
        binaryOpExpressions.forEach((test) => {
            testEquality(test.expr1, test.expr2, test.equality);
        });
    });
    it("should correctly determine if two expressions involving conditionals are equal or not.", () => {
        conditionalExpressions.forEach((test) => {
            testEquality(test.expr1, test.expr2, test.equality);
        });
    });
    it("should correctly determine if two expressions involving structs are equal or not.", () => {
        structExpressions.forEach((test) => {
            testEquality(test.expr1, test.expr2, test.equality);
        });
    });
    it("should correctly determine if two expressions involving field accesses are equal or not.", () => {
        fieldAccessExpressions.forEach((test) => {
            testEquality(test.expr1, test.expr2, test.equality);
        });
    });
    it("should correctly determine if two expressions involving initOf are equal or not.", () => {
        initOfExpressions.forEach((test) => {
            testEquality(test.expr1, test.expr2, test.equality);
        });
    });
});
