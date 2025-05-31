/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $ from "@/next/ast/checked-stmt";
import type * as $e from "@/next/ast/checked-expr";
import type * as $c from "@/next/ast/common";
import type * as $s from "@/next/ast/statement";
import type { Ordered } from "@/next/ast/checked";

export type DStatementLet = $.DStatementLet;
export const DStatementLet = (name: $c.OptionalId, expression: $e.DecodedExpression, loc: $c.Loc): $.DStatementLet => Object.freeze({
    kind: "statement_let",
    name,
    expression,
    loc
});
export const isDStatementLet = ($value: DStatementLet) => $value.kind === "statement_let";
export type DStatementReturn = $.DStatementReturn;
export const DStatementReturn = (expression: $e.DecodedExpression | undefined, loc: $c.Loc): $.DStatementReturn => Object.freeze({
    kind: "statement_return",
    expression,
    loc
});
export const isDStatementReturn = ($value: DStatementReturn) => $value.kind === "statement_return";
export type DStatementExpression = $.DStatementExpression;
export const DStatementExpression = (expression: $e.DecodedExpression, loc: $c.Loc): $.DStatementExpression => Object.freeze({
    kind: "statement_expression",
    expression,
    loc
});
export const isDStatementExpression = ($value: DStatementExpression) => $value.kind === "statement_expression";
export type DStatementAssign = $.DStatementAssign;
export const DStatementAssign = (path: $e.LValue, expression: $e.DecodedExpression, loc: $c.Loc): $.DStatementAssign => Object.freeze({
    kind: "statement_assign",
    path,
    expression,
    loc
});
export const isDStatementAssign = ($value: DStatementAssign) => $value.kind === "statement_assign";
export type DStatementAugmentedAssign = $.DStatementAugmentedAssign;
export const DStatementAugmentedAssign = (op: $s.AugmentedAssignOperation, path: $e.LValue, expression: $e.DecodedExpression, loc: $c.Loc): $.DStatementAugmentedAssign => Object.freeze({
    kind: "statement_augmentedassign",
    op,
    path,
    expression,
    loc
});
export const isDStatementAugmentedAssign = ($value: DStatementAugmentedAssign) => $value.kind === "statement_augmentedassign";
export type DestructPattern = $.DestructPattern;
export const DestructPattern = (field: $c.Id, variable: $c.OptionalId): $.DestructPattern => Object.freeze({
    field,
    variable,
});
export type DStatementDestruct = $.DStatementDestruct;
export const DStatementDestruct = (type_: $c.TypeId, identifiers: Ordered<$.DestructPattern>, ignoreUnspecifiedFields: boolean, expression: $e.DecodedExpression, loc: $c.Loc): $.DStatementDestruct => Object.freeze({
    kind: "statement_destruct",
    type: type_,
    identifiers,
    ignoreUnspecifiedFields,
    expression,
    loc
});
export const isDStatementDestruct = ($value: DStatementDestruct) => $value.kind === "statement_destruct";
export type DStatementBlock = $.DStatementBlock;
export const DStatementBlock = (statements: $.DStatementList, loc: $c.Loc): $.DStatementBlock => Object.freeze({
    kind: "statement_block",
    statements,
    loc
});
export const isDStatementBlock = ($value: DStatementBlock) => $value.kind === "statement_block";
export type DStatementForEach = $.DStatementForEach;
export const DStatementForEach = (keyName: $c.OptionalId, valueName: $c.OptionalId, map: $e.DecodedExpression, statements: $.DStatementList, loc: $c.Loc): $.DStatementForEach => Object.freeze({
    kind: "statement_foreach",
    keyName,
    valueName,
    map,
    statements,
    loc
});
export const isDStatementForEach = ($value: DStatementForEach) => $value.kind === "statement_foreach";
export type DCatchBlock = $.DCatchBlock;
export const DCatchBlock = (catchName: $c.OptionalId, catchStatements: $.DStatementList): $.DCatchBlock => Object.freeze({
    name: catchName,
    statements: catchStatements
});
export type DStatementTry = $.DStatementTry;
export const DStatementTry = (statements: $.DStatementList, catchBlock: $.DCatchBlock | undefined, loc: $c.Loc): $.DStatementTry => Object.freeze({
    kind: "statement_try",
    statements,
    catchBlock,
    loc
});
export const isDStatementTry = ($value: DStatementTry) => $value.kind === "statement_try";
export type DStatementRepeat = $.DStatementRepeat;
export const DStatementRepeat = (iterations: $e.DecodedExpression, statements: $.DStatementList, loc: $c.Loc): $.DStatementRepeat => Object.freeze({
    kind: "statement_repeat",
    iterations,
    statements,
    loc
});
export const isDStatementRepeat = ($value: DStatementRepeat) => $value.kind === "statement_repeat";
export type DStatementUntil = $.DStatementUntil;
export const DStatementUntil = (condition: $e.DecodedExpression, statements: $.DStatementList, loc: $c.Loc): $.DStatementUntil => Object.freeze({
    kind: "statement_until",
    condition,
    statements,
    loc
});
export const isDStatementUntil = ($value: DStatementUntil) => $value.kind === "statement_until";
export type DStatementWhile = $.DStatementWhile;
export const DStatementWhile = (condition: $e.DecodedExpression, statements: $.DStatementList, loc: $c.Loc): $.DStatementWhile => Object.freeze({
    kind: "statement_while",
    condition,
    statements,
    loc
});
export const isDStatementWhile = ($value: DStatementWhile) => $value.kind === "statement_while";
export type DStatementList = $.DStatementList;
export type DStatementCondition = $.DStatementCondition;
export const DStatementCondition = (condition: $e.DecodedExpression, trueStatements: $.DStatementList, falseStatements: $.DStatementList | undefined, loc: $c.Loc): $.DStatementCondition => Object.freeze({
    kind: "statement_condition",
    condition,
    trueStatements,
    falseStatements,
    loc
});
export const isDStatementCondition = ($value: DStatementCondition) => $value.kind === "statement_condition";
export type DecodedStatement = $.DecodedStatement;
