import type * as $ from "@/next/ast/lowered-stmt";
import type * as $e from "@/next/ast/lowered-expr";
import type * as $c from "@/next/ast/common";
import type { AugmentedAssignOperation } from "@/next/ast/statement";

export type LStmtLet = $.LStmtLet;
export const LStmtLet = (name: $c.OptionalId, expression: $e.LExpr, loc: $c.Loc): $.LStmtLet => Object.freeze({
  kind: "let",
  name,
  expression,
  loc
});
export const isLStmtLet = ($value: LStmtLet) => $value.kind === "let";
export type LStmtReturn = $.LStmtReturn;
export const LStmtReturn = (expression: $e.LExpr | undefined, loc: $c.Loc): $.LStmtReturn => Object.freeze({
  kind: "return",
  expression,
  loc
});
export const isLStmtReturn = ($value: LStmtReturn) => $value.kind === "return";
export type LStmtExpression = $.LStmtExpression;
export const LStmtExpression = (expression: $e.LExpr, loc: $c.Loc): $.LStmtExpression => Object.freeze({
  kind: "expression",
  expression,
  loc
});
export const isLStmtExpression = ($value: LStmtExpression) => $value.kind === "expression";
export type LStmtAssign = $.LStmtAssign;
export const LStmtAssign = (path: $e.LLValue, expression: $e.LExpr, loc: $c.Loc): $.LStmtAssign => Object.freeze({
  kind: "assign",
  path,
  expression,
  loc
});
export const isLStmtAssign = ($value: LStmtAssign) => $value.kind === "assign";
export type LStmtAugmentedAssign = $.LStmtAugmentedAssign;
export const LStmtAugmentedAssign = (op: AugmentedAssignOperation, path: $e.LLValue, expression: $e.LExpr, loc: $c.Loc): $.LStmtAugmentedAssign => Object.freeze({
  kind: "augmentedassign",
  op,
  path,
  expression,
  loc
});
export const isLStmtAugmentedAssign = ($value: LStmtAugmentedAssign) => $value.kind === "augmentedassign";
export type LDestructPattern = $.LDestructPattern;
export const LDestructPattern = (field: $c.Id, variable: $c.OptionalId): $.LDestructPattern => Object.freeze({
  field,
  variable
});
export type LStmtDestruct = $.LStmtDestruct;
export const LStmtDestruct = (type_: $c.TypeId, identifiers: $c.Ordered<$.LDestructPattern>, ignoreUnspecifiedFields: boolean, expression: $e.LExpr, loc: $c.Loc): $.LStmtDestruct => Object.freeze({
  kind: "destruct",
  type: type_,
  identifiers,
  ignoreUnspecifiedFields,
  expression,
  loc
});
export const isLStmtDestruct = ($value: LStmtDestruct) => $value.kind === "destruct";
export type LStmtBlock = $.LStmtBlock;
export const LStmtBlock = (statements: $.LStmtList, loc: $c.Loc): $.LStmtBlock => Object.freeze({
  kind: "block",
  statements,
  loc
});
export const isLStmtBlock = ($value: LStmtBlock) => $value.kind === "block";
export type LStmtForEach = $.LStmtForEach;
export const LStmtForEach = (keyName: $c.OptionalId, valueName: $c.OptionalId, map: $e.LExpr, statements: $.LStmtList, loc: $c.Loc): $.LStmtForEach => Object.freeze({
  kind: "foreach",
  keyName,
  valueName,
  map,
  statements,
  loc
});
export const isLStmtForEach = ($value: LStmtForEach) => $value.kind === "foreach";
export type LCatchBlock = $.LCatchBlock;
export const LCatchBlock = (name: $c.OptionalId, statements: $.LStmtList): $.LCatchBlock => Object.freeze({
  name,
  statements
});
export type LStmtTry = $.LStmtTry;
export const LStmtTry = (statements: $.LStmtList, catchBlock: $.LCatchBlock | undefined, loc: $c.Loc): $.LStmtTry => Object.freeze({
  kind: "try",
  statements,
  catchBlock,
  loc
});
export const isLStmtTry = ($value: LStmtTry) => $value.kind === "try";
export type LStmtRepeat = $.LStmtRepeat;
export const LStmtRepeat = (iterations: $e.LExpr, statements: $.LStmtList, loc: $c.Loc): $.LStmtRepeat => Object.freeze({
  kind: "repeat",
  iterations,
  statements,
  loc
});
export const isLStmtRepeat = ($value: LStmtRepeat) => $value.kind === "repeat";
export type LStmtUntil = $.LStmtUntil;
export const LStmtUntil = (condition: $e.LExpr, statements: $.LStmtList, loc: $c.Loc): $.LStmtUntil => Object.freeze({
  kind: "until",
  condition,
  statements,
  loc
});
export const isLStmtUntil = ($value: LStmtUntil) => $value.kind === "until";
export type LStmtWhile = $.LStmtWhile;
export const LStmtWhile = (condition: $e.LExpr, statements: $.LStmtList, loc: $c.Loc): $.LStmtWhile => Object.freeze({
  kind: "while",
  condition,
  statements,
  loc
});
export const isLStmtWhile = ($value: LStmtWhile) => $value.kind === "while";
export type LStmtList = $.LStmtList;
export type LStmtCondition = $.LStmtCondition;
export const LStmtCondition = (condition: $e.LExpr, trueStatements: $.LStmtList, falseStatements: $.LStmtList | undefined, loc: $c.Loc): $.LStmtCondition => Object.freeze({
  kind: "condition",
  condition,
  trueStatements,
  falseStatements,
  loc
});
export const isLStmtCondition = ($value: LStmtCondition) => $value.kind === "condition";
export type LStmt = $.LStmt;