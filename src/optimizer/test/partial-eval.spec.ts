import * as A from "../../ast/ast";
import { AstUtil, getAstUtil } from "../../ast/util";
import { getOptimizer } from "../constEval";
import { CompilerContext } from "../../context/context";
import { ExpressionTransformer, Rule } from "../types";
import { AssociativeRule3 } from "../associative";
import { evalBinaryOp, evalUnaryOp } from "../interpreter";
import { getParser } from "../../grammar";
import { defaultParser } from "../../grammar/grammar";
import { throwInternalCompilerError } from "../../error/errors";
import {
    eqExpressions,
    FactoryAst,
    getAstFactory,
    isLiteral,
} from "../../ast/ast-helpers";

const MAX: string =
    "115792089237316195423570985008687907853269984665640564039457584007913129639935";
const MIN: string = `(-${MAX} - 1)`;

const additiveExpressions = [
    { original: "X + 3 + 1", simplified: "X + 4" },
    { original: "3 + X + 1", simplified: "4 + X" },
    { original: "1 + (X + 3)", simplified: "X + 4" },
    { original: "1 + (3 + X)", simplified: "4 + X" },

    // Should NOT simplify to X + 2, because X could be MAX - 2,
    // so that X + 3 causes an overflow, but X + 2 does not overflow
    { original: "X + 3 - 1", simplified: "X + 3 - 1" },
    { original: "3 + X - 1", simplified: "3 + X - 1" },

    // Should NOT simplify to X - 2, because X could be MIN + 2
    { original: "1 + (X - 3)", simplified: "1 + (X - 3)" },

    { original: "1 + (3 - X)", simplified: "4 - X" },

    { original: "X + 3 - (-1)", simplified: "X + 4" },
    { original: "3 + X - (-1)", simplified: "4 + X" },
    { original: "-1 + (X - 3)", simplified: "X - 4" },

    // Should NOT simplify to 2 - X, because X could be MIN + 3,
    // so that 3 - X = -MIN = MAX + 1 causes an overflow,
    // but 2 - X = -MIN - 1 = MAX does not
    { original: "-1 + (3 - X)", simplified: "-1 + (3 - X)" },

    // Should NOT simplify to (-2) - X because X could be MAX - 2
    // so that X + 3 causes an overflow, but
    // (-2) - X = MIN + 1 does not.
    { original: "1 - (X + 3)", simplified: "1 - (X + 3)" },

    // Should NOT simplify to (-2) - X because X could be MAX - 2
    // so that 3 + X causes an overflow, but
    // (-2) - X = MIN + 1 does not.
    { original: "1 - (3 + X)", simplified: "1 - (3 + X)" },

    { original: "1 - (X - 3)", simplified: "4 - X" },

    // Should NOT simplify to -2 + X because X could be MIN + 3
    // so that 3 - X causes an overflow, but
    // (-2) + X = MIN + 1 does not.
    { original: "1 - (3 - X)", simplified: "1 - (3 - X)" },

    // This should NOT simplify to X - 2 because X could be
    // MIN + 3, so that 3 - X = MAX + 1 overflows but
    // X - 2 = MIN + 1 does not.
    { original: "1 - (3 - X)", simplified: "1 - (3 - X)" },

    { original: "1 - X + 3", simplified: "4 - X" },
    { original: "X - 1 - 3", simplified: "X - 4" },
    { original: "X - 1 + (-3)", simplified: "X - 4" },
    { original: "1 - X - (-3)", simplified: "4 - X" },

    // Should NOT simplify to X + 2 or X - (-2), because
    // X could be MIN so that X - 1 causes an overflow,
    // but X + 2 or X - (-2) does not.
    { original: "X - 1 + 3", simplified: "X - 1 + 3" },

    // Should NOT simplify to (-2) - X, because
    // X could be MIN so that 1 - X causes an overflow,
    // but (-2) - X = MAX - 1 does not.
    { original: "1 - X - 3", simplified: "1 - X - 3" },

    // The following four should NOT simplify to X + (MAX + 1)
    // because it would introduce an overflow.
    // For example, X could be
    // -MAX, so that (X + MAX) + 1 = 0 + 1 = 1 does not overflow
    // but X + (${MAX} + 1) = -MAX + (overflow).
    { original: `X + ${MAX} + 1`, simplified: `X + ${MAX} + 1` },
    { original: `${MAX} + X + 1`, simplified: `${MAX} + X + 1` },
    { original: `1 + (X + ${MAX})`, simplified: `1 + (X + ${MAX})` },
    { original: `1 + (${MAX} + X)`, simplified: `1 + (${MAX} + X)` },

    // The following two should NOT simplify to X + (MIN - 1)
    // because it would introduce an overflow.
    // For example, X could be MAX, so that
    // X + MIN - 1 = MAX - MIN - 1 = -2 (does not overflow),
    // but MIN - 1 always overflows.
    { original: `X + ${MIN} - 1`, simplified: `X + ${MIN} - 1` },
    { original: `${MIN} + X - 1`, simplified: `${MIN} + X - 1` },

    // The following two should NOT simplify to (1 - MIN) - X
    // because it would introduce an overflow.
    // For example, X could be MAX, so that
    // 1 - (X + MIN) = 1 - (-1) = 2 (does not overflow),
    // but 1 - MIN always overflows.
    { original: `1 - (X + ${MIN})`, simplified: `1 - (X + ${MIN})` },
    { original: `1 - (${MIN} + X)`, simplified: `1 - (${MIN} + X)` },

    { original: "X + 0", simplified: "X" },
    { original: "0 + X", simplified: "X" },
    { original: "X - 0", simplified: "X" },
    { original: "0 - X", simplified: "-X" },

    { original: "X - X", simplified: "0" },
    { original: "(X - X) - 10", simplified: "-10" },

    { original: "X + X", simplified: "X * 2" },
    { original: "1 * (X + X)", simplified: "X * 2" },
    { original: "2 * (X + X)", simplified: "X * 4" },
    { original: "(X + X) * 2", simplified: "X * 4" },
];

