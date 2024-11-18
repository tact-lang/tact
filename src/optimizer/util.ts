import {
    AstExpression,
    AstUnaryOperation,
    AstBinaryOperation,
    createAstNode,
    AstValue,
    isValue,
    AstId,
    AstStructFieldInitializer,
    idText,
} from "../grammar/ast";
import { dummySrcInfo, SrcInfo } from "../grammar/grammar";
import { throwInternalCompilerError } from "../errors";
import { StructValue, Value } from "../types/types";

export function extractValue(ast: AstValue): Value {
    switch (ast.kind) {
        case "null":
            return null;
        case "boolean":
            return ast.value;
        case "number":
            return ast.value;
        case "string":
            return ast.value;
        case "struct_instance":
            return ast.args.reduce(
                (resObj, fieldWithInit) => {
                    resObj[idText(fieldWithInit.field)] = extractValue(
                        fieldWithInit.initializer as AstValue,
                    );
                    return resObj;
                },
                { $tactStruct: idText(ast.type) } as StructValue,
            );
    }
}

export function makeValueExpression(
    value: Value,
    baseSrc: SrcInfo = dummySrcInfo,
): AstValue {
    const valueString = valueToString(value);
    // Keep all the info of the original source, but force the contents to have the
    // new expression.
    const newSrc = new SrcInfo(
        { ...baseSrc.interval, contents: valueString },
        baseSrc.file,
        baseSrc.origin,
    );

    if (value === null) {
        const result = createAstNode({
            kind: "null",
            loc: newSrc,
        });
        return result as AstValue;
    }
    if (typeof value === "string") {
        const result = createAstNode({
            kind: "string",
            value: value,
            loc: newSrc,
        });
        return result as AstValue;
    }
    if (typeof value === "bigint") {
        const result = createAstNode({
            kind: "number",
            base: 10,
            value: value,
            loc: newSrc,
        });
        return result as AstValue;
    }
    if (typeof value === "boolean") {
        const result = createAstNode({
            kind: "boolean",
            value: value,
            loc: newSrc,
        });
        return result as AstValue;
    }
    if (typeof value === "object" && "$tactStruct" in value) {
        const fields = Object.entries(value)
            .filter(([name, _]) => name !== "$tactStruct")
            .map(([name, val]) => {
                return createAstNode({
                    kind: "struct_field_initializer",
                    field: makeIdExpression(name, baseSrc),
                    initializer: makeValueExpression(val, baseSrc),
                    loc: newSrc,
                }) as AstStructFieldInitializer;
            });
        const result = createAstNode({
            kind: "struct_instance",
            type: makeIdExpression(value["$tactStruct"] as string, baseSrc),
            args: fields,
            loc: newSrc,
        });
        return result as AstValue;
    }
    throwInternalCompilerError(
        "addresses, cells, slices, and comment values are not supported as AST nodes at the moment.",
    );
}

function makeIdExpression(name: string, baseSrc: SrcInfo): AstId {
    const result = createAstNode({
        kind: "id",
        text: name,
        loc: baseSrc,
    });
    return result as AstId;
}

function valueToString(value: Value): string {
    if (value === null) {
        return "null";
    }
    if (typeof value === "string") {
        return value;
    }
    if (typeof value === "bigint") {
        return value.toString();
    }
    if (typeof value === "boolean") {
        return value.toString();
    }
    if (typeof value === "object" && "$tactStruct" in value) {
        const fields = Object.entries(value)
            .filter(([name, _]) => name !== "$tactStruct")
            .map(([name, val]) => {
                return `${name}: ${valueToString(val)}`;
            })
            .join(", ");
        return `${value["$tactStruct"] as string} { ${fields} }`;
    }
    throwInternalCompilerError(
        "Transformation of addresses, cells, slices or comment values into strings is not supported at the moment.",
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
