import {
    AstConstantDef,
    AstImport,
    AstNativeFunctionDecl,
    AstReceiver,
    AstStatementRepeat,
    AstStatementUntil,
    AstStatementWhile,
    AstStatementForEach,
    AstStatementTry,
    AstStatementTryCatch,
    AstCondition,
    AstStatementAugmentedAssign,
    AstStatementAssign,
    AstStatementExpression,
    AstStatementReturn,
    AstStatementLet,
    AstFunctionDef,
    AstType,
    AstStatement,
    AstExpression,
    AstContract,
    AstTrait,
    AstId,
    AstModule,
    AstModuleItem,
    AstStructDecl,
    AstMessageDecl,
    AstTraitDeclaration,
    AstFunctionDecl,
    AstConstantDecl,
    AstContractDeclaration,
    AstContractInit,
    AstStructFieldInitializer,
    AstPrimitiveTypeDecl,
    AstTypeId,
    AstMapType,
    AstBouncedMessageType,
    AstFieldDecl,
    AstOptionalType,
    AstNode,
    AstFuncId,
    idText,
    AstAsmFunctionDef,
    AstFunctionAttribute,
    AstTypedParameter,
    AstAsmInstruction,
    AstAsmShuffle,
    astNumToString,
} from "./grammar/ast";
import { throwInternalCompilerError } from "./errors";
import JSONbig from "json-bigint";

/**
 * Provides methods to format and indent Tact code.
 */
export class PrettyPrinter {
    /**
     * @param indentLevel Initial level of indentation.
     * @param indentSpaces Number of spaces per indentation level.
     */
    constructor(
        private indentLevel: number = 0,
        private readonly indentSpaces: number = 4,
    ) {}

    private increaseIndent() {
        this.indentLevel += 1;
    }

    private decreaseIndent() {
        this.indentLevel -= 1;
    }

    private indent(): string {
        return " ".repeat(this.indentLevel * this.indentSpaces);
    }

    ppAstPrimitiveTypeDecl(primitive: AstPrimitiveTypeDecl): string {
        return `${this.indent()}primitive ${this.ppAstId(primitive.name)};`;
    }

    //
    // Types
    //

    ppAstType(typeRef: AstType): string {
        switch (typeRef.kind) {
            case "type_id":
                return this.ppAstTypeId(typeRef);
            case "map_type":
                return this.ppAstMapType(typeRef);
            case "bounced_message_type":
                return this.ppAstBouncedMessageType(typeRef);
            case "optional_type":
                return this.ppAstOptionalType(typeRef);
        }
    }

    ppAstTypeId(typeRef: AstTypeId): string {
        return idText(typeRef);
    }

    ppAstOptionalType(typeRef: AstOptionalType): string {
        return `${this.ppAstType(typeRef.typeArg)}?`;
    }

    ppAstMapType(typeRef: AstMapType): string {
        const keyAlias = typeRef.keyStorageType
            ? ` as ${this.ppAstId(typeRef.keyStorageType)}`
            : "";
        const valueAlias = typeRef.valueStorageType
            ? ` as ${this.ppAstId(typeRef.valueStorageType)}`
            : "";
        return `map<${this.ppAstTypeId(typeRef.keyType)}${keyAlias}, ${this.ppAstTypeId(typeRef.valueType)}${valueAlias}>`;
    }

    ppAstBouncedMessageType(typeRef: AstBouncedMessageType): string {
        return `bounced<${this.ppAstTypeId(typeRef.messageType)}>`;
    }

    //
    // Expressions
    //