const multiplicativeExpressions = [
    { original: "X * 3 * 2", simplified: "X * 6" },
    { original: "3 * X * 2", simplified: "6 * X" },
    { original: "2 * (X * 3)", simplified: "X * 6" },
    { original: "2 * (3 * X)", simplified: "6 * X" },

    { original: "X * -3 * -2", simplified: "X * 6" },
    { original: "-3 * X * -2", simplified: "6 * X" },
    { original: "-2 * (X * -3)", simplified: "X * 6" },
    { original: "-2 * (-3 * X)", simplified: "6 * X" },

    // The following 4 cases should NOT simplify to X * 0.
    // the reason is that X could be MAX, so that X*3 causes
    // an overflow, but X*0 does not.
    { original: "X * 3 * 0", simplified: "X * 3 * 0" },
    { original: "3 * X * 0", simplified: "3 * X * 0" },
    { original: "0 * (X * 3)", simplified: "0 * (X * 3)" },
    { original: "0 * (3 * X)", simplified: "0 * (3 * X)" },

    { original: "X * 0 * 3", simplified: "0" },
    { original: "0 * X * 3", simplified: "0" },
    { original: "3 * (X * 0)", simplified: "0" },
    { original: "3 * (0 * X)", simplified: "0" },

    { original: "X * 1 * 1", simplified: "X" },
    { original: "1 * X * 1", simplified: "X" },
    { original: "1 * (X * 1)", simplified: "X" },
    { original: "1 * (1 * X)", simplified: "X" },

    // This expression cannot be further simplified to X,
    // because X could be MIN, so that X * -1 causes an overflow
    { original: "X * -1 * 1 * -1", simplified: "X * -1 * -1" },

    // This expression could be further simplified to X * -1
    // but, currently, there are no rules that reduce three multiplied -1
    // to a single -1. This should be fixed in the future.
    { original: "X * -1 * 1 * -1 * -1", simplified: "X * -1 * -1 * -1" },

    // Even though, X * -1 * 1 * -1 cannot be simplified to X,
    // when we multiply with a number with absolute value bigger than 1,
    // we ensure that the overflows are preserved, so that we can simplify
    // the expression.
    { original: "X * -1 * 1 * -1 * 2", simplified: "X * 2" },

    // Should NOT simplify to X * 2, because X could be MIN/2 = -2^255,
    // so that X * -2 = 2^256 = MAX + 1 causes an overflow,
    // but X * 2 = -2^256 does not.
    { original: "X * -2 * -1", simplified: "X * -2 * -1" },

    // Note however that multiplying first by -1 allow us
    // to simplify the expression, because if X * -1 overflows,
    // X * 2 will also.
    { original: "X * -1 * -2", simplified: "X * 2" },
];

