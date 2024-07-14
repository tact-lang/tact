import {
    FuncAstNode,
    FuncType,
    FuncAstIdExpr,
    FuncAstAssignExpr,
    FuncAstPragma,
    FuncAstComment,
    FuncAstInclude,
    FuncAstModule,
    FuncAstFunction,
    FuncAstVarDefStmt,
    FuncAstReturnStmt,
    FuncAstBlockStmt,
    FuncAstRepeatStmt,
    FuncAstConditionStmt,
    FuncAstDoUntilStmt,
    FuncAstWhileStmt,
    FuncAstExprStmt,
    FuncAstTryCatchStmt,
    FuncAstConstant,
    FuncAstGlobalVariable,
    FuncAstCallExpr,
    FuncAstAugmentedAssignExpr,
    FuncAstTernaryExpr,
    FuncAstBinaryExpr,
    FuncAstUnaryExpr,
    FuncAstNumberExpr,
    FuncAstBoolExpr,
    FuncAstStringExpr,
    FuncAstNilExpr,
    FuncAstApplyExpr,
    FuncAstTupleExpr,
    FuncAstTensorExpr,
    FuncAstUnitExpr,
    FuncAstHoleExpr,
    FuncAstPrimitiveTypeExpr,
} from "./syntax";

import JSONbig from "json-bigint";

/**
 * Provides utilities to print the generated Func AST.
 */
export class FuncFormatter {
    public static dump(node: FuncAstNode): string {
        switch (node.kind) {
            case "id_expr":
                return this.formatIdExpr(node as FuncAstIdExpr);
            case "include":
                return this.formatInclude(node as FuncAstInclude);
            case "pragma":
                return this.formatPragma(node as FuncAstPragma);
            case "comment":
                return this.formatComment(node as FuncAstComment);
            case "int":
            case "cell":
            case "slice":
            case "builder":
            case "cont":
            case "tuple":
            case "tensor":
            case "type":
                return this.formatType(node as FuncType);
            case "module":
                return this.formatModule(node as FuncAstModule);
            case "function":
                return this.formatFunction(node as FuncAstFunction);
            case "var_def_stmt":
                return this.formatVarDefStmt(node as FuncAstVarDefStmt);
            case "return_stmt":
                return this.formatReturnStmt(node as FuncAstReturnStmt);
            case "block_stmt":
                return this.formatBlockStmt(node as FuncAstBlockStmt);
            case "repeat_stmt":
                return this.formatRepeatStmt(node as FuncAstRepeatStmt);
            case "condition_stmt":
                return this.formatConditionStmt(node as FuncAstConditionStmt);
            case "do_until_stmt":
                return this.formatDoUntilStmt(node as FuncAstDoUntilStmt);
            case "while_stmt":
                return this.formatWhileStmt(node as FuncAstWhileStmt);
            case "expr_stmt":
                return this.formatExprStmt(node as FuncAstExprStmt);
            case "try_catch_stmt":
                return this.formatTryCatchStmt(node as FuncAstTryCatchStmt);
            case "constant":
                return this.formatConstant(node as FuncAstConstant);
            case "global_variable":
                return this.formatGlobalVariable(node as FuncAstGlobalVariable);
            case "call_expr":
                return this.formatCallExpr(node as FuncAstCallExpr);
            case "assign_expr":
                return this.formatAssignExpr(node as FuncAstAssignExpr);
            case "augmented_assign_expr":
                return this.formatAugmentedAssignExpr(
                    node as FuncAstAugmentedAssignExpr,
                );
            case "ternary_expr":
                return this.formatTernaryExpr(node as FuncAstTernaryExpr);
            case "binary_expr":
                return this.formatBinaryExpr(node as FuncAstBinaryExpr);
            case "unary_expr":
                return this.formatUnaryExpr(node as FuncAstUnaryExpr);
            case "number_expr":
                return this.formatNumberExpr(node as FuncAstNumberExpr);
            case "bool_expr":
                return this.formatBoolExpr(node as FuncAstBoolExpr);
            case "string_expr":
                return this.formatStringExpr(node as FuncAstStringExpr);
            case "nil_expr":
                return this.formatNilExpr(node as FuncAstNilExpr);
            case "apply_expr":
                return this.formatApplyExpr(node as FuncAstApplyExpr);
            case "tuple_expr":
                return this.formatTupleExpr(node as FuncAstTupleExpr);
            case "tensor_expr":
                return this.formatTensorExpr(node as FuncAstTensorExpr);
            case "unit_expr":
                return this.formatUnitExpr(node as FuncAstUnitExpr);
            case "hole_expr":
                return this.formatHoleExpr(node as FuncAstHoleExpr);
            case "primitive_type_expr":
                return this.formatPrimitiveTypeExpr(
                    node as FuncAstPrimitiveTypeExpr,
                );
            default:
                throw new Error(`Unsupported node: ${JSONbig.stringify(node, null, 2)}`);
        }
    }

