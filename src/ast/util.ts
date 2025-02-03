import { Address, Cell, Slice } from "@ton/core";
import * as A from "./ast";
import { isLiteral, FactoryAst } from "./ast-helpers";
import { dummySrcInfo, SrcInfo } from "../grammar";

export const getAstUtil = ({ createNode, cloneNode }: FactoryAst) => {
    /**
     * @deprecated, since it uses dummySrcInfo. Use makeUnaryExpressionLoc instead.
     *
     */
    function makeUnaryExpression(
        op: A.AstUnaryOperation,
        operand: A.AstExpression,
    ): A.AstOpUnary {
        const result = createNode({
            kind: "op_unary",
            op: op,
            operand: operand,
            loc: dummySrcInfo,
        });
        return result as A.AstOpUnary;
    }

    /**
     * @deprecated, since it uses dummySrcInfo. Use makeBinaryExpressionLoc instead.
     *
     */
    function makeBinaryExpression(
        op: A.AstBinaryOperation,
        left: A.AstExpression,
        right: A.AstExpression,
    ): A.AstOpBinary {
        const result = createNode({
            kind: "op_binary",
            op: op,
            left: left,
            right: right,
            loc: dummySrcInfo,
        });
        return result as A.AstOpBinary;
    }

    function makeUnaryExpressionLoc(
        op: A.AstUnaryOperation,
        operand: A.AstExpression,
        loc: SrcInfo,
    ): A.AstOpUnary {
        const result = createNode({
            kind: "op_unary",
            op: op,
            operand: operand,
            loc,
        });
        return result as A.AstOpUnary;
    }

    function makeBinaryExpressionLoc(
        op: A.AstBinaryOperation,
        left: A.AstExpression,
        right: A.AstExpression,
        loc: SrcInfo,
    ): A.AstOpBinary {
        const result = createNode({
            kind: "op_binary",
            op: op,
            left: left,
            right: right,
            loc,
        });
        return result as A.AstOpBinary;
    }

    function makeNumberLiteral(n: bigint, loc: SrcInfo): A.AstNumber {
        const result = createNode({
            kind: "number",
            base: 10,
            value: n,
            loc: loc,
        });
        return result as A.AstNumber;
    }

    function makeBooleanLiteral(b: boolean, loc: SrcInfo): A.AstBoolean {
        const result = createNode({
            kind: "boolean",
            value: b,
            loc: loc,
        });
        return result as A.AstBoolean;
    }

    function makeSimplifiedStringLiteral(
        s: string,
        loc: SrcInfo,
    ): A.AstSimplifiedString {
        const result = createNode({
            kind: "simplified_string",
            value: s,
            loc: loc,
        });
        return result as A.AstSimplifiedString;
    }

    function makeNullLiteral(loc: SrcInfo): A.AstNull {
        const result = createNode({
            kind: "null",
            loc: loc,
        });
        return result as A.AstNull;
    }

    function makeCellLiteral(c: Cell, loc: SrcInfo): A.AstCell {
        const result = createNode({
            kind: "cell",
            value: c,
            loc: loc,
        });
        return result as A.AstCell;
    }

    function makeSliceLiteral(s: Slice, loc: SrcInfo): A.AstSlice {
        const result = createNode({
            kind: "slice",
            value: s,
            loc: loc,
        });
        return result as A.AstSlice;
    }

    function makeAddressLiteral(a: Address, loc: SrcInfo): A.AstAddress {
        const result = createNode({
            kind: "address",
            value: a,
            loc: loc,
        });
        return result as A.AstAddress;
    }

    function makeStructFieldValue(
        fieldName: string,
        val: A.AstLiteral,
        loc: SrcInfo,
    ): A.AstStructFieldValue {
        const result = createNode({
            kind: "struct_field_value",
            field: createNode({
                kind: "id",
                text: fieldName,
                loc: loc,
            }) as A.AstId,
            initializer: val,
            loc: loc,
        });
        return result as A.AstStructFieldValue;
    }

    function makeStructValue(
        fields: A.AstStructFieldValue[],
        type: A.AstId,
        loc: SrcInfo,
    ): A.AstStructValue {
        const result = createNode({
            kind: "struct_value",
            args: fields,
            loc: loc,
            type: type,
        });
        return result as A.AstStructValue;
    }

    function makeAssignStatement(
        path: A.AstExpression,
        expression: A.AstExpression,
        loc: SrcInfo,
    ): A.AstStatementAssign {
        const result = createNode({
            kind: "statement_assign",
            path,
            expression,
            loc,
        });
        return result as A.AstStatementAssign;
    }

    function makeMethodCall(
        self: A.AstExpression,
        method: A.AstId,
        args: A.AstExpression[],
        loc: SrcInfo,
    ): A.AstMethodCall {
        const result = createNode({
            kind: "method_call",
            self,
            method,
            args,
            loc,
        });
        return result as A.AstMethodCall;
    }

    function makeStaticCall(
        fun: A.AstId,
        args: A.AstExpression[],
        loc: SrcInfo,
    ): A.AstStaticCall {
        const result = createNode({
            kind: "static_call",
            function: fun,
            args,
            loc,
        });
        return result as A.AstStaticCall;
    }

    function makeInitOf(
        contract: A.AstId,
        args: A.AstExpression[],
        loc: SrcInfo,
    ): A.AstInitOf {
        const result = createNode({
            kind: "init_of",
            contract,
            args,
            loc,
        });
        return result as A.AstInitOf;
    }

    function changeLocationOfLiteral(
        expr: A.AstLiteral,
        loc: SrcInfo,
    ): A.AstLiteral {
        return cloneNode({ ...expr, loc });
    }

    return {
        changeLocationOfLiteral,
        makeUnaryExpressionLoc,
        makeBinaryExpressionLoc,
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
        makeAssignStatement,
        makeMethodCall,
        makeStaticCall,
        makeInitOf,
    };
};

export type AstUtil = ReturnType<typeof getAstUtil>;

// Checks if the top level node is an unary op node
export function checkIsUnaryOpNode(ast: A.AstExpression): boolean {
    return ast.kind === "op_unary";
}

// Checks if the top level node is a binary op node
export function checkIsBinaryOpNode(ast: A.AstExpression): boolean {
    return ast.kind === "op_binary";
}

// Checks if top level node is a binary op node
// with a value node on the right
export function checkIsBinaryOp_With_RightValue(ast: A.AstExpression): boolean {
    return ast.kind === "op_binary" ? isLiteral(ast.right) : false;
}

// Checks if top level node is a binary op node
// with a value node on the left
export function checkIsBinaryOp_With_LeftValue(ast: A.AstExpression): boolean {
    return ast.kind === "op_binary" ? isLiteral(ast.left) : false;
}

// Checks if the top level node is the specified number
export function checkIsNumber(ast: A.AstExpression, n: bigint): boolean {
    return ast.kind === "number" ? ast.value == n : false;
}

export function checkIsName(ast: A.AstExpression): boolean {
    return ast.kind === "id";
}

// Checks if the top level node is the specified boolean
export function checkIsBoolean(ast: A.AstExpression, b: boolean): boolean {
    return ast.kind === "boolean" ? ast.value == b : false;
}
