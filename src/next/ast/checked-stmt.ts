import type { CExpr, CLValue } from "@/next/ast/checked-expr";
import type { Id, Loc, OptionalId, TypeId } from "@/next/ast/common";
import type { Ordered } from "@/next/ast/generated/common";
import type { AugmentedAssignOperation } from "@/next/ast/statement";

export type CStmt =
    | CStmtLet
    | CStmtReturn
    | CStmtExpression
    | CStmtAssign
    | CStmtAugmentedAssign
    | CStmtCondition
    | CStmtWhile
    | CStmtUntil
    | CStmtRepeat
    | CStmtTry
    | CStmtForEach
    | CStmtDestruct
    | CStmtBlock;

export type CStmtList = readonly CStmt[];

export type CStmtLet = {
    readonly kind: "statement_let";
    readonly name: OptionalId;
    readonly expression: CExpr;
    readonly loc: Loc;
};

export type CStmtReturn = {
    readonly kind: "statement_return";
    readonly expression: CExpr | undefined;
    readonly loc: Loc;
};

export type CStmtExpression = {
    readonly kind: "statement_expression";
    readonly expression: CExpr;
    readonly loc: Loc;
};

export type CStmtAssign = {
    readonly kind: "statement_assign";
    readonly path: CLValue;
    readonly expression: CExpr;
    readonly loc: Loc;
};

export type CStmtAugmentedAssign = {
    readonly kind: "statement_augmentedassign";
    readonly op: AugmentedAssignOperation;
    readonly path: CLValue;
    readonly expression: CExpr;
    readonly loc: Loc;
};

export type CStmtCondition = {
    readonly kind: "statement_condition";
    readonly condition: CExpr;
    readonly trueStatements: CStmtList;
    readonly falseStatements: CStmtList | undefined;
    readonly loc: Loc;
};

export type CStmtWhile = {
    readonly kind: "statement_while";
    readonly condition: CExpr;
    readonly statements: CStmtList;
    readonly loc: Loc;
};

export type CStmtUntil = {
    readonly kind: "statement_until";
    readonly condition: CExpr;
    readonly statements: CStmtList;
    readonly loc: Loc;
};

export type CStmtRepeat = {
    readonly kind: "statement_repeat";
    readonly iterations: CExpr;
    readonly statements: CStmtList;
    readonly loc: Loc;
};

export type CStmtTry = {
    readonly kind: "statement_try";
    readonly statements: CStmtList;
    readonly catchBlock: CCatchBlock | undefined;
    readonly loc: Loc;
};

export type CCatchBlock = {
    readonly name: OptionalId;
    readonly statements: CStmtList;
};

export type CStmtForEach = {
    readonly kind: "statement_foreach";
    readonly keyName: OptionalId;
    readonly valueName: OptionalId;
    readonly map: CExpr;
    readonly statements: CStmtList;
    readonly loc: Loc;
};

export type CStmtDestruct = {
    readonly kind: "statement_destruct";
    readonly type: TypeId;
    readonly identifiers: Ordered<CDestructPattern>;
    readonly ignoreUnspecifiedFields: boolean;
    readonly expression: CExpr;
    readonly loc: Loc;
};

export type CDestructPattern = {
    readonly field: Id;
    readonly variable: OptionalId;
};

export type CStmtBlock = {
    readonly kind: "statement_block";
    readonly statements: CStmtList;
    readonly loc: Loc;
};
