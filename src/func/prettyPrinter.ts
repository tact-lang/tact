import {
    FuncAstNode,
    FuncAstStatement,
    FuncAstModule,
    FuncAstVersionRange,
    FuncAstParameter,
    FuncAstConstant,
    FuncAstGlobalVariable,
    FuncAstFunctionAttribute,
    FuncVarDeclPart,
    FuncAstId,
    FuncAstTypeTensor,
    FuncAstMethodId,
    FuncAstQuotedId,
    FuncAstOperatorId,
    FuncAstPlainId,
    FuncAstUnusedId,
    FuncAstTypeTuple,
    FuncAstHole,
    FuncAstCR,
    FuncAstComment,
    FuncAstPragmaLiteral,
    FuncAstPragmaVersionRange,
    FuncAstPragmaVersionString,
    FuncAstInclude,
    FuncAstGlobalVariablesDeclaration,
    FuncAstConstantsDefinition,
    FuncAstAsmFunctionDefinition,
    FuncAstFunctionDeclaration,
    FuncAstFunctionDefinition,
    FuncAstStatementReturn,
    FuncAstStatementBlock,
    FuncAstStatementConditionIf,
    FuncAstStatementConditionElseIf,
    FuncAstStatementRepeat,
    FuncAstStatementUntil,
    FuncAstStatementWhile,
    FuncAstStatementTryCatch,
    FuncAstStatementExpression,
    FuncAstExpressionAssign,
    FuncAstExpressionConditional,
    FuncAstExpressionCompare,
    FuncAstExpressionBitwiseShift,
    FuncAstExpressionAddBitwise,
    FuncAstExpressionMulBitwise,
    FuncAstExpressionUnary,
    FuncAstExpressionMethod,
    FuncAstExpressionVarDecl,
    FuncAstExpressionFunCall,
    FuncAstExpressionTensor,
    FuncAstExpressionTuple,
    FuncAstIntegerLiteral,
    FuncAstStringLiteral,
    FuncAstType,
    FuncAstTypePrimitive,
    FuncAstTypeMapped,
} from "./grammar";
import { throwUnsupportedNodeError } from "./syntaxUtils";

export class FuncPrettyPrinter {
    private lineLengthLimit: number;
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

