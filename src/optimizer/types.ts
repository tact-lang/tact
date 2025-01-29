import { AstExpression } from "../ast/ast";
import { AstUtil } from "../ast/util";

export interface ExpressionTransformer {
    util: AstUtil;
    applyRules(ast: AstExpression): AstExpression;
}

export abstract class Rule {
    public abstract applyRule(
        ast: AstExpression,
        optimizer: ExpressionTransformer,
    ): AstExpression;
}