    /**
     * Returns precedence used in unary/binary operations.
     * Lower number means higher precedence
     */
    getPrecedence(kind: string, op?: string): number {
        switch (kind) {
            case "op_binary":
                switch (op) {
                    case "||":
                        return 1;
                    case "&&":
                        return 2;
                    case "|":
                        return 3;
                    case "^":
                        return 4;
                    case "&":
                        return 5;
                    case "==":
                    case "!=":
                        return 6;
                    case "<":
                    case ">":
                    case "<=":
                    case ">=":
                        return 7;
                    case "+":
                    case "-":
                        return 8;
                    case "*":
                    case "/":
                    case "%":
                        return 9;
                    default:
                        return 11;
                }
            case "conditional":
            case "static_call":
            case "method_call":
                return 0;
            case "op_unary":
                return 10;
            default:
                return 11;
        }
    }

    ppAstExpression(expr: AstExpression, parentPrecedence: number = 0): string {
        let result;
        let currentPrecedence = this.getPrecedence(expr.kind);

        switch (expr.kind) {
            case "op_binary":
                currentPrecedence = this.getPrecedence(expr.kind, expr.op);
                result = `${this.ppAstExpression(expr.left, currentPrecedence)} ${expr.op} ${this.ppAstExpression(expr.right, currentPrecedence)}`;
                break;
            case "op_unary":
                currentPrecedence = this.getPrecedence(expr.kind, expr.op);
                result = `${expr.op}${this.ppAstExpression(expr.operand, currentPrecedence)}`;
                break;
            case "field_access":
                result = `${this.ppAstExpression(expr.aggregate, currentPrecedence)}.${this.ppAstId(expr.field)}`;
                break;
            case "method_call":
                result = `${this.ppAstExpression(expr.self, currentPrecedence)}.${this.ppAstId(expr.method)}(${expr.args.map((arg) => this.ppAstExpression(arg, currentPrecedence)).join(", ")})`;
                break;
            case "static_call":
                result = `${this.ppAstId(expr.function)}(${expr.args.map((arg) => this.ppAstExpression(arg, currentPrecedence)).join(", ")})`;
                break;
            case "struct_instance":
                result = `${this.ppAstId(expr.type)}{${expr.args.map((x) => this.ppAstStructFieldInit(x)).join(", ")}}`;
                break;
            case "init_of":
                result = `initOf ${this.ppAstId(expr.contract)}(${expr.args.map((arg) => this.ppAstExpression(arg, currentPrecedence)).join(", ")})`;
                break;
            case "conditional":
                result = `${this.ppAstExpression(expr.condition, currentPrecedence)} ? ${this.ppAstExpression(expr.thenBranch, currentPrecedence)} : ${this.ppAstExpression(expr.elseBranch, currentPrecedence)}`;
                break;
            case "number":
                result = astNumToString(expr);
                break;
            case "id":
                result = expr.text;
                break;
            case "boolean":
                result = expr.value.toString();
                break;
            case "string":
                result = `"${expr.value}"`;
                break;
            case "null":
                result = "null";
                break;
        }

        // Set parens when needed
        if (
            parentPrecedence > 0 &&
            currentPrecedence > 0 &&
            currentPrecedence < parentPrecedence
        ) {
            result = `(${result})`;
        }

        return result;
    }

    ppAstStructFieldInit(param: AstStructFieldInitializer): string {
        return `${this.ppAstId(param.field)}: ${this.ppAstExpression(param.initializer)}`;
    }

    //
    // Program
    //

    ppAstModule(program: AstModule): string {
        const importsFormatted =
            program.imports.length > 0
                ? `${program.imports
                      .map((entry) => this.ppAstImport(entry))
                      .join("\n")}\n\n`
                : "";
        const entriesFormatted = program.items
            .map((entry, index, array) => {
                const formattedEntry = this.ppModuleItem(entry);
                const nextEntry = array[index + 1];
                if (
                    entry.kind === "constant_def" &&
                    // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
                    nextEntry?.kind === "constant_def"
                ) {
                    return formattedEntry;
                }
                return formattedEntry + "\n";
            })
            .join("\n");
        return `${importsFormatted}${entriesFormatted.trim()}`;
    }