    public prettyPrint(node: FuncAstNode): string {
        switch (node.kind) {
            case "module":
                return this.prettyPrintModule(node as FuncAstModule);
            case "pragma_literal":
                return this.prettyPrintPragmaLiteral(
                    node as FuncAstPragmaLiteral,
                );
            case "pragma_version_range":
                return this.prettyPrintPragmaVersionRange(
                    node as FuncAstPragmaVersionRange,
                );
            case "pragma_version_string":
                return this.prettyPrintPragmaVersionString(
                    node as FuncAstPragmaVersionString,
                );
            case "include":
                return this.prettyPrintInclude(node as FuncAstInclude);
            case "global_variables_declaration":
                return this.prettyPrintGlobalVariablesDeclaration(
                    node as FuncAstGlobalVariablesDeclaration,
                );
            case "constants_definition":
                return this.prettyPrintConstantsDefinition(
                    node as FuncAstConstantsDefinition,
                );
            case "asm_function_definition":
                return this.prettyPrintAsmFunctionDefinition(
                    node as FuncAstAsmFunctionDefinition,
                );
            case "function_declaration":
                return this.prettyPrintFunctionDeclaration(
                    node as FuncAstFunctionDeclaration,
                );
            case "function_definition":
                return this.prettyPrintFunctionDefinition(
                    node as FuncAstFunctionDefinition,
                );
            case "statement_return":
                return this.prettyPrintStatementReturn(
                    node as FuncAstStatementReturn,
                );
            case "statement_block":
                return this.prettyPrintStatementBlock(
                    node as FuncAstStatementBlock,
                );
            case "statement_empty":
                return ";";
            case "statement_condition_if":
                return this.prettyPrintStatementConditionIf(
                    node as FuncAstStatementConditionIf,
                );
            case "statement_condition_elseif":
                return this.prettyPrintStatementConditionElseIf(
                    node as FuncAstStatementConditionElseIf,
                );
            case "statement_repeat":
                return this.prettyPrintStatementRepeat(
                    node as FuncAstStatementRepeat,
                );
            case "statement_until":
                return this.prettyPrintStatementUntil(
                    node as FuncAstStatementUntil,
                );
            case "statement_while":
                return this.prettyPrintStatementWhile(
                    node as FuncAstStatementWhile,
                );
            case "statement_try_catch":
                return this.prettyPrintStatementTryCatch(
                    node as FuncAstStatementTryCatch,
                );
            case "statement_expression":
                return this.prettyPrintStatementExpression(
                    node as FuncAstStatementExpression,
                );
            case "expression_assign":
                return this.prettyPrintExpressionAssign(
                    node as FuncAstExpressionAssign,
                );
            case "expression_conditional":
                return this.prettyPrintExpressionConditional(
                    node as FuncAstExpressionConditional,
                );
            case "expression_compare":
                return this.prettyPrintExpressionCompare(
                    node as FuncAstExpressionCompare,
                );
            case "expression_bitwise_shift":
                return this.prettyPrintExpressionBitwiseShift(
                    node as FuncAstExpressionBitwiseShift,
                );
            case "expression_add_bitwise":
                return this.prettyPrintExpressionAddBitwise(
                    node as FuncAstExpressionAddBitwise,
                );
            case "expression_mul_bitwise":
                return this.prettyPrintExpressionMulBitwise(
                    node as FuncAstExpressionMulBitwise,
                );
            case "expression_unary":
                return this.prettyPrintExpressionUnary(
                    node as FuncAstExpressionUnary,
                );
            case "expression_method":
                return this.prettyPrintExpressionMethod(
                    node as FuncAstExpressionMethod,
                );
            case "expression_var_decl":
                return this.prettyPrintExpressionVarDecl(
                    node as FuncAstExpressionVarDecl,
                );
            case "expression_fun_call":
                return this.prettyPrintExpressionFunCall(
                    node as FuncAstExpressionFunCall,
                );
            case "expression_tensor":
                return this.prettyPrintExpressionTensor(
                    node as FuncAstExpressionTensor,
                );
            case "expression_tuple":
                return this.prettyPrintExpressionTuple(
                    node as FuncAstExpressionTuple,
                );
            case "integer_literal":
                return this.prettyPrintIntegerLiteral(
                    node as FuncAstIntegerLiteral,
                );
            case "string_singleline":
            case "string_multiline":
                return this.prettyPrintStringLiteral(
                    node as FuncAstStringLiteral,
                );
            case "comment_singleline":
            case "comment_multiline":
                return this.prettyPrintComment(node as FuncAstComment);
            case "cr":
                return this.prettyPrintCR(node as FuncAstCR);
            case "method_id":
                return this.prettyPrintMethodId(node as FuncAstMethodId);
            case "quoted_id":
                return this.prettyPrintQuotedId(node as FuncAstQuotedId);
            case "operator_id":
                return this.prettyPrintOperatorId(node as FuncAstOperatorId);
            case "plain_id":
                return this.prettyPrintPlainId(node as FuncAstPlainId);
            case "unused_id":
                return this.prettyPrintUnusedId(node as FuncAstUnusedId);
            case "unit":
                return "()";
            default:
                throwUnsupportedNodeError(node);
        }
    }

    public prettyPrintType(ty: FuncAstType): string {
        switch (ty.kind) {
            case "type_var":
                return this.prettyPrint(ty.name as FuncAstId);
            case "type_primitive":
                return this.prettyPrintTypePrimitive(
                    ty as FuncAstTypePrimitive,
                );
            case "type_tensor":
                return this.prettyPrintTypeTensor(ty as FuncAstTypeTensor);
            case "type_tuple":
                return this.prettyPrintTypeTuple(ty as FuncAstTypeTuple);
            case "hole":
                return this.prettyPrintTypeHole(ty as FuncAstHole);
            case "unit":
                return "()";
            case "type_mapped":
                return this.prettyPrintTypeMapped(ty as FuncAstTypeMapped);
            default:
                throwUnsupportedNodeError(ty);
        }
    }

