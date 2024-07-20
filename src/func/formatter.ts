import {
    FuncAstNode,
    FuncAstFormalFunctionParam,
    FuncAstFunctionAttribute,
    FuncType,
    FuncAstIdExpr,
    FuncAstAssignExpr,
    FuncAstPragma,
    FuncAstComment,
    FuncAstCR,
    FuncAstInclude,
    FuncAstModule,
    FuncAstFunctionDeclaration,
    FuncAstFunctionDefinition,
    FuncAstAsmFunction,
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
    FuncAstHexNumberExpr,
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
    /**
     * Limit for the length of a single line.
     * @default 100
     */
    private lineLengthLimit: number;
    /**
     * Number of spaces used for identation.
     * @default 4
     */
    private indent: number;
    private currentIndent: number;

    constructor(
        params: Partial<{ indent: number; lineLengthLimit: number }> = {},
    ) {
        const { indent = 4, lineLengthLimit = 100 } = params;
        this.lineLengthLimit = lineLengthLimit;
        this.indent = indent;
        this.currentIndent = 0;
    }

    public dump(node: FuncAstNode): string {
        switch (node.kind) {
            case "id_expr":
                return this.formatIdExpr(node as FuncAstIdExpr);
            case "include":
                return this.formatInclude(node as FuncAstInclude);
            case "pragma":
                return this.formatPragma(node as FuncAstPragma);
            case "comment":
                return this.formatComment(node as FuncAstComment);
            case "cr":
                return this.formatCR(node as FuncAstCR);
            case "int":
            case "hole":
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
            case "function_declaration":
                return this.formatFunctionDeclaration(
                    node as FuncAstFunctionDeclaration,
                );
            case "function_definition":
                return this.formatFunctionDefinition(
                    node as FuncAstFunctionDefinition,
                );
            case "asm_function_definition":
                return this.formatAsmFunction(
                    node as FuncAstAsmFunction,
                );
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
            case "hex_number_expr":
                return this.formatHexNumberExpr(node as FuncAstHexNumberExpr);
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
                throw new Error(
                    `Unsupported node: ${JSONbig.stringify(node, null, 2)}`,
                );
        }
    }

    private formatModule(node: FuncAstModule): string {
        return node.entries
            .map((entry, index) => {
                const previousEntry = node.entries[index - 1];
                const isSequentialPragmaOrInclude =
                    previousEntry &&
                    previousEntry.kind === entry.kind &&
                    (entry.kind === "include" || entry.kind === "pragma");
                const isPreviousCommentSkipCR =
                    previousEntry &&
                    previousEntry.kind === "comment" &&
                    (previousEntry as FuncAstComment).skipCR;
                const separator =
                    isSequentialPragmaOrInclude || isPreviousCommentSkipCR
                        ? "\n"
                        : "\n\n";
                return (index > 0 ? separator : "") + this.dump(entry);
            })
            .join("");
    }

    private formatFunctionSignature(
        name: FuncAstIdExpr,
        attrs: FuncAstFunctionAttribute[],
        params: FuncAstFormalFunctionParam[],
        returnTy: FuncType,
    ): string {
        const attrsStr = attrs.join(" ");
        const nameStr = this.dump(name);
        const paramsStr = params
            .map((param) => `${this.dump(param.ty)} ${this.dump(param.name)}`)
            .join(", ");
        const returnTypeStr = this.dump(returnTy);
        return `${returnTypeStr} ${nameStr}(${paramsStr}) ${attrsStr}`;
    }

    private formatFunctionDeclaration(
        node: FuncAstFunctionDeclaration,
    ): string {
        const signature = this.formatFunctionSignature(
            node.name,
            node.attrs,
            node.params,
            node.returnTy,
        );
        return `${signature};`;
    }

    private formatFunctionDefinition(node: FuncAstFunctionDefinition): string {
        const signature = this.formatFunctionSignature(
            node.name,
            node.attrs,
            node.params,
            node.returnTy,
        );
        const body = this.formatIndentedBlock(
            node.body.map((stmt) => this.dump(stmt)).join("\n"),
        );
        return `${signature} {\n${body}\n}`;
    }

    private formatAsmFunction(node: FuncAstAsmFunction): string {
        const signature = this.formatFunctionSignature(
            node.name,
            node.attrs,
            node.params,
            node.returnTy,
        );
        return `${signature} asm ${this.dump(node.rawAsm)};`;
    }

    private formatVarDefStmt(node: FuncAstVarDefStmt): string {
        const name = this.dump(node.name);
        const type = node.ty ? this.dump(node.ty) : "var";
        const init = node.init ? ` = ${this.dump(node.init)}` : "";
        return `${type} ${name}${init};`;
    }

    private formatReturnStmt(node: FuncAstReturnStmt): string {
        const value = node.value ? ` ${this.dump(node.value)}` : "";
        return `return${value};`;
    }

    private formatBlockStmt(node: FuncAstBlockStmt): string {
        const body = this.formatIndentedBlock(
            node.body
                .map((stmt, index) => {
                    const previousStmt = node.body[index - 1];
                    const isPreviousCommentSkipCR =
                        previousStmt &&
                        previousStmt.kind === "comment" &&
                        (previousStmt as FuncAstComment).skipCR;
                    const separator = isPreviousCommentSkipCR ? "" : "\n";
                    return (index > 0 ? separator : "") + this.dump(stmt);
                })
                .join(""),
        );
        return `{\n${body}\n}`;
    }

    private formatRepeatStmt(node: FuncAstRepeatStmt): string {
        const condition = this.dump(node.condition);
        const body = this.formatIndentedBlock(
            node.body.map((stmt) => this.dump(stmt)).join("\n"),
        );
        return `repeat ${condition} {\n${body}\n}`;
    }

    private formatConditionStmt(node: FuncAstConditionStmt): string {
        const condition = node.condition
            ? `(${this.dump(node.condition)})`
            : "";
        const ifnot = node.ifnot ? "ifnot" : "if";
        const bodyBlock = this.formatIndentedBlock(
            node.body.map((stmt) => this.dump(stmt)).join("\n"),
        );
        const elseBlock = node.else
            ? ` else {\n${this.formatIndentedBlock(this.dump(node.else))}\n}`
            : "";
        return `${ifnot} ${condition} {\n${bodyBlock}\n}${elseBlock}`;
    }

    private formatDoUntilStmt(node: FuncAstDoUntilStmt): string {
        const condition = this.dump(node.condition);
        const body = this.formatIndentedBlock(
            node.body.map((stmt) => this.dump(stmt)).join("\n"),
        );
        return `do {\n${body}\n} until ${condition};`;
    }

    private formatWhileStmt(node: FuncAstWhileStmt): string {
        const condition = this.dump(node.condition);
        const body = this.formatIndentedBlock(
            node.body.map((stmt) => this.dump(stmt)).join("\n"),
        );
        return `while ${condition} {\n${body}\n}`;
    }

    private formatExprStmt(node: FuncAstExprStmt): string {
        return `${this.dump(node.expr)};`;
    }

    private formatTryCatchStmt(node: FuncAstTryCatchStmt): string {
        const tryBlock = this.formatIndentedBlock(
            node.tryBlock.map((stmt) => this.dump(stmt)).join("\n"),
        );
        const catchBlock = this.formatIndentedBlock(
            node.catchBlock.map((stmt) => this.dump(stmt)).join("\n"),
        );
        const catchVar = node.catchVar ? ` (${this.dump(node.catchVar)})` : "";
        return `try {\n${tryBlock}\n} catch${catchVar} {\n${catchBlock}\n}`;
    }

    private formatConstant(node: FuncAstConstant): string {
        const type = this.dump(node.ty);
        const init = this.dump(node.init);
        return `const ${type} = ${init};`;
    }

    private formatGlobalVariable(node: FuncAstGlobalVariable): string {
        const name = this.dump(node.name);
        const type = this.dump(node.ty);
        return `global ${type} ${name};`;
    }

    private formatCallExpr(node: FuncAstCallExpr): string {
        const receiver =
            node.receiver === undefined ? "" : `${this.dump(node.receiver)}.`;
        const fun = this.dump(node.fun);
        const args = node.args.map((arg) => this.dump(arg)).join(", ");
        return `${receiver}${fun}(${args})`;
    }

    private formatAssignExpr(node: FuncAstAssignExpr): string {
        const lhs = this.dump(node.lhs);
        const rhs = this.dump(node.rhs);
        return `${lhs} = ${rhs}`;
    }

    private formatAugmentedAssignExpr(
        node: FuncAstAugmentedAssignExpr,
    ): string {
        const lhs = this.dump(node.lhs);
        const rhs = this.dump(node.rhs);
        return `${lhs} ${node.op} ${rhs}`;
    }

    private formatTernaryExpr(node: FuncAstTernaryExpr): string {
        const cond = this.dump(node.cond);
        const body = this.dump(node.trueExpr);
        const elseExpr = this.dump(node.falseExpr);
        return `${cond} ? ${body} : ${elseExpr}`;
    }

    private formatBinaryExpr(node: FuncAstBinaryExpr): string {
        const lhs = this.dump(node.lhs);
        const rhs = this.dump(node.rhs);
        return `${lhs} ${node.op} ${rhs}`;
    }

    private formatUnaryExpr(node: FuncAstUnaryExpr): string {
        const value = this.dump(node.value);
        return `${node.op}${value}`;
    }

    private formatNumberExpr(node: FuncAstNumberExpr): string {
        return node.value.toString();
    }

    private formatHexNumberExpr(node: FuncAstHexNumberExpr): string {
        return node.value;
    }

    private formatBoolExpr(node: FuncAstBoolExpr): string {
        return node.value.toString();
    }

    private formatStringExpr(node: FuncAstStringExpr): string {
        const ty = node.ty ? node.ty : "";
        return `"${node.value}"${ty}`;
    }

    private formatNilExpr(_: FuncAstNilExpr): string {
        return "nil";
    }

    private formatApplyExpr(node: FuncAstApplyExpr): string {
        const lhs = this.dump(node.lhs);
        const rhs = this.dump(node.rhs);
        return `${lhs} ${rhs}`;
    }

    private formatTupleExpr(node: FuncAstTupleExpr): string {
        const values = node.values.map((value) => this.dump(value)).join(", ");
        return `[${values}]`;
    }

    private formatTensorExpr(node: FuncAstTensorExpr): string {
        const values = node.values.map((value) => this.dump(value));
        const singleLine = `(${values.join(", ")})`;

        if (singleLine.length <= this.lineLengthLimit) {
            return singleLine;
        } else {
            const indentedValues = values
                .map((value) => this.indentLine(value))
                .join(",\n");
            return `(\n${indentedValues}\n${" ".repeat(this.currentIndent)})`;
        }
    }

    private formatUnitExpr(_: FuncAstUnitExpr): string {
        return "()";
    }

    private formatHoleExpr(node: FuncAstHoleExpr): string {
        const id = node.id ? node.id : "_";
        const init = this.dump(node.init);
        return `${id} = ${init}`;
    }

    private formatPrimitiveTypeExpr(node: FuncAstPrimitiveTypeExpr): string {
        return node.ty.kind;
    }

    private formatIdExpr(node: FuncAstIdExpr): string {
        return node.value;
    }

    private formatInclude(node: FuncAstInclude): string {
        return `#include "${node.value}";`;
    }

    private formatPragma(node: FuncAstPragma): string {
        return `#pragma ${node.value};`;
    }

    private formatComment(node: FuncAstComment): string {
        return node.values
            .map((v) => `${node.style}${v.length > 0 ? " " + v : ""}`)
            .join("\n");
    }

    private formatCR(node: FuncAstCR): string {
        return '\n'.repeat(node.lines);
    }

    private formatType(node: FuncType): string {
        switch (node.kind) {
            case "hole":
                return "_";
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
                throw new Error(
                    `Unsupported type kind: ${JSONbig.stringify(node, null, 2)}`,
                );
        }
    }

    private indentLine(line: string): string {
        return " ".repeat(this.currentIndent + this.indent) + line;
    }

    private formatIndentedBlock(content: string): string {
        this.currentIndent += this.indent;
        const indentedContent = content
            .split("\n")
            .map((line) => " ".repeat(this.currentIndent) + line)
            .join("\n");
        this.currentIndent -= this.indent;
        return indentedContent;
    }
}