    ppModuleItem(item: AstModuleItem): string {
        switch (item.kind) {
            case "struct_decl":
                return this.ppAstStruct(item);
            case "contract":
                return this.ppAstContract(item);
            case "primitive_type_decl":
                return this.ppAstPrimitiveTypeDecl(item);
            case "function_def":
                return this.ppAstFunctionDef(item);
            case "asm_function_def":
                return this.ppAstAsmFunctionDef(item);
            case "native_function_decl":
                return this.ppAstNativeFunction(item);
            case "trait":
                return this.ppAstTrait(item);
            // case "program_import":
            //     return this.ppASTProgramImport(item);
            case "constant_def":
                return this.ppAstConstant(item);
            case "message_decl":
                return this.ppAstMessage(item);
        }
    }

    ppAstImport(importItem: AstImport): string {
        return `${this.indent()}import "${importItem.path.value}";`;
    }

    ppAstStruct(struct: AstStructDecl): string {
        this.increaseIndent();
        const fieldsFormatted = struct.fields
            .map((field) => this.ppAstFieldDecl(field))
            .join("\n");
        this.decreaseIndent();
        return `${this.indent()}struct ${this.ppAstId(struct.name)} {\n${fieldsFormatted}\n}`;
    }

    ppAstMessage(struct: AstMessageDecl): string {
        const prefixFormatted =
            struct.opcode !== null ? `(${astNumToString(struct.opcode)})` : "";
        this.increaseIndent();
        const fieldsFormatted = struct.fields
            .map((field) => this.ppAstFieldDecl(field))
            .join("\n");
        this.decreaseIndent();
        return `${this.indent()}message${prefixFormatted} ${this.ppAstId(struct.name)} {\n${fieldsFormatted}\n}`;
    }

    ppAstTrait(trait: AstTrait): string {
        const traitsFormatted = trait.traits
            .map((t) => this.ppAstId(t))
            .join(", ");
        const attrsRaw = trait.attributes
            .map((attr) => `@${attr.type}("${attr.name.value}")`)
            .join(" ");
        const attrsFormatted = attrsRaw ? `${attrsRaw} ` : "";
        this.increaseIndent();
        const bodyFormatted = trait.declarations
            .map((dec, index, array) => {
                const formattedDec = this.ppTraitBody(dec);
                const nextDec = array[index + 1];
                /* eslint-disable @typescript-eslint/no-unnecessary-condition */
                if (
                    ((dec.kind === "constant_def" ||
                        dec.kind === "constant_decl") &&
                        (nextDec?.kind === "constant_def" ||
                            nextDec?.kind === "constant_decl")) ||
                    (dec.kind === "field_decl" &&
                        nextDec?.kind === "field_decl")
                ) {
                    return formattedDec;
                }
                /* eslint-enable @typescript-eslint/no-unnecessary-condition */
                return formattedDec + "\n";
            })
            .join("\n");
        const header = traitsFormatted
            ? `trait ${this.ppAstId(trait.name)} with ${traitsFormatted}`
            : `trait ${this.ppAstId(trait.name)}`;
        this.decreaseIndent();
        return `${this.indent()}${attrsFormatted}${header} {\n${bodyFormatted}${this.indent()}}`;
    }

    ppTraitBody(item: AstTraitDeclaration): string {
        switch (item.kind) {
            case "field_decl":
                return this.ppAstFieldDecl(item);
            case "function_def":
                return this.ppAstFunctionDef(item);
            case "asm_function_def":
                return this.ppAstAsmFunctionDef(item);
            case "receiver":
                return this.ppAstReceiver(item);
            case "constant_def":
                return this.ppAstConstant(item);
            case "function_decl":
                return this.ppAstFunctionDecl(item);
            case "constant_decl":
                return this.ppAstConstDecl(item);
        }
    }

    ppAstFieldDecl(field: AstFieldDecl): string {
        const typeFormatted = this.ppAstType(field.type);
        const initializer = field.initializer
            ? ` = ${this.ppAstExpression(field.initializer)}`
            : "";
        const asAlias = field.as ? ` as ${this.ppAstId(field.as)}` : "";
        return `${this.indent()}${this.ppAstId(field.name)}: ${typeFormatted}${asAlias}${initializer};`;
    }

