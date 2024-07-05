import {
    AstExpression,
    AstUnaryOperation,
    AstBinaryOperation,
    createAstNode
} from "../grammar/ast";
import { dummySrcInfo } from "../grammar/grammar";
import { Value } from "../types/types";
import { AstValue } from "./types";

export function isValue(ast: AstExpression): boolean {
    switch (
        ast.kind // Missing structs
    ) {
        case "null":
        case "boolean":
        case "number":
        case "string":
            return true;

        case "id":
        case "method_call":
        case "init_of":
        case "op_unary":
        case "op_binary":
        case "conditional":
        case "struct_instance":
        case "field_access":
        case "static_call":
            return false;
    }
}

export function extractValue(ast: AstValue): Value {
    switch (
        ast.kind // Missing structs
    ) {
        case "null":
            return null;
        case "boolean":
            return ast.value;
        case "number":
            return ast.value;
        case "string":
            return ast.value;
    }
}

export function makeValueExpression(value: Value): AstValue {
    if (value === null) {
        const result = createAstNode({
            kind: "null",
            loc: dummySrcInfo,
        });
        return result as AstValue;
    }
    if (typeof value === "string") {
        const result = createAstNode({
            kind: "string",
            value: value,
            loc: dummySrcInfo,
        });
        return result as AstValue;
    }
    if (typeof value === "bigint") {
        const result = createAstNode({
            kind: "number",
            value: value,
            loc: dummySrcInfo,
        });
        return result as AstValue;
    }
    if (typeof value === "boolean") {
        const result = createAstNode({
            kind: "boolean",
            value: value,
            loc: dummySrcInfo,
        });
        return result as AstValue;
    }
    throw new Error(
        `structs, addresses, cells, and comment values are not supported at the moment.`,
    );
}

export function makeUnaryExpression(
    op: AstUnaryOperation,
    operand: AstExpression,
): AstExpression {
    const result = createAstNode({
        kind: "op_unary",
        op: op,
        operand: operand,
        loc: dummySrcInfo,
    });
    return result as AstExpression;
}

export function makeBinaryExpression(
    op: AstBinaryOperation,
    left: AstExpression,
    right: AstExpression,
): AstExpression {
    const result = createAstNode({
        kind: "op_binary",
        op: op,
        left: left,
        right: right,
        loc: dummySrcInfo,
    });
    return result as AstExpression;
}

// Checks if the top level node is a binary op node
export function checkIsBinaryOpNode(ast: AstExpression): boolean {
    return ast.kind === "op_binary";
}

// Checks if top level node is a binary op node
// with a non-value node on the left and
// value node on the right
export function checkIsBinaryOp_NonValue_Value(ast: AstExpression): boolean {
    if (ast.kind === "op_binary") {
        return !isValue(ast.left) && isValue(ast.right);
    } else {
        return false;
    }
}

// Checks if top level node is a binary op node
// with a value node on the left and
// non-value node on the right
export function checkIsBinaryOp_Value_NonValue(ast: AstExpression): boolean {
    if (ast.kind === "op_binary") {
        return isValue(ast.left) && !isValue(ast.right);
    } else {
        return false;
    }
}

// bigint arithmetic

// precondition: the divisor is not zero
// rounds the division result towards negative infinity
export function divFloor(a: bigint, b: bigint): bigint {
    const almostSameSign = a > 0n === b > 0n;
    if (almostSameSign) {
        return a / b;
    }
    return a / b + (a % b === 0n ? 0n : -1n);
}

export function abs(a: bigint): bigint {
    return a < 0n ? -a : a;
}

export function sign(a: bigint): bigint {
    if (a === 0n) return 0n;
    else return a < 0n ? -1n : 1n;
}

// precondition: the divisor is not zero
// rounds the result towards negative infinity
// Uses the fact that a / b * b + a % b == a, for all b != 0.
export function modFloor(a: bigint, b: bigint): bigint {
    return a - divFloor(a, b) * b;
}

