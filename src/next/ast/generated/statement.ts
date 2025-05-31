/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $c from "@/next/ast/common";
import type * as $e from "@/next/ast/expression";
import type * as $t from "@/next/ast/type";
import type * as $ from "@/next/ast/statement";

export type StatementLet = $.StatementLet;
export const StatementLet = (
    name: $c.OptionalId,
    type_: $t.Type | undefined,
    expression: $e.Expression,
    loc: $c.Loc,
): $.StatementLet =>
    Object.freeze({
        kind: "statement_let",
        name,
        type: type_,
        expression,
        loc,
    });
export const isStatementLet = ($value: StatementLet) =>
    $value.kind === "statement_let";
export type StatementReturn = $.StatementReturn;
export const StatementReturn = (
    expression: $e.Expression | undefined,
    loc: $c.Loc,
): $.StatementReturn =>
    Object.freeze({
        kind: "statement_return",
        expression,
        loc,
    });
export const isStatementReturn = ($value: StatementReturn) =>
    $value.kind === "statement_return";
export type StatementExpression = $.StatementExpression;
export const StatementExpression = (
    expression: $e.Expression,
    loc: $c.Loc,
): $.StatementExpression =>
    Object.freeze({
        kind: "statement_expression",
        expression,
        loc,
    });
export const isStatementExpression = ($value: StatementExpression) =>
    $value.kind === "statement_expression";
export type StatementAssign = $.StatementAssign;
export const StatementAssign = (
    path: $e.Expression,
    expression: $e.Expression,
    loc: $c.Loc,
): $.StatementAssign =>
    Object.freeze({
        kind: "statement_assign",
        path,
        expression,
        loc,
    });
export const isStatementAssign = ($value: StatementAssign) =>
    $value.kind === "statement_assign";
export type AugmentedAssignOperation = $.AugmentedAssignOperation;
export const allAugmentedAssignOperation: readonly $.AugmentedAssignOperation[] =
    [
        "+=",
        "-=",
        "*=",
        "/=",
        "&&=",
        "||=",
        "%=",
        "|=",
        "<<=",
        ">>=",
        "&=",
        "^=",
    ];
export type StatementAugmentedAssign = $.StatementAugmentedAssign;
export const StatementAugmentedAssign = (
    op: $.AugmentedAssignOperation,
    path: $e.Expression,
    expression: $e.Expression,
    loc: $c.Loc,
): $.StatementAugmentedAssign =>
    Object.freeze({
        kind: "statement_augmentedassign",
        op,
        path,
        expression,
        loc,
    });
export const isStatementAugmentedAssign = ($value: StatementAugmentedAssign) =>
    $value.kind === "statement_augmentedassign";
export type StatementDestruct = $.StatementDestruct;
export const StatementDestruct = (
    type_: $c.TypeId,
    identifiers: ReadonlyMap<string, readonly [$c.Id, $c.OptionalId]>,
    ignoreUnspecifiedFields: boolean,
    expression: $e.Expression,
    loc: $c.Loc,
): $.StatementDestruct =>
    Object.freeze({
        kind: "statement_destruct",
        type: type_,
        identifiers,
        ignoreUnspecifiedFields,
        expression,
        loc,
    });
export const isStatementDestruct = ($value: StatementDestruct) =>
    $value.kind === "statement_destruct";
export type StatementBlock = $.StatementBlock;
export const StatementBlock = (
    statements: readonly $.Statement[],
    loc: $c.Loc,
): $.StatementBlock =>
    Object.freeze({
        kind: "statement_block",
        statements,
        loc,
    });
export const isStatementBlock = ($value: StatementBlock) =>
    $value.kind === "statement_block";
export type StatementForEach = $.StatementForEach;
export const StatementForEach = (
    keyName: $c.OptionalId,
    valueName: $c.OptionalId,
    map: $e.Expression,
    statements: readonly $.Statement[],
    loc: $c.Loc,
): $.StatementForEach =>
    Object.freeze({
        kind: "statement_foreach",
        keyName,
        valueName,
        map,
        statements,
        loc,
    });
export const isStatementForEach = ($value: StatementForEach) =>
    $value.kind === "statement_foreach";
export type CatchBlock = $.CatchBlock;
export const CatchBlock = (
    catchName: $c.OptionalId,
    catchStatements: readonly $.Statement[],
): $.CatchBlock =>
    Object.freeze({
        name: catchName,
        statements: catchStatements,
    });
export type StatementTry = $.StatementTry;
export const StatementTry = (
    statements: readonly $.Statement[],
    catchBlock: $.CatchBlock | undefined,
    loc: $c.Loc,
): $.StatementTry =>
    Object.freeze({
        kind: "statement_try",
        statements,
        catchBlock,
        loc,
    });
export const isStatementTry = ($value: StatementTry) =>
    $value.kind === "statement_try";
export type StatementRepeat = $.StatementRepeat;
export const StatementRepeat = (
    iterations: $e.Expression,
    statements: readonly $.Statement[],
    loc: $c.Loc,
): $.StatementRepeat =>
    Object.freeze({
        kind: "statement_repeat",
        iterations,
        statements,
        loc,
    });
export const isStatementRepeat = ($value: StatementRepeat) =>
    $value.kind === "statement_repeat";
export type StatementUntil = $.StatementUntil;
export const StatementUntil = (
    condition: $e.Expression,
    statements: readonly $.Statement[],
    loc: $c.Loc,
): $.StatementUntil =>
    Object.freeze({
        kind: "statement_until",
        condition,
        statements,
        loc,
    });
export const isStatementUntil = ($value: StatementUntil) =>
    $value.kind === "statement_until";
export type StatementWhile = $.StatementWhile;
export const StatementWhile = (
    condition: $e.Expression,
    statements: readonly $.Statement[],
    loc: $c.Loc,
): $.StatementWhile =>
    Object.freeze({
        kind: "statement_while",
        condition,
        statements,
        loc,
    });
export const isStatementWhile = ($value: StatementWhile) =>
    $value.kind === "statement_while";
export type StatementCondition = $.StatementCondition;
export const StatementCondition = (
    condition: $e.Expression,
    trueStatements: readonly $.Statement[],
    falseStatements: readonly $.Statement[] | undefined,
    loc: $c.Loc,
): $.StatementCondition =>
    Object.freeze({
        kind: "statement_condition",
        condition,
        trueStatements,
        falseStatements,
        loc,
    });
export const isStatementCondition = ($value: StatementCondition) =>
    $value.kind === "statement_condition";
export type Statement = $.Statement;
