import type { Id, Loc, OptionalId, TypeId } from "@/next/ast/common";
import type { Expression } from "@/next/ast/expression";
import type { Type } from "@/next/ast/type";

export type Statement =
    | StatementLet
    | StatementReturn
    | StatementExpression
    | StatementAssign
    | StatementAugmentedAssign
    | StatementCondition
    | StatementWhile
    | StatementUntil
    | StatementRepeat
    | StatementTry
    | StatementForEach
    | StatementDestruct
    | StatementBlock;

export type StatementLet = {
    readonly kind: "statement_let";
    readonly name: OptionalId;
    readonly type: Type | undefined;
    readonly expression: Expression;
    readonly loc: Loc;
};

export type StatementReturn = {
    readonly kind: "statement_return";
    readonly expression: Expression | undefined;
    readonly loc: Loc;
};

export type StatementExpression = {
    readonly kind: "statement_expression";
    readonly expression: Expression;
    readonly loc: Loc;
};

export type StatementAssign = {
    readonly kind: "statement_assign";
    readonly path: Expression; // left-hand side of `=`
    readonly expression: Expression;
    readonly loc: Loc;
};

export type AugmentedAssignOperation =
    | "+="
    | "-="
    | "*="
    | "/="
    | "&&="
    | "||="
    | "%="
    | "|="
    | "<<="
    | ">>="
    | "&="
    | "^=";

export type StatementAugmentedAssign = {
    readonly kind: "statement_augmentedassign";
    readonly op: AugmentedAssignOperation;
    readonly path: Expression;
    readonly expression: Expression;
    readonly loc: Loc;
};

export type StatementCondition = {
    readonly kind: "statement_condition";
    readonly condition: Expression;
    readonly trueStatements: readonly Statement[];
    readonly falseStatements: readonly Statement[] | undefined;
    readonly loc: Loc;
};

export type StatementWhile = {
    readonly kind: "statement_while";
    readonly condition: Expression;
    readonly statements: readonly Statement[];
    readonly loc: Loc;
};

export type StatementUntil = {
    readonly kind: "statement_until";
    readonly condition: Expression;
    readonly statements: readonly Statement[];
    readonly loc: Loc;
};

export type StatementRepeat = {
    readonly kind: "statement_repeat";
    readonly iterations: Expression;
    readonly statements: readonly Statement[];
    readonly loc: Loc;
};

export type StatementTry = {
    readonly kind: "statement_try";
    readonly statements: readonly Statement[];
    readonly catchBlock: CatchBlock | undefined;
    readonly loc: Loc;
};

export type CatchBlock = {
    readonly name: OptionalId;
    readonly statements: readonly Statement[];
};

export type StatementForEach = {
    readonly kind: "statement_foreach";
    readonly keyName: OptionalId;
    readonly valueName: OptionalId;
    readonly map: Expression;
    readonly statements: readonly Statement[];
    readonly loc: Loc;
};

export type StatementDestruct = {
    readonly kind: "statement_destruct";
    readonly type: TypeId;
    readonly typeArgs: readonly Type[];
    readonly identifiers: readonly (readonly [Id, OptionalId])[];
    readonly ignoreUnspecifiedFields: boolean;
    readonly expression: Expression;
    readonly loc: Loc;
};

export type StatementBlock = {
    readonly kind: "statement_block";
    readonly statements: readonly Statement[];
    readonly loc: Loc;
};