    public prettyPrintFunctionSignature(
        returnType: FuncAstType,
        name: FuncAstId,
        parameters: FuncAstParameter[],
        attributes: FuncAstFunctionAttribute[],
    ): string {
        const returnTypeStr = this.prettyPrintType(returnType);
        const nameStr = this.prettyPrint(name);
        const paramsStr = parameters
            .map((param) => this.prettyPrintParameter(param))
            .join(", ");
        const attrsStr =
            attributes.length > 0
                ? ` ${attributes.map((attr) => this.prettyPrintFunctionAttribute(attr)).join(" ")}`
                : "";
        return `${returnTypeStr} ${nameStr}(${paramsStr})${attrsStr}`;
    }

    public prettyPrintStatements(stmts: FuncAstStatement[]): string {
        return this.prettyPrintIndentedBlock(
            stmts.map(this.prettyPrint.bind(this)).join("\n"),
        );
    }

    private prettyPrintModule(node: FuncAstModule): string {
        return node.items
            .map((item, index) => {
                const previousItem = node.items[index - 1];
                const isSequentialPragmaOrInclude =
                    previousItem &&
                    previousItem.kind === item.kind &&
                    (item.kind === "include" ||
                        item.kind === "pragma_literal" ||
                        item.kind === "pragma_version_range" ||
                        item.kind === "pragma_version_string");
                const separator = isSequentialPragmaOrInclude ? "\n" : "\n\n";
                return (index > 0 ? separator : "") + this.prettyPrint(item);
            })
            .join("");
    }

    private prettyPrintPragmaLiteral(node: FuncAstPragmaLiteral): string {
        return `#pragma ${node.literal};`;
    }

    private prettyPrintPragmaVersionRange(
        node: FuncAstPragmaVersionRange,
    ): string {
        const allow = node.allow ? "allow" : "not-allow";
        return `#pragma ${allow} ${this.prettyPrintVersionRange(node.range)};`;
    }

    private prettyPrintVersionRange(node: FuncAstVersionRange): string {
        const op = node.op ? `${node.op} ` : "";
        const major = node.major.toString();
        const minor = node.minor !== undefined ? `.${node.minor}` : "";
        const patch = node.patch !== undefined ? `.${node.patch}` : "";
        return `${op}${major}${minor}${patch}`;
    }

    private prettyPrintPragmaVersionString(
        node: FuncAstPragmaVersionString,
    ): string {
        return `#pragma test-version-set "${node.version.value}";`;
    }

    private prettyPrintInclude(node: FuncAstInclude): string {
        return `#include "${node.path.value}";`;
    }

    private prettyPrintGlobalVariablesDeclaration(
        node: FuncAstGlobalVariablesDeclaration,
    ): string {
        const globals = node.globals
            .map((g) => this.prettyPrintGlobalVariable(g))
            .join(", ");
        return `global ${globals};`;
    }

    private prettyPrintGlobalVariable(node: FuncAstGlobalVariable): string {
        const typeStr = node.ty ? this.prettyPrintType(node.ty) : "var";
        const nameStr = this.prettyPrint(node.name);
        return `${typeStr} ${nameStr};`;
    }

    private prettyPrintConstantsDefinition(
        node: FuncAstConstantsDefinition,
    ): string {
        const constants = node.constants
            .map((c) => this.prettyPrintConstant(c))
            .join(", ");
        return `const ${constants};`;
    }

    private prettyPrintConstant(node: FuncAstConstant): string {
        const typeStr = node.ty ? node.ty : "var";
        const nameStr = this.prettyPrint(node.name);
        const valueStr = this.prettyPrint(node.value);
        return `${typeStr} ${nameStr} = ${valueStr};`;
    }

    prettyPrintAsmStrings(asmStrings: FuncAstStringLiteral[]): string {
            return asmStrings.map(this.prettyPrint.bind(this))
            .join("\n")
    }

    private prettyPrintAsmFunctionDefinition(
        node: FuncAstAsmFunctionDefinition,
    ): string {
        const signature = this.prettyPrintFunctionSignature(
            node.returnTy,
            node.name,
            node.parameters,
            node.attributes,
        );
        const asmBody = this.prettyPrintAsmStrings(node.asmStrings);
        return `${signature} asm ${asmBody};`;
    }

