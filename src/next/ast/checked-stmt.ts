import type { Ordered } from "@/next/ast/checked";
import type { DecodedExpression, LValue } from "@/next/ast/checked-expr";
import type { Id, Loc, OptionalId, TypeId } from "@/next/ast/common";
import type { AugmentedAssignOperation } from "@/next/ast/statement";

export type DecodedStatement =
    | DStatementLet
    | DStatementReturn
    | DStatementExpression
    | DStatementAssign
    | DStatementAugmentedAssign
    | DStatementCondition
    | DStatementWhile
    | DStatementUntil
    | DStatementRepeat
    | DStatementTry
    | DStatementForEach
    | DStatementDestruct
    | DStatementBlock;

export type DStatementList = readonly DecodedStatement[];

export type DStatementLet = {
    readonly kind: "statement_let";
    readonly name: OptionalId;
    readonly expression: DecodedExpression;
    readonly loc: Loc;
};

export type DStatementReturn = {
    readonly kind: "statement_return";
    readonly expression: DecodedExpression | undefined;
    readonly loc: Loc;
};

export type DStatementExpression = {
    readonly kind: "statement_expression";
    readonly expression: DecodedExpression;
    readonly loc: Loc;
};

export type DStatementAssign = {
    readonly kind: "statement_assign";
    readonly path: LValue;
    readonly expression: DecodedExpression;
    readonly loc: Loc;
};

export type DStatementAugmentedAssign = {
    readonly kind: "statement_augmentedassign";
    readonly op: AugmentedAssignOperation;
    readonly path: LValue;
    readonly expression: DecodedExpression;
    readonly loc: Loc;
};

export type DStatementCondition = {
    readonly kind: "statement_condition";
    readonly condition: DecodedExpression;
    readonly trueStatements: DStatementList;
    readonly falseStatements: DStatementList | undefined;
    readonly loc: Loc;
};

export type DStatementWhile = {
    readonly kind: "statement_while";
    readonly condition: DecodedExpression;
    readonly statements: DStatementList;
    readonly loc: Loc;
};

export type DStatementUntil = {
    readonly kind: "statement_until";
    readonly condition: DecodedExpression;
    readonly statements: DStatementList;
    readonly loc: Loc;
};

export type DStatementRepeat = {
    readonly kind: "statement_repeat";
    readonly iterations: DecodedExpression;
    readonly statements: DStatementList;
    readonly loc: Loc;
};

export type DStatementTry = {
    readonly kind: "statement_try";
    readonly statements: DStatementList;
    readonly catchBlock: DCatchBlock | undefined;
    readonly loc: Loc;
};

export type DCatchBlock = {
    readonly name: OptionalId;
    readonly statements: DStatementList;
};

export type DStatementForEach = {
    readonly kind: "statement_foreach";
    readonly keyName: OptionalId;
    readonly valueName: OptionalId;
    readonly map: DecodedExpression;
    readonly statements: DStatementList;
    readonly loc: Loc;
};

export type DStatementDestruct = {
    readonly kind: "statement_destruct";
    readonly type: TypeId;
    /** field name -> [field id, local id] */
    readonly identifiers: Ordered<DestructPattern>;
    readonly ignoreUnspecifiedFields: boolean;
    readonly expression: DecodedExpression;
    readonly loc: Loc;
};

export type DestructPattern = {
    readonly field: Id;
    readonly variable: OptionalId;
}

export type DStatementBlock = {
    readonly kind: "statement_block";
    readonly statements: DStatementList;
    readonly loc: Loc;
};
