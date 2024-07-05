import {
    AstExpression,
    AstUnaryOperation,
    AstBinaryOperation,
    createAstNode,
    AstStructFieldInitializer,
} from "../grammar/ast";
import { Value } from "../types/types";
import { DUMMY_LOCATION, ValueExpression } from "./types";

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

export function extractValue(ast: ValueExpression): Value {
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

export function makeValueExpression(value: Value): ValueExpression {
    if (value === null) {
        const result = createAstNode({
            kind: "null",
            loc: DUMMY_LOCATION,
        });
        return result as ValueExpression;
    }
    if (typeof value === "string") {
        const result = createAstNode({
            kind: "string",
            value: value,
            loc: DUMMY_LOCATION,
        });
        return result as ValueExpression;
    }
    if (typeof value === "bigint") {
        const result = createAstNode({
            kind: "number",
            value: value,
            loc: DUMMY_LOCATION,
        });
        return result as ValueExpression;
    }
    if (typeof value === "boolean") {
        const result = createAstNode({
            kind: "boolean",
            value: value,
            loc: DUMMY_LOCATION,
        });
        return result as ValueExpression;
    }
    throw `structs, addresses, cells, and comment values are not supported at the moment`;
}

export function makeUnaryExpression(
    op: AstUnaryOperation,
    operand: AstExpression,
): AstExpression {
    const result = createAstNode({
        kind: "op_unary",
        op: op,
        operand: operand,
        loc: DUMMY_LOCATION,
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
        loc: DUMMY_LOCATION,
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

// Test equality of ASTExpressions.
export function areEqualExpressions(
    ast1: AstExpression,
    ast2: AstExpression,
): boolean {
    switch (ast1.kind) {
        case "null":
            return ast2.kind === "null";
        case "boolean":
            return ast2.kind === "boolean" ? ast1.value === ast2.value : false;
        case "number":
            return ast2.kind === "number" ? ast1.value === ast2.value : false;
        case "string":
            return ast2.kind === "string" ? ast1.value === ast2.value : false;
        case "id":
            return ast2.kind === "id" ? ast1.text === ast2.text : false;
        case "method_call":
            if (ast2.kind === "method_call") {
                return (
                    ast1.method.text === ast2.method.text &&
                    areEqualExpressions(ast1.self, ast2.self) &&
                    areEqualExpressionArrays(ast1.args, ast2.args)
                );
            } else {
                return false;
            }
        case "init_of":
            if (ast2.kind === "init_of") {
                return (
                    ast1.contract.text === ast2.contract.text &&
                    areEqualExpressionArrays(ast1.args, ast2.args)
                );
            } else {
                return false;
            }
        case "op_unary":
            if (ast2.kind === "op_unary") {
                return (
                    ast1.op === ast2.op &&
                    areEqualExpressions(ast1.operand, ast2.operand)
                );
            } else {
                return false;
            }
        case "op_binary":
            if (ast2.kind === "op_binary") {
                return (
                    ast1.op === ast2.op &&
                    areEqualExpressions(ast1.left, ast2.left) &&
                    areEqualExpressions(ast1.right, ast2.right)
                );
            } else {
                return false;
            }
        case "conditional":
            if (ast2.kind === "conditional") {
                return (
                    areEqualExpressions(ast1.condition, ast2.condition) &&
                    areEqualExpressions(ast1.thenBranch, ast2.thenBranch) &&
                    areEqualExpressions(ast1.elseBranch, ast2.elseBranch)
                );
            } else {
                return false;
            }
        case "struct_instance":
            if (ast2.kind === "struct_instance") {
                return (
                    ast1.type.text === ast2.type.text &&
                    areEqualParameterArrays(ast1.args, ast2.args)
                );
            } else {
                return false;
            }
        case "field_access":
            if (ast2.kind === "field_access") {
                return (
                    ast1.field.text === ast2.field.text &&
                    areEqualExpressions(ast1.aggregate, ast2.aggregate)
                );
            } else {
                return false;
            }
        case "static_call":
            if (ast2.kind === "static_call") {
                return (
                    ast1.function.text === ast2.function.text &&
                    areEqualExpressionArrays(ast1.args, ast2.args)
                );
            } else {
                return false;
            }
    }
}

function areEqualParameters(
    arg1: AstStructFieldInitializer,
    arg2: AstStructFieldInitializer,
): boolean {
    return (
        arg1.field.text === arg2.field.text &&
        areEqualExpressions(arg1.initializer, arg2.initializer)
    );
}

function areEqualParameterArrays(
    arr1: AstStructFieldInitializer[],
    arr2: AstStructFieldInitializer[],
): boolean {
    if (arr1.length !== arr2.length) {
        return false;
    }

    for (let i = 0; i < arr1.length; i++) {
        if (!areEqualParameters(arr1[i]!, arr2[i]!)) {
            return false;
        }
    }

    return true;
}

function areEqualExpressionArrays(
    arr1: AstExpression[],
    arr2: AstExpression[],
): boolean {
    if (arr1.length !== arr2.length) {
        return false;
    }

    for (let i = 0; i < arr1.length; i++) {
        if (!areEqualExpressions(arr1[i]!, arr2[i]!)) {
            return false;
        }
    }

    return true;
}
