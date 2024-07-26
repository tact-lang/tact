import {
    AstBinaryOperation,
    AstExpression,
    AstOpBinary,
    AstOpUnary,
    eqExpressions,
    isValue,
} from "../grammar/ast";
import { ExpressionTransformer, Rule } from "./types";
import {
    checkIsBinaryOpNode,
    checkIsBoolean,
    checkIsName,
    checkIsNumber,
    checkIsUnaryOpNode,
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

export class OrTrue extends Rule {
    public applyRule(
        ast: AstExpression,
        _optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (topLevelNode.op === "||") {
                if (
                    (checkIsName(topLevelNode.left) ||
                        isValue(topLevelNode.left)) &&
                    checkIsBoolean(topLevelNode.right, true)
                ) {
                    // The tree has this form:
                    // x || true, where x is an identifier or a value

                    return makeValueExpression(true);
                } else if (checkIsBoolean(topLevelNode.left, true)) {
                    // The tree has this form:
                    // true || x

                    return makeValueExpression(true);
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}

export class AndFalse extends Rule {
    public applyRule(
        ast: AstExpression,
        _optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (topLevelNode.op === "&&") {
                if (
                    (checkIsName(topLevelNode.left) ||
                        isValue(topLevelNode.left)) &&
                    checkIsBoolean(topLevelNode.right, false)
                ) {
                    // The tree has this form:
                    // x && false, where x is an identifier or a value

                    return makeValueExpression(false);
                } else if (checkIsBoolean(topLevelNode.left, false)) {
                    // The tree has this form:
                    // false && x

                    return makeValueExpression(false);
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}

export class OrFalse extends Rule {
    public applyRule(
        ast: AstExpression,
        _optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (topLevelNode.op === "||") {
                if (checkIsBoolean(topLevelNode.right, false)) {
                    // The tree has this form:
                    // x || false

                    const x = topLevelNode.left;

                    return x;
                } else if (checkIsBoolean(topLevelNode.left, false)) {
                    // The tree has this form:
                    // false || x

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

export class AndTrue extends Rule {
    public applyRule(
        ast: AstExpression,
        _optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (topLevelNode.op === "&&") {
                if (checkIsBoolean(topLevelNode.right, true)) {
                    // The tree has this form:
                    // x && true

                    const x = topLevelNode.left;

                    return x;
                } else if (checkIsBoolean(topLevelNode.left, true)) {
                    // The tree has this form:
                    // true && x

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

export class OrSelf extends Rule {
    public applyRule(
        ast: AstExpression,
        _optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (topLevelNode.op === "||") {
                // The tree has this form:
                // x || y
                // We need to check that x and y are equal

                const x = topLevelNode.left;
                const y = topLevelNode.right;

                if (eqExpressions(x, y)) {
                    return x;
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}

export class AndSelf extends Rule {
    public applyRule(
        ast: AstExpression,
        _optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (topLevelNode.op === "&&") {
                // The tree has this form:
                // x && y
                // We need to check that x and y are equal

                const x = topLevelNode.left;
                const y = topLevelNode.right;

                if (eqExpressions(x, y)) {
                    return x;
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}

export class ExcludedMiddle extends Rule {
    public applyRule(
        ast: AstExpression,
        _optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (topLevelNode.op === "||") {
                if (checkIsUnaryOpNode(topLevelNode.right)) {
                    const rightNode = topLevelNode.right as AstOpUnary;
                    if (rightNode.op === "!") {
                        // The tree has this form:
                        // x || !y
                        // We need to check that x is an identifier or a value
                        // and that x and y are equal

                        const x = topLevelNode.left;
                        const y = rightNode.operand;

                        if (
                            (checkIsName(x) || isValue(x)) &&
                            eqExpressions(x, y)
                        ) {
                            return makeValueExpression(true);
                        }
                    }
                } else if (checkIsUnaryOpNode(topLevelNode.left)) {
                    const leftNode = topLevelNode.left as AstOpUnary;
                    if (leftNode.op === "!") {
                        // The tree has this form:
                        // !x || y
                        // We need to check that x is an identifier or a value
                        // and that x and y are equal

                        const x = leftNode.operand;
                        const y = topLevelNode.right;

                        if (
                            (checkIsName(x) || isValue(x)) &&
                            eqExpressions(x, y)
                        ) {
                            return makeValueExpression(true);
                        }
                    }
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}

export class Contradiction extends Rule {
    public applyRule(
        ast: AstExpression,
        _optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (topLevelNode.op === "&&") {
                if (checkIsUnaryOpNode(topLevelNode.right)) {
                    const rightNode = topLevelNode.right as AstOpUnary;
                    if (rightNode.op === "!") {
                        // The tree has this form:
                        // x && !y
                        // We need to check that x is an identifier or a value
                        // and that x and y are equal

                        const x = topLevelNode.left;
                        const y = rightNode.operand;

                        if (
                            (checkIsName(x) || isValue(x)) &&
                            eqExpressions(x, y)
                        ) {
                            return makeValueExpression(false);
                        }
                    }
                } else if (checkIsUnaryOpNode(topLevelNode.left)) {
                    const leftNode = topLevelNode.left as AstOpUnary;
                    if (leftNode.op === "!") {
                        // The tree has this form:
                        // !x && y
                        // We need to check that x is an identifier or a value
                        // and that x and y are equal

                        const x = leftNode.operand;
                        const y = topLevelNode.right;

                        if (
                            (checkIsName(x) || isValue(x)) &&
                            eqExpressions(x, y)
                        ) {
                            return makeValueExpression(false);
                        }
                    }
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}

export class DoubleNegation extends Rule {
    public applyRule(
        ast: AstExpression,
        _optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsUnaryOpNode(ast)) {
            const topLevelNode = ast as AstOpUnary;
            if (topLevelNode.op === "!") {
                if (checkIsUnaryOpNode(topLevelNode.operand)) {
                    const innerNode = topLevelNode.operand as AstOpUnary;
                    if (innerNode.op === "!") {
                        // The tree has this form:
                        // !!x

                        const x = innerNode.operand;

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

export class NegateTrue extends Rule {
    public applyRule(
        ast: AstExpression,
        _optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsUnaryOpNode(ast)) {
            const topLevelNode = ast as AstOpUnary;
            if (topLevelNode.op === "!") {
                if (checkIsBoolean(topLevelNode.operand, true)) {
                    // The tree has this form
                    // !true

                    return makeValueExpression(false);
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}

export class NegateFalse extends Rule {
    public applyRule(
        ast: AstExpression,
        _optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsUnaryOpNode(ast)) {
            const topLevelNode = ast as AstOpUnary;
            if (topLevelNode.op === "!") {
                if (checkIsBoolean(topLevelNode.operand, false)) {
                    // The tree has this form
                    // !false

                    return makeValueExpression(true);
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}
