import {
    AstExpression,
    AstNumber,
    AstBoolean,
    AstNull,
    AstString,
} from "../grammar/ast";

export type AstValue = AstNumber | AstBoolean | AstNull | AstString;

export abstract class ExpressionTransformer {
    public abstract applyRules(ast: AstExpression): AstExpression;
}

export abstract class Rule {
    public abstract applyRule(
        ast: AstExpression,
        optimizer: ExpressionTransformer,
    ): AstExpression;
}