    ppAstConstant(constant: AstConstantDef): string {
        const valueFormatted = ` = ${this.ppAstExpression(constant.initializer)}`;
        const attrsRaw = constant.attributes.map((attr) => attr.type).join(" ");
        const attrsFormatted = attrsRaw ? `${attrsRaw} ` : "";
        return `${this.indent()}${attrsFormatted}const ${this.ppAstId(constant.name)}: ${this.ppAstType(constant.type)}${valueFormatted};`;
    }

    ppAstConstDecl(constant: AstConstantDecl): string {
        const attrsRaw = constant.attributes.map((attr) => attr.type).join(" ");
        const attrsFormatted = attrsRaw ? `${attrsRaw} ` : "";
        return `${this.indent()}${attrsFormatted}const ${this.ppAstId(constant.name)}: ${this.ppAstType(constant.type)};`;
    }

    ppAstContract(contract: AstContract): string {
        const traitsFormatted = contract.traits
            .map((trait) => trait.text)
            .join(", ");
        this.increaseIndent();
        const bodyFormatted = contract.declarations
            .map((dec, index, array) => {
                const formattedDec = this.ppContractBody(dec);
                const nextDec = array[index + 1];
                if (
                    (dec.kind === "constant_def" &&
                        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
                        nextDec?.kind === "constant_def") ||
                    (dec.kind === "field_decl" &&
                        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
                        nextDec?.kind === "field_decl")
                ) {
                    return formattedDec;
                }
                return formattedDec + "\n";
            })
            .join("\n");
        this.decreaseIndent();
        const header = traitsFormatted
            ? `contract ${this.ppAstId(contract.name)} with ${traitsFormatted}`
            : `contract ${this.ppAstId(contract.name)}`;
        const attrsRaw = contract.attributes
            .map((attr) => `@interface("${attr.name.value}")`)
            .join(" ");
        const attrsFormatted = attrsRaw ? `${attrsRaw} ` : "";
        return `${this.indent()}${attrsFormatted}${header} {\n${bodyFormatted}${this.indent()}}`;
    }

    ppContractBody(declaration: AstContractDeclaration): string {
        switch (declaration.kind) {
            case "field_decl":
                return this.ppAstFieldDecl(declaration);
            case "function_def":
                return this.ppAstFunctionDef(declaration);
            case "asm_function_def":
                return this.ppAstAsmFunctionDef(declaration);
            case "contract_init":
                return this.ppAstInitFunction(declaration);
            case "receiver":
                return this.ppAstReceiver(declaration);
            case "constant_def":
                return this.ppAstConstant(declaration);
        }
    }

    public ppAstFunctionDef(f: AstFunctionDef): string {
        const body = this.ppStatementBlock(f.statements);
        return `${this.indent()}${this.ppAstFunctionSignature(f.attributes, f.name, f.return, f.params)} ${body}`;
    }

    public ppAstAsmFunctionDef(f: AstAsmFunctionDef): string {
        const asmAttr = `asm${prettyPrintAsmShuffle(f.shuffle)}`;
        const body = this.ppAsmInstructionsBlock(f.instructions);
        return `${this.indent()}${asmAttr} ${this.ppAstFunctionSignature(f.attributes, f.name, f.return, f.params)} ${body}`;
    }

    ppAstFunctionDecl(f: AstFunctionDecl): string {
        return `${this.indent()}${this.ppAstFunctionSignature(f.attributes, f.name, f.return, f.params)};`;
    }

