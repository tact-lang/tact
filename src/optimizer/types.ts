import { AstExpression } from "../grammar/ast";

export abstract class ExpressionTransformer {
    public abstract applyRules(ast: AstExpression): AstExpression;
}

export abstract class Rule {
    public abstract applyRule(
        ast: AstExpression,
        optimizer: ExpressionTransformer,
    ): AstExpression;
}
