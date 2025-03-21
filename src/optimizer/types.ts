import type * as Ast from "../ast/ast";
import type { AstUtil } from "../ast/util";

export interface ExpressionTransformer {
    util: AstUtil;
    applyRules(ast: Ast.Expression): Ast.Expression;
}

export abstract class Rule {
    public abstract applyRule(
        ast: Ast.Expression,
        optimizer: ExpressionTransformer,
    ): Ast.Expression;
}