    ppAstFunctionSignature(
        attributes: AstFunctionAttribute[],
        name: AstId,
        retTy: AstType | null,
        params: AstTypedParameter[],
    ): string {
        const argsFormatted = params
            .map(
                (arg) =>
                    `${this.ppAstId(arg.name)}: ${this.ppAstType(arg.type)}`,
            )
            .join(", ");
        const attrsRaw = attributes.map((attr) => attr.type).join(" ");
        const attrsFormatted = attrsRaw ? `${attrsRaw} ` : "";
        const returnType = retTy ? `: ${this.ppAstType(retTy)}` : "";
        return `${attrsFormatted}fun ${this.ppAstId(name)}(${argsFormatted})${returnType}`;
    }

    ppAstReceiver(receive: AstReceiver): string {
        const header = this.ppAstReceiverHeader(receive);
        const stmtsFormatted = this.ppStatementBlock(receive.statements);
        return `${this.indent()}${header} ${stmtsFormatted}`;
    }

    ppAstReceiverHeader(receive: AstReceiver): string {
        switch (receive.selector.kind) {
            case "internal-simple":
                return `receive(${this.ppAstId(receive.selector.param.name)}: ${this.ppAstType(receive.selector.param.type)})`;
            case "internal-fallback":
                return `receive()`;
            case "internal-comment":
                return `receive("${receive.selector.comment.value}")`;
            case "bounce":
                return `bounced(${this.ppAstId(receive.selector.param.name)}: ${this.ppAstType(receive.selector.param.type)})`;
            case "external-simple":
                return `external(${this.ppAstId(receive.selector.param.name)}: ${this.ppAstType(receive.selector.param.type)})`;
            case "external-fallback":
                return `external()`;
            case "external-comment":
                return `external("${receive.selector.comment.value}")`;
        }
    }

    ppAstNativeFunction(func: AstNativeFunctionDecl): string {
        const argsFormatted = func.params
            .map(
                (arg) =>
                    `${this.ppAstId(arg.name)}: ${this.ppAstType(arg.type)}`,
            )
            .join(", ");
        const returnType = func.return
            ? `: ${this.ppAstType(func.return)}`
            : "";
        let attrs = func.attributes.map((attr) => attr.type).join(" ");
        attrs = attrs ? attrs + " " : "";
        return `${this.indent()}@name(${this.ppAstFuncId(func.nativeName)})\n${this.indent()}${attrs}native ${this.ppAstId(func.name)}(${argsFormatted})${returnType};`;
    }

    ppAstFuncId(func: AstFuncId): string {
        return func.text;
    }

    ppAstInitFunction(initFunc: AstContractInit): string {
        const argsFormatted = initFunc.params
            .map(
                (arg) =>
                    `${this.ppAstId(arg.name)}: ${this.ppAstType(arg.type)}`,
            )
            .join(", ");

        this.increaseIndent();
        const stmtsFormatted = initFunc.statements
            .map((stmt) => this.ppAstStatement(stmt))
            .join("\n");
        this.decreaseIndent();

        return `${this.indent()}init(${argsFormatted}) {${stmtsFormatted == "" ? "" : "\n"}${stmtsFormatted}${stmtsFormatted == "" ? "" : "\n" + this.indent()}}`;
    }

    //
    // Statements
    //

    ppAstStatement(stmt: AstStatement): string {
        switch (stmt.kind) {
            case "statement_let":
                return this.ppAstStatementLet(stmt as AstStatementLet);
            case "statement_return":
                return this.ppAstStatementReturn(stmt as AstStatementReturn);
            case "statement_expression":
                return this.ppAstStatementExpression(
                    stmt as AstStatementExpression,
                );
            case "statement_assign":
                return this.ppAstStatementAssign(stmt as AstStatementAssign);
            case "statement_augmentedassign":
                return this.ppAstStatementAugmentedAssign(
                    stmt as AstStatementAugmentedAssign,
                );
            case "statement_condition":
                return this.ppAstCondition(stmt as AstCondition);
            case "statement_while":
                return this.ppAstStatementWhile(stmt as AstStatementWhile);
            case "statement_until":
                return this.ppAstStatementUntil(stmt as AstStatementUntil);
            case "statement_repeat":
                return this.ppAstStatementRepeat(stmt as AstStatementRepeat);
            case "statement_foreach":
                return this.ppAstStatementForEach(stmt as AstStatementForEach);
            case "statement_try":
                return this.ppAstStatementTry(stmt as AstStatementTry);
            case "statement_try_catch":
                return this.ppAstStatementTryCatch(
                    stmt as AstStatementTryCatch,
                );
        }
    }

