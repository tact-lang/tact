import {
    AstBinaryOperation,
    AstExpression,
    AstOpBinary,
    eqExpressions,
    isValue,
} from "../grammar/ast";
import { ExpressionTransformer, Rule } from "./types";
import {
    checkIsBinaryOpNode,
    checkIsName,
    checkIsNumber,
    makeBinaryExpression,
    makeUnaryExpression,
    makeValueExpression,
} from "./util";

export class AddZero extends Rule {
    private additiveOperators: AstBinaryOperation[] = ["+", "-"];

    public applyRule(
        ast: AstExpression,
        _optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (this.additiveOperators.includes(topLevelNode.op)) {
                if (
                    !isValue(topLevelNode.left) &&
                    checkIsNumber(topLevelNode.right, 0n)
                ) {
                    // The tree has this form:
                    // x op 0

                    const x = topLevelNode.left;

                    return x;
                } else if (
                    checkIsNumber(topLevelNode.left, 0n) &&
                    !isValue(topLevelNode.right)
                ) {
                    // The tree has this form:
                    // 0 op x

                    const x = topLevelNode.right;
                    const op = topLevelNode.op;

                    if (op === "-") {
                        return makeUnaryExpression("-", x);
                    } else {
                        return x;
                    }
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}

export class MultiplyZero extends Rule {
    public applyRule(
        ast: AstExpression,
        _optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (topLevelNode.op === "*") {
                if (
                    checkIsName(topLevelNode.left) &&
                    checkIsNumber(topLevelNode.right, 0n)
                ) {
                    // The tree has this form:
                    // x * 0, where x is an identifier

                    return makeValueExpression(0n);
                } else if (
                    checkIsNumber(topLevelNode.left, 0n) &&
                    checkIsName(topLevelNode.right)
                ) {
                    // The tree has this form:
                    // 0 * x, where x is an identifier

                    return makeValueExpression(0n);
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}

export class MultiplyOne extends Rule {
    public applyRule(
        ast: AstExpression,
        _optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (topLevelNode.op === "*") {
                if (
                    !isValue(topLevelNode.left) &&
                    checkIsNumber(topLevelNode.right, 1n)
                ) {
                    // The tree has this form:
                    // x * 1

                    const x = topLevelNode.left;

                    return x;
                } else if (
                    checkIsNumber(topLevelNode.left, 1n) &&
                    !isValue(topLevelNode.right)
                ) {
                    // The tree has this form:
                    // 1 * x

                    const x = topLevelNode.right;

                    return x;
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}

export class SubtractSelf extends Rule {
    public applyRule(
        ast: AstExpression,
        _optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (topLevelNode.op === "-") {
                if (
                    checkIsName(topLevelNode.left) &&
                    checkIsName(topLevelNode.right)
                ) {
                    // The tree has this form:
                    // x - y
                    // We need to check that x and y are equal

                    const x = topLevelNode.left;
                    const y = topLevelNode.right;

                    if (eqExpressions(x, y)) {
                        return makeValueExpression(0n);
                    }
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}

export class AddSelf extends Rule {
    public applyRule(
        ast: AstExpression,
        optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (topLevelNode.op === "+") {
                if (
                    !isValue(topLevelNode.left) &&
                    !isValue(topLevelNode.right)
                ) {
                    // The tree has this form:
                    // x + y
                    // We need to check that x and y are equal

                    const x = topLevelNode.left;
                    const y = topLevelNode.right;

                    if (eqExpressions(x, y)) {
                        const res = makeBinaryExpression(
                            "*",
                            x,
                            makeValueExpression(2n),
                        );
                        // Since we joined the tree, there is further opportunity
                        // for simplification
                        return optimizer.applyRules(res);
                    }
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}
