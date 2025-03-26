import type { Address, Cell, Slice } from "@ton/core";
import type * as Ast from "./ast";
import type { FactoryAst } from "./ast-helpers";
import { isLiteral } from "./ast-helpers";
import type { SrcInfo } from "../grammar";
import { dummySrcInfo } from "../grammar";

export const getAstUtil = ({ createNode }: FactoryAst) => {
    function makeUnaryExpression(
        op: Ast.UnaryOperation,
        operand: Ast.Expression,
    ): Ast.Expression {
        const result = createNode({
            kind: "op_unary",
            op: op,
            operand: operand,
            loc: dummySrcInfo,
        });
        return result as Ast.Expression;
    }

    function makeBinaryExpression(
        op: Ast.BinaryOperation,
        left: Ast.Expression,
        right: Ast.Expression,
    ): Ast.Expression {
        const result = createNode({
            kind: "op_binary",
            op: op,
            left: left,
            right: right,
            loc: dummySrcInfo,
        });
        return result as Ast.Expression;
    }

    function makeNumberLiteral(n: bigint, loc: SrcInfo): Ast.Number {
        const result = createNode({
            kind: "number",
            base: 10,
            value: n,
            loc: loc,
        });
        return result as Ast.Number;
    }

    function makeBooleanLiteral(b: boolean, loc: SrcInfo): Ast.Boolean {
        const result = createNode({
            kind: "boolean",
            value: b,
            loc: loc,
        });
        return result as Ast.Boolean;
    }

    function makeSimplifiedStringLiteral(
        s: string,
        loc: SrcInfo,
    ): Ast.SimplifiedString {
        const result = createNode({
            kind: "simplified_string",
            value: s,
            loc: loc,
        });
        return result as Ast.SimplifiedString;
    }

    function makeNullLiteral(loc: SrcInfo): Ast.Null {
        const result = createNode({
            kind: "null",
            loc: loc,
        });
        return result as Ast.Null;
    }

    function makeCellLiteral(c: Cell, loc: SrcInfo): Ast.Cell {
        const result = createNode({
            kind: "cell",
            value: c,
            loc: loc,
        });
        return result as Ast.Cell;
    }

    function makeSliceLiteral(s: Slice, loc: SrcInfo): Ast.Slice {
        const result = createNode({
            kind: "slice",
            value: s,
            loc: loc,
        });
        return result as Ast.Slice;
    }

    function makeAddressLiteral(a: Address, loc: SrcInfo): Ast.Address {
        const result = createNode({
            kind: "address",
            value: a,
            loc: loc,
        });
        return result as Ast.Address;
    }

    function makeStructFieldValue(
        fieldName: string,
        val: Ast.Literal,
        loc: SrcInfo,
    ): Ast.StructFieldValue {
        const result = createNode({
            kind: "struct_field_value",
            field: createNode({
                kind: "id",
                text: fieldName,
                loc: loc,
            }) as Ast.Id,
            initializer: val,
            loc: loc,
        });
        return result as Ast.StructFieldValue;
    }

    function makeStructValue(
        fields: Ast.StructFieldValue[],
        type: Ast.Id,
        loc: SrcInfo,
    ): Ast.StructValue {
        const result = createNode({
            kind: "struct_value",
            args: fields,
            loc: loc,
            type: type,
        });
        return result as Ast.StructValue;
    }

    return {
        makeUnaryExpression,
        makeBinaryExpression,
        makeNumberLiteral,
        makeBooleanLiteral,
        makeSimplifiedStringLiteral,
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
export function checkIsUnaryOpNode(ast: Ast.Expression): boolean {
    return ast.kind === "op_unary";
}

// Checks if the top level node is a binary op node
export function checkIsBinaryOpNode(ast: Ast.Expression): boolean {
    return ast.kind === "op_binary";
}

// Checks if top level node is a binary op node
// with a value node on the right
export function checkIsBinaryOp_With_RightValue(ast: Ast.Expression): boolean {
    return ast.kind === "op_binary" ? isLiteral(ast.right) : false;
}

// Checks if top level node is a binary op node
// with a value node on the left
export function checkIsBinaryOp_With_LeftValue(ast: Ast.Expression): boolean {
    return ast.kind === "op_binary" ? isLiteral(ast.left) : false;
}

// Checks if the top level node is the specified number
export function checkIsNumber(ast: Ast.Expression, n: bigint): boolean {
    return ast.kind === "number" ? ast.value == n : false;
}

export function checkIsName(ast: Ast.Expression): boolean {
    return ast.kind === "id";
}

// Checks if the top level node is the specified boolean
export function checkIsBoolean(ast: Ast.Expression, b: boolean): boolean {
    return ast.kind === "boolean" ? ast.value == b : false;
}

export function binaryOperationFromAugmentedAssignOperation(
    op: Ast.AugmentedAssignOperation,
): Ast.BinaryOperation {
    switch (op) {
        case "+=":
            return "+";
        case "-=":
            return "-";
        case "*=":
            return "*";
        case "/=":
            return "/";
        case "&&=":
            return "&&";
        case "||=":
            return "||";
        case "%=":
            return "%";
        case "|=":
            return "|";
        case "<<=":
            return "<<";
        case ">>=":
            return ">>";
        case "&=":
            return "&";
        case "^=":
            return "^";
    }
}