    ppStatementBlock(stmts: AstStatement[]): string {
        this.increaseIndent();
        const stmtsFormatted = stmts
            .map((stmt) => this.ppAstStatement(stmt))
            .join("\n");
        this.decreaseIndent();
        const result = `{\n${stmtsFormatted}\n${this.indent()}}`;
        return result;
    }

    ppAsmInstructionsBlock(instructions: AstAsmInstruction[]): string {
        this.increaseIndent();
        const instructionsFormatted = instructions
            .map((instr) => this.ppAstAsmInstruction(instr))
            .join("\n");
        this.decreaseIndent();
        return `{\n${instructionsFormatted}\n${this.indent()}}`;
    }

    ppAstAsmInstruction(instruction: AstAsmInstruction): string {
        return `${this.indent()}${instruction}`;
    }

    ppAstStatementLet(statement: AstStatementLet): string {
        const expression = this.ppAstExpression(statement.expression);
        const tyAnnotation =
            statement.type === null
                ? ""
                : `: ${this.ppAstType(statement.type)}`;
        return `${this.indent()}let ${this.ppAstId(statement.name)}${tyAnnotation} = ${expression};`;
    }

    ppAstStatementReturn(statement: AstStatementReturn): string {
        const expression = statement.expression
            ? this.ppAstExpression(statement.expression)
            : "";
        return `${this.indent()}return ${expression};`;
    }

    ppAstStatementExpression(statement: AstStatementExpression): string {
        return `${this.indent()}${this.ppAstExpression(statement.expression)};`;
    }

    ppAstId(id: AstId) {
        return id.text;
    }

    ppAstStatementAssign(statement: AstStatementAssign): string {
        return `${this.indent()}${this.ppAstExpression(statement.path)} = ${this.ppAstExpression(statement.expression)};`;
    }

    ppAstStatementAugmentedAssign(
        statement: AstStatementAugmentedAssign,
    ): string {
        return `${this.indent()}${this.ppAstExpression(statement.path)} ${statement.op}= ${this.ppAstExpression(statement.expression)};`;
    }

    ppAstCondition(statement: AstCondition): string {
        const condition = this.ppAstExpression(statement.condition);
        const trueBranch = this.ppStatementBlock(statement.trueStatements);
        const falseBranch = statement.falseStatements
            ? ` else ${this.ppStatementBlock(statement.falseStatements)}`
            : "";
        return `${this.indent()}if (${condition}) ${trueBranch}${falseBranch}`;
    }

    ppAstStatementWhile(statement: AstStatementWhile): string {
        const condition = this.ppAstExpression(statement.condition);
        const stmts = this.ppStatementBlock(statement.statements);
        return `${this.indent()}while (${condition}) ${stmts}`;
    }

    ppAstStatementRepeat(statement: AstStatementRepeat): string {
        const condition = this.ppAstExpression(statement.iterations);
        const stmts = this.ppStatementBlock(statement.statements);
        return `${this.indent()}repeat (${condition}) ${stmts}`;
    }

    ppAstStatementUntil(statement: AstStatementUntil): string {
        const condition = this.ppAstExpression(statement.condition);
        const stmts = this.ppStatementBlock(statement.statements);
        return `${this.indent()}do ${stmts} until (${condition});`;
    }

    ppAstStatementForEach(statement: AstStatementForEach): string {
        const header = `foreach (${this.ppAstId(statement.keyName)}, ${this.ppAstId(statement.valueName)} in ${this.ppAstExpression(statement.map)})`;
        const body = this.ppStatementBlock(statement.statements);
        return `${this.indent()}${header} ${body}`;
    }

