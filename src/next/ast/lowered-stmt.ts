import type { LExpr, LLValue } from "@/next/ast/lowered-expr";
import type { Id, Loc, OptionalId, Ordered, TypeId } from "@/next/ast/common";
import type { AugmentedAssignOperation } from "@/next/ast/statement";

export type LStmt =
    | LStmtLet
    | LStmtReturn
    | LStmtExpression
    | LStmtAssign
    | LStmtAugmentedAssign
    | LStmtCondition
    | LStmtWhile
    | LStmtUntil
    | LStmtRepeat
    | LStmtTry
    | LStmtForEach
    | LStmtDestruct
    | LStmtBlock;

export type LStmtList = readonly LStmt[];

export type LStmtLet = {
    readonly kind: "let";
    readonly name: OptionalId;
    readonly expression: LExpr;
    readonly loc: Loc;
};

export type LStmtReturn = {
    readonly kind: "return";
    readonly expression: LExpr | undefined;
    readonly loc: Loc;
};

export type LStmtExpression = {
    readonly kind: "expression";
    readonly expression: LExpr;
    readonly loc: Loc;
};

export type LStmtAssign = {
    readonly kind: "assign";
    readonly path: LLValue;
    readonly expression: LExpr;
    readonly loc: Loc;
};

export type LStmtAugmentedAssign = {
    readonly kind: "augmentedassign";
    readonly op: AugmentedAssignOperation;
    readonly path: LLValue;
    readonly expression: LExpr;
    readonly loc: Loc;
};

export type LStmtCondition = {
    readonly kind: "condition";
    readonly condition: LExpr;
    readonly trueStatements: LStmtList;
    readonly falseStatements: LStmtList | undefined;
    readonly loc: Loc;
};

export type LStmtWhile = {
    readonly kind: "while";
    readonly condition: LExpr;
    readonly statements: LStmtList;
    readonly loc: Loc;
};

export type LStmtUntil = {
    readonly kind: "until";
    readonly condition: LExpr;
    readonly statements: LStmtList;
    readonly loc: Loc;
};

export type LStmtRepeat = {
    readonly kind: "repeat";
    readonly iterations: LExpr;
    readonly statements: LStmtList;
    readonly loc: Loc;
};

export type LStmtTry = {
    readonly kind: "try";
    readonly statements: LStmtList;
    readonly catchBlock: LCatchBlock | undefined;
    readonly loc: Loc;
};

export type LCatchBlock = {
    readonly name: OptionalId;
    readonly statements: LStmtList;
};

export type LStmtForEach = {
    readonly kind: "foreach";
    readonly keyName: OptionalId;
    readonly valueName: OptionalId;
    readonly map: LExpr;
    readonly statements: LStmtList;
    readonly loc: Loc;
};

export type LStmtDestruct = {
    readonly kind: "destruct";
    readonly type: TypeId;
    readonly identifiers: Ordered<LDestructPattern>;
    readonly ignoreUnspecifiedFields: boolean;
    readonly expression: LExpr;
    readonly loc: Loc;
};

export type LDestructPattern = {
    readonly field: Id;
    readonly variable: OptionalId;
};

export type LStmtBlock = {
    readonly kind: "block";
    readonly statements: LStmtList;
    readonly loc: Loc;
};