    private static formatModule(node: FuncAstModule): string {
        return node.entries.map((entry) => this.dump(entry)).join("\n");
    }

    private static formatFunction(node: FuncAstFunction): string {
        const attrs = node.attrs.join(" ");
        const name = node.name;
        const params = node.params
            .map((param) => `${this.dump(param.ty)} ${param.name}`)
            .join(", ");
        const returnType = this.dump(node.returnTy);
        const body = node.body.map((stmt) => this.dump(stmt)).join("\n");
        return `${returnType} ${name}(${params}) ${attrs} {\n${body}\n}`;
    }

    private static formatVarDefStmt(node: FuncAstVarDefStmt): string {
        const type = node.ty ? `${this.dump(node.ty)} ` : "";
        const init = node.init ? ` = ${this.dump(node.init)}` : "";
        return `var ${node.name}: ${type}${init};`;
    }

    private static formatReturnStmt(node: FuncAstReturnStmt): string {
        const value = node.value ? ` ${this.dump(node.value)}` : "";
        return `return${value};`;
    }

    private static formatBlockStmt(node: FuncAstBlockStmt): string {
        const body = node.body.map((stmt) => this.dump(stmt)).join("\n");
        return `{\n${body}\n}`;
    }

    private static formatRepeatStmt(node: FuncAstRepeatStmt): string {
        const condition = this.dump(node.condition);
        const body = node.body.map((stmt) => this.dump(stmt)).join("\n");
        return `repeat ${condition} {\n${body}\n}`;
    }

    private static formatConditionStmt(node: FuncAstConditionStmt): string {
        const condition = node.condition ? this.dump(node.condition) : "";
        const ifnot = node.ifnot ? "ifnot" : "if";
        const thenBlock = node.body.map((stmt) => this.dump(stmt)).join("\n");
        const elseBlock = node.else ? this.formatConditionStmt(node.else) : "";
        return `${ifnot} ${condition} {\n${thenBlock}\n}${elseBlock ? ` else {\n${elseBlock}\n}` : ""}`;
    }

    private static formatDoUntilStmt(node: FuncAstDoUntilStmt): string {
        const condition = this.dump(node.condition);
        const body = node.body.map((stmt) => this.dump(stmt)).join("\n");
        return `do {\n${body}\n} until ${condition};`;
    }

    private static formatWhileStmt(node: FuncAstWhileStmt): string {
        const condition = this.dump(node.condition);
        const body = node.body.map((stmt) => this.dump(stmt)).join("\n");
        return `while ${condition} {\n${body}\n}`;
    }

    private static formatExprStmt(node: FuncAstExprStmt): string {
        return `${this.dump(node.expr)};`;
    }

    private static formatTryCatchStmt(node: FuncAstTryCatchStmt): string {
        const tryBlock = node.tryBlock
            .map((stmt) => this.dump(stmt))
            .join("\n");
        const catchBlock = node.catchBlock
            .map((stmt) => this.dump(stmt))
            .join("\n");
        const catchVar = node.catchVar ? ` (${node.catchVar})` : "";
        return `try {\n${tryBlock}\n} catch${catchVar} {\n${catchBlock}\n}`;
    }