    ppAstStatementTry(statement: AstStatementTry): string {
        const body = this.ppStatementBlock(statement.statements);
        return `${this.indent()}try ${body}`;
    }

    ppAstStatementTryCatch(statement: AstStatementTryCatch): string {
        const tryBody = this.ppStatementBlock(statement.statements);
        const catchBody = this.ppStatementBlock(statement.catchStatements);
        return `${this.indent()}try ${tryBody} catch (${this.ppAstId(statement.catchName)}) ${catchBody}`;
    }
}

/**
 * Pretty-prints an AST node into a string representation.
 * @param node The AST node to format.
 * @returns A string that represents the formatted AST node.
 */
export function prettyPrint(node: AstNode): string {
    const pp = new PrettyPrinter();
    switch (node.kind) {
        case "module":
            return pp.ppAstModule(node);
        case "op_binary":
        case "op_unary":
        case "field_access":
        case "method_call":
        case "static_call":
        case "struct_instance":
        case "init_of":
        case "conditional":
        case "number":
        case "id":
        case "boolean":
        case "string":
        case "null":
            return pp.ppAstExpression(node);
        case "struct_decl":
            return pp.ppAstStruct(node);
        case "constant_def":
            return pp.ppAstConstant(node);
        case "constant_decl":
            return pp.ppAstConstDecl(node);
        case "function_def":
            return pp.ppAstFunctionDef(node);
        case "contract":
            return pp.ppAstContract(node);
        case "trait":
            return pp.ppAstTrait(node);
        case "type_id":
        case "optional_type":
        case "map_type":
        case "bounced_message_type":
            return pp.ppAstType(node);
        case "primitive_type_decl":
            return pp.ppAstPrimitiveTypeDecl(node);
        case "message_decl":
            return pp.ppAstMessage(node);
        case "native_function_decl":
            return pp.ppAstNativeFunction(node);
        case "field_decl":
            return pp.ppAstFieldDecl(node);
        case "function_decl":
            return pp.ppAstFunctionDecl(node);
        case "receiver":
            return pp.ppAstReceiver(node);
        case "contract_init":
            return pp.ppAstInitFunction(node);
        case "statement_let":
            return pp.ppAstStatementLet(node);
        case "statement_return":
            return pp.ppAstStatementReturn(node);
        case "statement_expression":
            return pp.ppAstStatementExpression(node);
        case "statement_assign":
            return pp.ppAstStatementAssign(node);
        case "statement_augmentedassign":
            return pp.ppAstStatementAugmentedAssign(node);
        case "statement_condition":
            return pp.ppAstCondition(node);
        case "statement_while":
            return pp.ppAstStatementWhile(node);
        case "statement_until":
            return pp.ppAstStatementUntil(node);
        case "statement_repeat":
            return pp.ppAstStatementRepeat(node);
        case "statement_try":
            return pp.ppAstStatementTry(node);
        case "statement_try_catch":
            return pp.ppAstStatementTryCatch(node);
        case "statement_foreach":
            return pp.ppAstStatementForEach(node);
        case "struct_field_initializer":
            return pp.ppAstStructFieldInit(node);
        case "import":
            return pp.ppAstImport(node);
        default:
            throwInternalCompilerError(
                `Unsupported AST type: ${JSONbig.stringify(node, null, 2)}`,
            );
    }
}

export function prettyPrintAsmShuffle(shuffle: AstAsmShuffle): string {
    const ppArgShuffle = shuffle.args.map((id) => idText(id)).join(" ");
    const ppRetShuffle =
        shuffle.ret.length === 0
            ? ""
            : ` -> ${shuffle.ret.map((num) => num.value.toString()).join(" ")}`;
    return shuffle.args.length === 0 && shuffle.ret.length === 0
        ? ""
        : `(${ppArgShuffle}${ppRetShuffle})`;
}