    private prettyPrintFunctionDeclaration(
        node: FuncAstFunctionDeclaration,
    ): string {
        const signature = this.prettyPrintFunctionSignature(
            node.returnTy,
            node.name,
            node.parameters,
            node.attributes,
        );
        return `${signature};`;
    }

    private prettyPrintFunctionDefinition(
        node: FuncAstFunctionDefinition,
    ): string {
        const signature = this.prettyPrintFunctionSignature(
            node.returnTy,
            node.name,
            node.parameters,
            node.attributes,
        );
        return `${signature} ${this.prettyPrintStatementBlock(node)}`;
    }

    private prettyPrintParameter(param: FuncAstParameter): string {
        const typeStr = param.ty ? this.prettyPrintType(param.ty) : "var";
        const nameStr = param.name ? this.prettyPrint(param.name) : "";
        return `${typeStr} ${nameStr}`.trim();
    }

    private prettyPrintFunctionAttribute(
        attr: FuncAstFunctionAttribute,
    ): string {
        switch (attr.kind) {
            case "impure":
            case "inline":
            case "inline_ref":
                return attr.kind;
            case "method_id":
                return attr.value
                    ? `method_id(${this.prettyPrint(attr.value)})`
                    : "method_id";
            default:
                throwUnsupportedNodeError(attr);
        }
    }

    private prettyPrintStatementReturn(node: FuncAstStatementReturn): string {
        const value = node.expression
            ? ` ${this.prettyPrint(node.expression)}`
            : "";
        return `return${value};`;
    }

    private prettyPrintStatementBlock<
        T extends { statements: FuncAstStatement[] },
    >(node: T): string {
        return `{\n${this.prettyPrintStatements(node.statements)}\n}`;
    }

    private prettyPrintStatementConditionIf(
        node: FuncAstStatementConditionIf,
    ): string {
        const condition = this.prettyPrint(node.condition);
        const ifnot = node.positive ? "if" : "ifnot";
        const bodyBlock = this.prettyPrintIndentedBlock(
            node.consequences.map(this.prettyPrint.bind(this)).join("\n"),
        );
        const elseBlock = node.alternatives
            ? ` else {\n${this.prettyPrintIndentedBlock(node.alternatives.map(this.prettyPrint.bind(this)).join("\n"))}\n}`
            : "";
        return `${ifnot} (${condition}) {\n${bodyBlock}\n}${elseBlock}`;
    }

    private prettyPrintStatementConditionElseIf(
        node: FuncAstStatementConditionElseIf,
    ): string {
        const conditionIf = this.prettyPrint(node.conditionIf);
        const conditionElseif = this.prettyPrint(node.conditionElseif);
        const ifnotIf = node.positiveIf ? "if" : "ifnot";
        const ifnotElseif = node.positiveElseif ? "elseif" : "elseifnot";
        const bodyBlockIf = this.prettyPrintIndentedBlock(
            node.consequencesIf.map(this.prettyPrint.bind(this)).join("\n"),
        );
        const bodyBlockElseif = this.prettyPrintIndentedBlock(
            node.consequencesElseif.map(this.prettyPrint.bind(this)).join("\n"),
        );
        const elseBlock = node.alternativesElseif
            ? ` else {\n${this.prettyPrintIndentedBlock(node.alternativesElseif.map(this.prettyPrint.bind(this)).join("\n"))}\n}`
            : "";
        return `${ifnotIf} (${conditionIf}) {\n${bodyBlockIf}\n} ${ifnotElseif} (${conditionElseif}) {\n${bodyBlockElseif}\n}${elseBlock}`;
    }

    private prettyPrintStatementRepeat(node: FuncAstStatementRepeat): string {
        const condition = this.prettyPrint(node.iterations);
        const body = this.prettyPrintIndentedBlock(
            node.statements.map(this.prettyPrint.bind(this)).join("\n"),
        );
        return `repeat ${condition} {\n${body}\n}`;
    }

