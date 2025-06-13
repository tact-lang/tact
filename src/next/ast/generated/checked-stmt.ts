/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $ from "@/next/ast/checked-stmt";
import type * as $e from "@/next/ast/checked-expr";
import type * as $c from "@/next/ast/common";
import type * as $s from "@/next/ast/statement";

export type CStmtLet = $.CStmtLet;
export const CStmtLet = (
    name: $c.OptionalId,
    expression: $e.CExpr,
    loc: $c.Loc,
): $.CStmtLet =>
    Object.freeze({
        kind: "statement_let",
        name,
        expression,
        loc,
    });
export type CStmtReturn = $.CStmtReturn;
export const CStmtReturn = (
    expression: $e.CExpr | undefined,
    loc: $c.Loc,
): $.CStmtReturn =>
    Object.freeze({
        kind: "statement_return",
        expression,
        loc,
    });
export type CStmtExpression = $.CStmtExpression;
export const CStmtExpression = (
    expression: $e.CExpr,
    loc: $c.Loc,
): $.CStmtExpression =>
    Object.freeze({
        kind: "statement_expression",
        expression,
        loc,
    });
export type CStmtAssign = $.CStmtAssign;
export const CStmtAssign = (
    path: $e.CLValue,
    expression: $e.CExpr,
    loc: $c.Loc,
): $.CStmtAssign =>
    Object.freeze({
        kind: "statement_assign",
        path,
        expression,
        loc,
    });
export type CStmtAugmentedAssign = $.CStmtAugmentedAssign;
export const CStmtAugmentedAssign = (
    op: $s.AugmentedAssignOperation,
    path: $e.CLValue,
    expression: $e.CExpr,
    loc: $c.Loc,
): $.CStmtAugmentedAssign =>
    Object.freeze({
        kind: "statement_augmentedassign",
        op,
        path,
        expression,
        loc,
    });
export type CDestructPattern = $.CDestructPattern;
export const CDestructPattern = (
    field: $c.Id,
    variable: $c.OptionalId,
): $.CDestructPattern =>
    Object.freeze({
        field,
        variable,
    });
export type CStmtDestruct = $.CStmtDestruct;
export const CStmtDestruct = (
    type_: $c.TypeId,
    identifiers: $c.Ordered<$.CDestructPattern>,
    ignoreUnspecifiedFields: boolean,
    expression: $e.CExpr,
    loc: $c.Loc,
): $.CStmtDestruct =>
    Object.freeze({
        kind: "statement_destruct",
        type: type_,
        identifiers,
        ignoreUnspecifiedFields,
        expression,
        loc,
    });
export type CStmtBlock = $.CStmtBlock;
export const CStmtBlock = (
    statements: $.CStmtList,
    loc: $c.Loc,
): $.CStmtBlock =>
    Object.freeze({
        kind: "statement_block",
        statements,
        loc,
    });
export type CStmtForEach = $.CStmtForEach;
export const CStmtForEach = (
    keyName: $c.OptionalId,
    valueName: $c.OptionalId,
    map: $e.CExpr,
    statements: $.CStmtList,
    loc: $c.Loc,
): $.CStmtForEach =>
    Object.freeze({
        kind: "statement_foreach",
        keyName,
        valueName,
        map,
        statements,
        loc,
    });
export type CCatchBlock = $.CCatchBlock;
export const CCatchBlock = (
    catchName: $c.OptionalId,
    catchStatements: $.CStmtList,
): $.CCatchBlock =>
    Object.freeze({
        name: catchName,
        statements: catchStatements,
    });
export type CStmtTry = $.CStmtTry;
export const CStmtTry = (
    statements: $.CStmtList,
    catchBlock: $.CCatchBlock | undefined,
    loc: $c.Loc,
): $.CStmtTry =>
    Object.freeze({
        kind: "statement_try",
        statements,
        catchBlock,
        loc,
    });
export type CStmtRepeat = $.CStmtRepeat;
export const CStmtRepeat = (
    iterations: $e.CExpr,
    statements: $.CStmtList,
    loc: $c.Loc,
): $.CStmtRepeat =>
    Object.freeze({
        kind: "statement_repeat",
        iterations,
        statements,
        loc,
    });
export type CStmtUntil = $.CStmtUntil;
export const CStmtUntil = (
    condition: $e.CExpr,
    statements: $.CStmtList,
    loc: $c.Loc,
): $.CStmtUntil =>
    Object.freeze({
        kind: "statement_until",
        condition,
        statements,
        loc,
    });
export type CStmtWhile = $.CStmtWhile;
export const CStmtWhile = (
    condition: $e.CExpr,
    statements: $.CStmtList,
    loc: $c.Loc,
): $.CStmtWhile =>
    Object.freeze({
        kind: "statement_while",
        condition,
        statements,
        loc,
    });
export type CStmtList = $.CStmtList;
export type CStmtCondition = $.CStmtCondition;
export const CStmtCondition = (
    condition: $e.CExpr,
    trueStatements: $.CStmtList,
    falseStatements: $.CStmtList | undefined,
    loc: $c.Loc,
): $.CStmtCondition =>
    Object.freeze({
        kind: "statement_condition",
        condition,
        trueStatements,
        falseStatements,
        loc,
    });
export type CStmt = $.CStmt;