const mixedExpressions = [
    // Should NOT simplify to 0, because X * 2 could overflow
    {
        original: "(X * -1 * -2) - (X * -1 * -2)",
        simplified: "(X * 2) - (X * 2)",
    },

    { original: "(X * -1 * -2) + (X * -1 * -2)", simplified: "X * 4" },
];

// These expressions are edge cases to test the associative rule only.
const associativeRuleExpressions = [
    // The following three cases should NOT simplify to
    // -1 - X because X could be MIN, so that 0 - X overflows
    // but -1 - X = MAX does not.
    { original: "(0 - X) + -1", simplified: "(0 - X) + -1" },
    { original: "-1 + (0 - X)", simplified: "-1 + (0 - X)" },
    { original: "(0 - X) - 1", simplified: "(0 - X) - 1" },

    // The following 4 cases Should NOT simplify to X * -2
    // because X could be -(MIN/2) = 2^255, so that
    // X * 2 = -(MIN/2) * 2 = MAX + 1 = 2^256 overflows,
    // but X * -2 = 2^255 * -2 = -2^256 = MIN does not.
    { original: "(X * 2) * -1", simplified: "(X * 2) * -1" },
    { original: "(2 * X) * -1", simplified: "(2 * X) * -1" },
    { original: "-1 * (X * 2)", simplified: "-1 * (X * 2)" },
    { original: "-1 * (2 * X)", simplified: "-1 * (2 * X)" },

    { original: "1 - (X - 1)", simplified: "2 - X" },
    { original: "0 - (X - 1)", simplified: "1 - X" },
    { original: "-1 - (X - 1)", simplified: "0 - X" },

    // Should NOT simplify to -1 - X because X could be MIN,
    // so that X - 1 causes an overflow, but -1 - X = MAX does not.
    { original: "-2 - (X - 1)", simplified: "-2 - (X - 1)" },

    { original: "-2 - (X - (-1))", simplified: "-3 - X" },
    { original: "-1 - (X - (-1))", simplified: "-2 - X" },

    // Should NOT simplify to -1 - X because X could be MAX,
    // so that X - (-1) causes an overflow, but -1 - X = MIN does not.
    { original: "0 - (X - (-1))", simplified: "0 - (X - (-1))" },

    { original: "-1 - (X + 1)", simplified: "-2 - X" },

    // Should NOT simplify to -1 - X because X could be MAX
    // so that X + 1 overflows but -1 - X = MIN does not.
    { original: "0 - (X + 1)", simplified: "0 - (X + 1)" },

    { original: "0 - (X + (-1))", simplified: "1 - X" },
    { original: "-1 - (X + (-1))", simplified: "0 - X" },

    // Should NOT simplify to -1 - X because X could be MIN,
    // so that X + (-1) causes an overflow, but -1 - X = MAX does not.
    { original: "-2 - (X + (-1))", simplified: "-2 - (X + (-1))" },

    { original: "-1 - (0 - X)", simplified: "-1 + X" },

    // Should NOT simplify to 0 + X because X could be MIN so that
    // 0 - X = MAX + 1 overflows, but 0 + X = MIN does not.
    { original: "0 - (0 - X)", simplified: "0 - (0 - X)" },

    { original: "-1 - (1 + X)", simplified: "-2 - X" },

    // Should NOT simplify to -1 - X because X could be MAX
    // so that 1 + X overflows but -1 - X = MIN does not.
    { original: "0 - (1 + X)", simplified: "0 - (1 + X)" },

    { original: "0 - ((-1) + X)", simplified: "1 - X" },
    { original: "-1 - ((-1) + X)", simplified: "0 - X" },

    // Should NOT simplify to -1 - X because X could be MIN,
    // so that (-1) + X causes an overflow, but -1 - X = MAX does not.
    { original: "-2 - ((-1) + X)", simplified: "-2 - ((-1) + X)" },
];

