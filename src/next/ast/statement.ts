import type { Id, Range, OptionalId, TypeId } from "@/next/ast/common";
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
    readonly loc: Range;
};

export type StatementReturn = {
    readonly kind: "statement_return";
    readonly expression: Expression | undefined;
    readonly loc: Range;
};

export type StatementExpression = {
    readonly kind: "statement_expression";
    readonly expression: Expression;
    readonly loc: Range;
};

export type StatementAssign = {
    readonly kind: "statement_assign";
    readonly path: Expression; // left-hand side of `=`
    readonly expression: Expression;
    readonly loc: Range;
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
    readonly loc: Range;
};

export type StatementCondition = {
    readonly kind: "statement_condition";
    readonly condition: Expression;
    readonly trueStatements: readonly Statement[];
    readonly falseStatements: readonly Statement[] | undefined;
    readonly loc: Range;
};

export type StatementWhile = {
    readonly kind: "statement_while";
    readonly condition: Expression;
    readonly statements: readonly Statement[];
    readonly loc: Range;
};

export type StatementUntil = {
    readonly kind: "statement_until";
    readonly condition: Expression;
    readonly statements: readonly Statement[];
    readonly loc: Range;
};

export type StatementRepeat = {
    readonly kind: "statement_repeat";
    readonly iterations: Expression;
    readonly statements: readonly Statement[];
    readonly loc: Range;
};

export type StatementTry = {
    readonly kind: "statement_try";
    readonly statements: readonly Statement[];
    readonly catchBlock: CatchBlock | undefined;
    readonly loc: Range;
};

export type CatchBlock = {
    readonly catchName: OptionalId;
    readonly catchStatements: readonly Statement[];
};

export type StatementForEach = {
    readonly kind: "statement_foreach";
    readonly keyName: OptionalId;
    readonly valueName: OptionalId;
    readonly map: Expression;
    readonly statements: readonly Statement[];
    readonly loc: Range;
};

export type StatementDestruct = {
    readonly kind: "statement_destruct";
    readonly type: TypeId;
    /** field name -> [field id, local id] */
    readonly identifiers: ReadonlyMap<string, readonly [Id, OptionalId]>;
    readonly ignoreUnspecifiedFields: boolean;
    readonly expression: Expression;
    readonly loc: Range;
};

export type StatementBlock = {
    readonly kind: "statement_block";
    readonly statements: readonly Statement[];
    readonly loc: Range;
};

export type DestructMapping = {
    readonly kind: "destruct_mapping";
    readonly field: Id;
    readonly name: Id;
    readonly loc: Range;
};

export type DestructEnd = {
    readonly kind: "destruct_end";
    readonly ignoreUnspecifiedFields: boolean;
    readonly loc: Range;
};