    private static formatConstant(node: FuncAstConstant): string {
        const type = this.dump(node.ty);
        const init = this.dump(node.init);
        return `const ${type} = ${init};`;
    }

    private static formatGlobalVariable(node: FuncAstGlobalVariable): string {
        const type = this.dump(node.ty);
        return `global ${type} ${node.name};`;
    }

    private static formatCallExpr(node: FuncAstCallExpr): string {
        const fun = this.dump(node.fun);
        const args = node.args.map((arg) => this.dump(arg)).join(", ");
        return `${fun}(${args})`;
    }

    private static formatAssignExpr(node: FuncAstAssignExpr): string {
        const lhs = this.dump(node.lhs);
        const rhs = this.dump(node.rhs);
        return `${lhs} = ${rhs}`;
    }

    private static formatAugmentedAssignExpr(
        node: FuncAstAugmentedAssignExpr,
    ): string {
        const lhs = this.dump(node.lhs);
        const rhs = this.dump(node.rhs);
        return `${lhs} ${node.op} ${rhs}`;
    }

    private static formatTernaryExpr(node: FuncAstTernaryExpr): string {
        const cond = this.dump(node.cond);
        const body = this.dump(node.trueExpr);
        const elseExpr = this.dump(node.falseExpr);
        return `${cond} ? ${body} : ${elseExpr}`;
    }

    private static formatBinaryExpr(node: FuncAstBinaryExpr): string {
        const lhs = this.dump(node.lhs);
        const rhs = this.dump(node.rhs);
        return `${lhs} ${node.op} ${rhs}`;
    }

    private static formatUnaryExpr(node: FuncAstUnaryExpr): string {
        const value = this.dump(node.value);
        return `${node.op}${value}`;
    }

    private static formatNumberExpr(node: FuncAstNumberExpr): string {
        return node.value.toString();
    }

    private static formatBoolExpr(node: FuncAstBoolExpr): string {
        return node.value.toString();
    }

    private static formatStringExpr(node: FuncAstStringExpr): string {
        return `"${node.value}"`;
    }

    private static formatNilExpr(_: FuncAstNilExpr): string {
        return "nil";
    }

    private static formatApplyExpr(node: FuncAstApplyExpr): string {
        const lhs = this.dump(node.lhs);
        const rhs = this.dump(node.rhs);
        return `${lhs} ${rhs}`;
    }

    private static formatTupleExpr(node: FuncAstTupleExpr): string {
        const values = node.values.map((value) => this.dump(value)).join(", ");
        return `[${values}]`;
    }

    private static formatTensorExpr(node: FuncAstTensorExpr): string {
        const values = node.values.map((value) => this.dump(value)).join(", ");
        return `(${values})`;
    }

    private static formatUnitExpr(_: FuncAstUnitExpr): string {
        return "()";
    }

    private static formatHoleExpr(node: FuncAstHoleExpr): string {
        const id = node.id ? node.id : "_";
        const init = this.dump(node.init);
        return `${id} = ${init}`;
    }

    private static formatPrimitiveTypeExpr(
        node: FuncAstPrimitiveTypeExpr,
    ): string {
        return node.ty.kind;
    }

    private static formatIdExpr(node: FuncAstIdExpr): string {
        return node.value;
    }

    private static formatInclude(node: FuncAstInclude): string {
        return `#include ${node.kind}`;
    }

    private static formatPragma(node: FuncAstPragma): string {
        return `#pragma ${node.kind}`;
    }

    private static formatComment(node: FuncAstComment): string {
        return node.values.map((v) => `;; ${v}`).join('\n');
    }

    private static formatType(node: FuncType): string {
        switch (node.kind) {
            case "int":
            case "cell":
            case "slice":
            case "builder":
            case "cont":
            case "tuple":
            case "type":
                return node.kind;
            case "tensor":
                return `(${node.value.map((t) => this.formatType(t)).join(", ")})`;
            default:
                throw new Error(`Unsupported type kind: ${JSONbig.stringify(node, null, 2)}`);
        }
    }
}
