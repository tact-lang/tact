import { Address, Cell, Slice } from "@ton/core";
import {
    AstExpression,
    AstUnaryOperation,
    AstBinaryOperation,
    isLiteral,
    AstNumber,
    AstBoolean,
    AstSimplifiedString,
    AstNull,
    AstCell,
    AstSlice,
    AstAddress,
    AstLiteral,
    AstStructValue,
    AstStructFieldValue,
    AstId,
    AstCommentValue,
    FactoryAst,
} from "./ast";
import { dummySrcInfo, SrcInfo } from "../grammar";

export const getAstUtil = ({ createNode }: FactoryAst) => {
    function makeUnaryExpression(
        op: AstUnaryOperation,
        operand: AstExpression,
    ): AstExpression {
        const result = createNode({
            kind: "op_unary",
            op: op,
            operand: operand,
            loc: dummySrcInfo,
        });
        return result as AstExpression;
    }

    function makeBinaryExpression(
        op: AstBinaryOperation,
        left: AstExpression,
        right: AstExpression,
    ): AstExpression {
        const result = createNode({
            kind: "op_binary",
            op: op,
            left: left,
            right: right,
            loc: dummySrcInfo,
        });
        return result as AstExpression;
    }

    function makeNumberLiteral(n: bigint, loc: SrcInfo): AstNumber {
        const result = createNode({
            kind: "number",
            base: 10,
            value: n,
            loc: loc,
        });
        return result as AstNumber;
    }

    function makeBooleanLiteral(b: boolean, loc: SrcInfo): AstBoolean {
        const result = createNode({
            kind: "boolean",
            value: b,
            loc: loc,
        });
        return result as AstBoolean;
    }

    function makeSimplifiedStringLiteral(
        s: string,
        loc: SrcInfo,
    ): AstSimplifiedString {
        const result = createNode({
            kind: "simplified_string",
            value: s,
            loc: loc,
        });
        return result as AstSimplifiedString;
    }

    function makeCommentLiteral(s: string, loc: SrcInfo): AstCommentValue {
        const result = createNode({
            kind: "comment_value",
            value: s,
            loc: loc,
        });
        return result as AstCommentValue;
    }

    function makeNullLiteral(loc: SrcInfo): AstNull {
        const result = createNode({
            kind: "null",
            loc: loc,
        });
        return result as AstNull;
    }

    function makeCellLiteral(c: Cell, loc: SrcInfo): AstCell {
        const result = createNode({
            kind: "cell",
            value: c,
            loc: loc,
        });
        return result as AstCell;
    }

    function makeSliceLiteral(s: Slice, loc: SrcInfo): AstSlice {
        const result = createNode({
            kind: "slice",
            value: s,
            loc: loc,
        });
        return result as AstSlice;
    }

    function makeAddressLiteral(a: Address, loc: SrcInfo): AstAddress {
        const result = createNode({
            kind: "address",
            value: a,
            loc: loc,
        });
        return result as AstAddress;
    }

    function makeStructFieldValue(
        fieldName: string,
        val: AstLiteral,
        loc: SrcInfo,
    ): AstStructFieldValue {
        const result = createNode({
            kind: "struct_field_value",
            field: createNode({
                kind: "id",
                text: fieldName,
                loc: loc,
            }) as AstId,
            initializer: val,
            loc: loc,
        });
        return result as AstStructFieldValue;
    }

    function makeStructValue(
        fields: AstStructFieldValue[],
        type: AstId,
        loc: SrcInfo,
    ): AstStructValue {
        const result = createNode({
            kind: "struct_value",
            args: fields,
            loc: loc,
            type: type,
        });
        return result as AstStructValue;
    }

    return {
        makeUnaryExpression,
        makeBinaryExpression,
        makeNumberLiteral,
        makeBooleanLiteral,
        makeSimplifiedStringLiteral,
        makeCommentLiteral,
        makeNullLiteral,
        makeCellLiteral,
        makeSliceLiteral,
        makeAddressLiteral,
        makeStructFieldValue,
        makeStructValue,
    };
};

export type AstUtil = ReturnType<typeof getAstUtil>;

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
    return ast.kind === "op_binary" ? isLiteral(ast.right) : false;
}

// Checks if top level node is a binary op node
// with a value node on the left
export function checkIsBinaryOp_With_LeftValue(ast: AstExpression): boolean {
    return ast.kind === "op_binary" ? isLiteral(ast.left) : false;
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