    private prettyPrintStatementUntil(node: FuncAstStatementUntil): string {
        const condition = this.prettyPrint(node.condition);
        const body = this.prettyPrintIndentedBlock(
            node.statements.map(this.prettyPrint.bind(this)).join("\n"),
        );
        return `do {\n${body}\n} until ${condition};`;
    }

    private prettyPrintStatementWhile(node: FuncAstStatementWhile): string {
        const condition = this.prettyPrint(node.condition);
        const body = this.prettyPrintIndentedBlock(
            node.statements.map(this.prettyPrint.bind(this)).join("\n"),
        );
        return `while ${condition} {\n${body}\n}`;
    }

    private prettyPrintStatementTryCatch(
        node: FuncAstStatementTryCatch,
    ): string {
        const tryBlock = this.prettyPrintIndentedBlock(
            node.statementsTry.map(this.prettyPrint.bind(this)).join("\n"),
        );
        const catchStr =
            node.catchDefinitions === "_"
                ? "_"
                : [
                      this.prettyPrint(node.catchDefinitions.exceptionName),
                      this.prettyPrint(node.catchDefinitions.exitCodeName),
                  ].join(", ");
        const catchBlock = this.prettyPrintIndentedBlock(
            node.statementsCatch.map(this.prettyPrint.bind(this)).join("\n"),
        );
        return `try {\n${tryBlock}\n} catch (${catchStr}) {\n${catchBlock}\n}`;
    }

    private prettyPrintStatementExpression(
        node: FuncAstStatementExpression,
    ): string {
        return `${this.prettyPrint(node.expression)};`;
    }

    private prettyPrintExpressionAssign(node: FuncAstExpressionAssign): string {
        const left = this.prettyPrint(node.left);
        const right = this.prettyPrint(node.right);
        return `${left} ${node.op} ${right}`;
    }

    private prettyPrintExpressionConditional(
        node: FuncAstExpressionConditional,
    ): string {
        const condition = this.prettyPrint(node.condition);
        const consequence = this.prettyPrint(node.consequence);
        const alternative = this.prettyPrint(node.alternative);
        return `${condition} ? ${consequence} : ${alternative}`;
    }

    private prettyPrintExpressionCompare(
        node: FuncAstExpressionCompare,
    ): string {
        const left = this.prettyPrint(node.left);
        const right = this.prettyPrint(node.right);
        return `${left} ${node.op} ${right}`;
    }

    private prettyPrintExpressionBitwiseShift(
        node: FuncAstExpressionBitwiseShift,
    ): string {
        const left = this.prettyPrint(node.left);
        const ops = node.ops
            .map((op) => `${op.op} ${this.prettyPrint(op.expr)}`)
            .join(" ");
        return `${left} ${ops}`;
    }

    private prettyPrintExpressionAddBitwise(
        node: FuncAstExpressionAddBitwise,
    ): string {
        const left = node.negateLeft
            ? `-${this.prettyPrint(node.left)}`
            : this.prettyPrint(node.left);
        const ops = node.ops
            .map((op) => `${op.op} ${this.prettyPrint(op.expr)}`)
            .join(" ");
        return `${left} ${ops}`;
    }

    private prettyPrintExpressionMulBitwise(
        node: FuncAstExpressionMulBitwise,
    ): string {
        const left = this.prettyPrint(node.left);
        const ops = node.ops
            .map((op) => `${op.op} ${this.prettyPrint(op.expr)}`)
            .join(" ");
        return `${left} ${ops}`;
    }

    private prettyPrintExpressionUnary(node: FuncAstExpressionUnary): string {
        const operand = this.prettyPrint(node.operand);
        return `${node.op}${operand}`;
    }

    private prettyPrintExpressionMethod(node: FuncAstExpressionMethod): string {
        const object = this.prettyPrint(node.object);
        const calls = node.calls
            .map(
                (call) =>
                    `.${this.prettyPrint(call.name)}(${this.prettyPrint(call.argument)})`,
            )
            .join("");
        return `${object}${calls}`;
    }

