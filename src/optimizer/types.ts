import { AstExpression } from "../grammar/ast";
import { AstUtil } from "./util";

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
