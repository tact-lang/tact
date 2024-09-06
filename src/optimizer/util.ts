import {
    AstExpression,
    AstUnaryOperation,
    AstBinaryOperation,
    createAstNode,
    AstValue,
    isValue,
    AstStructFieldInitializer,
    AstId,
    idText,
    SrcInfo,
} from "../grammar/ast";
import { throwInternalCompilerError } from "../errors";
import { StructValue, Value } from "../types/types";

// This function assumes that the parameter is already a value.
// i.e., that the user called the isValue function to check
// if the parameter is a value.
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
        case "struct_instance":
            return ast.args.reduce((resObj, fieldWithInit) => {
                resObj[idText(fieldWithInit.field)] = extractValue(
                    fieldWithInit.initializer as AstValue
                );
                return resObj;
            }, { $tactStruct: idText(ast.type) } as StructValue);
    }
}

export function makeValueExpression(value: Value, loc: SrcInfo): AstValue {
    if (value === null) {
        const result = createAstNode({
            kind: "null",
            loc: loc,
        });
        return result as AstValue;
    }
    if (typeof value === "string") {
        const result = createAstNode({
            kind: "string",
            value: value,
            loc: loc,
        });
        return result as AstValue;
    }
    if (typeof value === "bigint") {
        const result = createAstNode({
            kind: "number",
            value: value,
            loc: loc,
        });
        return result as AstValue;
    }
    if (typeof value === "boolean") {
        const result = createAstNode({
            kind: "boolean",
            value: value,
            loc: loc,
        });
        return result as AstValue;
    }
    if (typeof value === "object" && "$tactStruct" in value) {
        const fields = Object.entries(value).filter(
            ([name, _]) => name !== "$tactStruct"
        ).map(([name, val]) => {
            return createAstNode({
                kind: "struct_field_initializer",
                field: makeIdExpression(name, loc),
                initializer: makeValueExpression(val, loc),
                loc: loc,
            }) as AstStructFieldInitializer;
        });
        const result = createAstNode({
            kind: "struct_instance",
            type: makeIdExpression(value["$tactStruct"] as string, loc),
            args: fields,
            loc: loc,
        });
        return result as AstValue;
    }
    throwInternalCompilerError(
        `addresses, cells, and comment values are not supported at the moment.`,
        loc
    );
}

function makeIdExpression(name: string, loc: SrcInfo): AstId {
    const result = createAstNode({
        kind: "id",
        text: name,
        loc: loc,
    });
    return result as AstId;   
}

export function makeUnaryExpression(
    op: AstUnaryOperation,
    operand: AstExpression,
    loc: SrcInfo
): AstExpression {
    const result = createAstNode({
        kind: "op_unary",
        op: op,
        operand: operand,
        loc: loc,
    });
    return result as AstExpression;
}

export function makeBinaryExpression(
    op: AstBinaryOperation,
    left: AstExpression,
    right: AstExpression,
    loc: SrcInfo
): AstExpression {
    const result = createAstNode({
        kind: "op_binary",
        op: op,
        left: left,
        right: right,
        loc: loc,
    });
    return result as AstExpression;
}

// Checks if the top level node is an unary op node
export function checkIsUnaryOpNode(ast: AstExpression): boolean {
    return ast.kind === "op_unary";
}

// Checks if the top level node is a binary op node
export function checkIsBinaryOpNode(ast: AstExpression): boolean {
    return ast.kind === "op_binary";
}

// Checks if top level node is a binary op node
// with a value node on the right
export function checkIsBinaryOp_With_RightValue(ast: AstExpression): boolean {
    return ast.kind === "op_binary" ? isValue(ast.right) : false;
}

// Checks if top level node is a binary op node
// with a value node on the left
export function checkIsBinaryOp_With_LeftValue(ast: AstExpression): boolean {
    return ast.kind === "op_binary" ? isValue(ast.left) : false;
}

// Checks if the top level node is the specified number
export function checkIsNumber(ast: AstExpression, n: bigint): boolean {
    return ast.kind === "number" ? ast.value == n : false;
}

export function checkIsName(ast: AstExpression): boolean {
    return ast.kind === "id";
}

// Checks if the top level node is the specified boolean
export function checkIsBoolean(ast: AstExpression, b: boolean): boolean {
    return ast.kind === "boolean" ? ast.value == b : false;
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