const booleanExpressions = [
    { original: "X && false && false", simplified: "false" },
    { original: "false && X && false", simplified: "false" },
    { original: "false && (X && false)", simplified: "false" },
    { original: "false && (false && X)", simplified: "false" },
    { original: "X && true && false", simplified: "false" },
    { original: "true && X && false", simplified: "false" },
    { original: "false && (X && true)", simplified: "false" },
    { original: "false && (true && X)", simplified: "false" },
    { original: "X && false && true", simplified: "false" },
    { original: "false && X && true", simplified: "false" },
    { original: "true && (X && false)", simplified: "false" },
    { original: "true && (false && X)", simplified: "false" },
    { original: "X && true && true", simplified: "X" },
    { original: "true && X && true", simplified: "X" },
    { original: "true && (X && true)", simplified: "X" },
    { original: "true && (true && X)", simplified: "X" },
    { original: "X || false || false", simplified: "X" },
    { original: "false || X || false", simplified: "X" },
    { original: "false || (X || false)", simplified: "X" },
    { original: "false || (false || X)", simplified: "X" },
    { original: "X || true || false", simplified: "true" },
    { original: "true || X || false", simplified: "true" },
    { original: "false || (X || true)", simplified: "true" },
    { original: "false || (true || X)", simplified: "true" },
    { original: "X || false || true", simplified: "true" },
    { original: "false || X || true", simplified: "true" },
    { original: "true || (X || false)", simplified: "true" },
    { original: "true || (false || X)", simplified: "true" },
    { original: "X || true || true", simplified: "true" },
    { original: "true || X || true", simplified: "true" },
    { original: "true || (X || true)", simplified: "true" },
    { original: "true || (true || X)", simplified: "true" },

    { original: "!!X || !X", simplified: "true" },
    { original: "!!X && !X", simplified: "false" },
    { original: "!!X && X", simplified: "X" },
    { original: "!!X || X", simplified: "X" },
    { original: "!(X && !X)", simplified: "true" },
    { original: "!(X || !X)", simplified: "false" },
    { original: "(!!X || X) && !X", simplified: "false" },
    { original: "!!X || X || !X", simplified: "true" },
    { original: "!!X && X || !X", simplified: "true" },
    { original: "!!X && X && !X", simplified: "false" },
    { original: "!!X || (X && !X)", simplified: "X" },
    { original: "!!X || (X || !X)", simplified: "true" },
    { original: "!!X && (X || !X)", simplified: "X" },
    { original: "!!X && (X && !X)", simplified: "false" },
    { original: "!!X || !(X && !X)", simplified: "true" },
    { original: "!!X || !(X || !X)", simplified: "X" },
    { original: "!!X && !(X || !X)", simplified: "false" },
    { original: "!!X && !(X && !X)", simplified: "X" },

    { original: "X && false && Y && false", simplified: "false" },
    { original: "X && true && Y && true", simplified: "X && Y" },
    { original: "X && false && (Y && true)", simplified: "false" },
    {
        original: "(!!X && !(X && !X)) && (!!Y && !(Y && !Y)) && true",
        simplified: "X && Y",
    },
];

function testExpression(original: string, simplified: string) {
    it(`should simplify ${original} to ${simplified}`, () => {
        const ast = getAstFactory();
        const { parseExpression } = getParser(ast, defaultParser);
        const { partiallyEvalExpression } = getOptimizer(getAstUtil(ast));
        const originalValue = partiallyEvalExpression(
            parseExpression(original),
            new CompilerContext(),
        );
        const simplifiedValue = dummyEval(parseExpression(simplified), ast);
        const areMatching = eqExpressions(originalValue, simplifiedValue);
        expect(areMatching).toBe(true);
    });
}

function testExpressionWithOptimizer(
    original: string,
    simplified: string,
    optimizer: ExpressionTransformer,
) {
    it(`should simplify ${original} to ${simplified}`, () => {
        const ast = getAstFactory();
        const { parseExpression } = getParser(ast, defaultParser);
        const originalValue = optimizer.applyRules(
            dummyEval(parseExpression(original), ast),
        );
        const simplifiedValue = dummyEval(parseExpression(simplified), ast);
        const areMatching = eqExpressions(originalValue, simplifiedValue);
        expect(areMatching).toBe(true);
    });
}

