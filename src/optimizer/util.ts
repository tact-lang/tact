import {
    AstExpression,
    AstUnaryOperation,
    AstBinaryOperation,
    AstValue,
    isValue,
    FactoryAst,
} from "../grammar/ast";
import { dummySrcInfo } from "../grammar";
import { throwInternalCompilerError } from "../errors";
import { Value } from "../types/types";

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

export const getAstUtil = ({ createNode }: FactoryAst) => {
    function makeValueExpression(value: Value): AstValue {
        if (value === null) {
            const result = createNode({
                kind: "null",
                loc: dummySrcInfo,
            });
            return result as AstValue;
        }
        if (typeof value === "string") {
            const result = createNode({
                kind: "string",
                value: value,
                loc: dummySrcInfo,
            });
            return result as AstValue;
        }
        if (typeof value === "bigint") {
            const result = createNode({
                kind: "number",
                base: 10,
                value: value,
                loc: dummySrcInfo,
            });
            return result as AstValue;
        }
        if (typeof value === "boolean") {
            const result = createNode({
                kind: "boolean",
                value: value,
                loc: dummySrcInfo,
            });
            return result as AstValue;
        }
        throwInternalCompilerError(
            `structs, addresses, cells, and comment values are not supported at the moment.`,
        );
    }

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

    return {
        makeValueExpression,
        makeUnaryExpression,
        makeBinaryExpression,
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