    private prettyPrintExpressionVarDecl(
        node: FuncAstExpressionVarDecl,
    ): string {
        const type = this.prettyPrintType(node.ty);
        const names = this.prettyPrintVarDeclPart(node.names);
        return `${type} ${names}`;
    }

    private prettyPrintVarDeclPart(node: FuncVarDeclPart): string {
        switch (node.kind) {
            case "plain_id":
            case "quoted_id":
            case "method_id":
            case "operator_id":
            case "unused_id":
                return this.prettyPrint(node as FuncAstId);
            case "expression_tensor_var_decl": {
                const names = node.names
                    .map((name) => this.prettyPrint(name))
                    .join(", ");
                return `(${names})`;
            }
            case "expression_tuple_var_decl": {
                const names = node.names
                    .map((name) => this.prettyPrint(name))
                    .join(", ");
                return `[${names}]`;
            }
            default:
                throwUnsupportedNodeError(node);
        }
    }

    private prettyPrintExpressionFunCall(
        node: FuncAstExpressionFunCall,
    ): string {
        const object = this.prettyPrint(node.object);
        const args = node.arguments
            .map((arg) => this.prettyPrint(arg))
            .join(", ");
        return `${object}(${args})`;
    }

    private prettyPrintExpressionTensor(node: FuncAstExpressionTensor): string {
        const expressions = node.expressions
            .map((expr) => this.prettyPrint(expr))
            .join(", ");
        return `(${expressions})`;
    }

    private prettyPrintExpressionTuple(node: FuncAstExpressionTuple): string {
        const expressions = node.expressions
            .map((expr) => this.prettyPrint(expr))
            .join(", ");
        return `[${expressions}]`;
    }

    private prettyPrintIntegerLiteral(node: FuncAstIntegerLiteral): string {
        return node.isHex
            ? `0x${node.value.toString(16)}`
            : node.value.toString();
    }

    private prettyPrintStringLiteral(node: FuncAstStringLiteral): string {
        const type = node.ty ? node.ty : "";
        const value =
            node.kind === "string_singleline"
                ? `"${node.value}"`
                : `"""${node.value}"""`;
        return `${value}${type}`;
    }

    private prettyPrintTypePrimitive(node: FuncAstTypePrimitive): string {
        return node.value;
    }

    private prettyPrintComment(node: FuncAstComment): string {
        if (node.kind === "comment_singleline") {
            return `;; ${node.line}`;
        } else {
            const lines = node.lines.join("\n;; ");
            return node.style === "{-" ? `{- ${lines} -}` : `;; ${lines}`;
        }
    }

    private prettyPrintCR(node: FuncAstCR): string {
        return "\n".repeat(node.lines);
    }

    private prettyPrintIndentedBlock(content: string): string {
        this.currentIndent += this.indent;
        const indentedContent = content
            .split("\n")
            .map((line) => " ".repeat(this.currentIndent) + line)
            .join("\n");
        this.currentIndent -= this.indent;
        return indentedContent;
    }

    private prettyPrintTypeTensor(node: FuncAstTypeTensor): string {
        return `(${node.types.map((type) => this.prettyPrintType(type)).join(", ")})`;
    }

    private prettyPrintTypeTuple(node: FuncAstTypeTuple): string {
        return `[${node.types.map((type) => this.prettyPrintType(type)).join(", ")}]`;
    }

    private prettyPrintTypeHole(node: FuncAstHole): string {
        return node.value;
    }

    private prettyPrintTypeMapped(node: FuncAstTypeMapped): string {
        const value = this.prettyPrintType(node.value);
        const mapsTo = this.prettyPrintType(node.mapsTo);
        return `${value} -> ${mapsTo}`;
    }

    private prettyPrintMethodId(node: FuncAstMethodId): string {
        return `${node.prefix}${node.value}`;
    }

    private prettyPrintQuotedId(node: FuncAstQuotedId): string {
        return `\`${node.value}\``;
    }

    private prettyPrintOperatorId(node: FuncAstOperatorId): string {
        return node.value;
    }

    private prettyPrintPlainId(node: FuncAstPlainId): string {
        return node.value;
    }

    private prettyPrintUnusedId(node: FuncAstUnusedId): string {
        return node.value;
    }
}