// This is a dummy partial evaluator that only simplifies constant expressions
// without manipulating the tree structure.
// The reason for doing this is that the partial evaluator will actually simplify constant
// expressions. So, when comparing for equality of expressions, we also need to simplify
// constant expressions.
function dummyEval(
    ast: A.AstExpression,
    astFactory: FactoryAst,
): A.AstExpression {
    const cloneNode = astFactory.cloneNode;
    const util = getAstUtil(astFactory);
    const recurse = (ast: A.AstExpression): A.AstExpression => {
        switch (ast.kind) {
            case "null":
                return ast;
            case "boolean":
                return ast;
            case "number":
                return ast;
            case "string":
                return ast;
            case "id":
                return ast;
            case "address":
                return ast;
            case "cell":
                return ast;
            case "simplified_string":
                return ast;
            case "slice":
                return ast;
            case "struct_value":
                return ast; // No need to simplify: fields already simplified
            case "method_call": {
                const newNode = cloneNode(ast);
                newNode.args = ast.args.map(recurse);
                newNode.self = recurse(ast.self);
                return newNode;
            }
            case "init_of": {
                const newNode = cloneNode(ast);
                newNode.args = ast.args.map(recurse);
                return newNode;
            }
            case "op_unary": {
                const newNode = cloneNode(ast);
                newNode.operand = recurse(ast.operand);
                if (isLiteral(newNode.operand)) {
                    return evalUnaryOp(ast.op, newNode.operand, ast.loc, util);
                }
                return newNode;
            }
            case "op_binary": {
                const newNode = cloneNode(ast);
                newNode.left = recurse(ast.left);
                newNode.right = recurse(ast.right);
                if (isLiteral(newNode.left) && isLiteral(newNode.right)) {
                    const valR = newNode.right;
                    return evalBinaryOp(
                        ast.op,
                        newNode.left,
                        () => valR,
                        ast.loc,
                        util,
                    );
                }
                return newNode;
            }
            case "conditional": {
                const newNode = cloneNode(ast);
                newNode.thenBranch = recurse(ast.thenBranch);
                newNode.elseBranch = recurse(ast.elseBranch);
                return newNode;
            }
            case "struct_instance": {
                const newNode = cloneNode(ast);
                newNode.args = ast.args.map((param) => {
                    const newParam = cloneNode(param);
                    newParam.initializer = recurse(param.initializer);
                    return newParam;
                });
                return newNode;
            }
            case "field_access": {
                const newNode = cloneNode(ast);
                newNode.aggregate = recurse(ast.aggregate);
                return newNode;
            }
            case "static_call": {
                const newNode = cloneNode(ast);
                newNode.args = ast.args.map(recurse);
                return newNode;
            }
            default:
                throwInternalCompilerError("Unrecognized expression kind");
        }
    };
    return recurse(ast);
}

// A dummy optimizer to test specific rules
class ParameterizableDummyOptimizer implements ExpressionTransformer {
    private rules: Rule[];

    public util: AstUtil;

    constructor(rules: Rule[], Ast: FactoryAst) {
        this.util = getAstUtil(Ast);

        this.rules = rules;
    }

    public applyRules = (ast: A.AstExpression): A.AstExpression => {
        return this.rules.reduce(
            (prev, rule) => rule.applyRule(prev, this),
            ast,
        );
    };
}

describe("partial-evaluator", () => {
    additiveExpressions.forEach((test) => {
        testExpression(test.original, test.simplified);
    });
    multiplicativeExpressions.forEach((test) => {
        testExpression(test.original, test.simplified);
    });
    mixedExpressions.forEach((test) => {
        testExpression(test.original, test.simplified);
    });

    associativeRuleExpressions.forEach((test) => {
        // For the following cases, we need an optimizer that only
        // uses the associative rule 3.
        const optimizer = new ParameterizableDummyOptimizer(
            [new AssociativeRule3()],
            getAstFactory(),
        );

        testExpressionWithOptimizer(test.original, test.simplified, optimizer);
    });

    booleanExpressions.forEach((test) => {
        testExpression(test.original, test.simplified);
    });
});
