import type * as Ast from "../../src/ast/ast";

/**
 * PrettyPrinter class provides methods to format and indent Tact code.
 */
class PrettyPrinter {
    /**
     * @param indentLevel Initial level of indentation.
     * @param indentSpaces Number of spaces per indentation level.
     */
    constructor(
        private indentLevel: number = 0,
        private readonly indentSpaces: number = 2,
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

    ppAstPrimitive(primitive: Ast.PrimitiveTypeDecl): string {
        return `${this.indent()}primitive ${primitive.name.text};`;
    }

    //
    // Types
    //

    ppAstType(typeRef: Ast.Type): string {
        switch (typeRef.kind) {
            case "type_id":
                return typeRef.text;
            case "optional_type":
                return `${this.ppAstType(typeRef.typeArg)}?`;
            case "map_type":
                return this.ppAstTypeRefMap(typeRef);
            case "bounced_message_type":
                return this.ppAstBouncedMessageType(typeRef);
        }
    }

    ppAstTypeRefMap(typeRef: Ast.MapType): string {
        const keyAlias = typeRef.keyStorageType
            ? ` as ${typeRef.keyStorageType.text}`
            : "";
        const valueAlias = typeRef.valueStorageType
            ? ` as ${typeRef.valueStorageType.text}`
            : "";
        return `map<${typeRef.keyType.text}${keyAlias}, ${typeRef.valueType.text}${valueAlias}>`;
    }

    ppAstBouncedMessageType(type: Ast.BouncedMessageType): string {
        return `bounced<${type.messageType.text}>`;
    }

    //
    // Expressions
    //

    ppAstOptionalId(id: Ast.OptionalId): string {
        return "text" in id ? id.text : "_";
    }

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
            case "op_call":
            case "op_static_call":
                return 0;
            case "op_unary":
                return 10;
            default:
                return 11;
        }
    }

    ppAstExpression(
        expr: Ast.Expression,
        parentPrecedence: number = 0,
    ): string {
        let result: string;
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
                result = `${this.ppAstExpression(expr.aggregate, currentPrecedence)}.${expr.field.text}`;
                break;
            case "method_call":
                result = `${this.ppAstExpression(expr.self, currentPrecedence)}.${expr.method.text}(${expr.args.map((arg) => this.ppAstExpression(arg, currentPrecedence)).join(", ")})`;
                break;
            case "static_call":
                result = `${expr.function.text}(${expr.args.map((arg) => this.ppAstExpression(arg, currentPrecedence)).join(", ")})`;
                break;
            case "struct_instance":
                result = `${expr.type.text}{${expr.args.map((x) => this.ppAstStructFieldInitializer(x)).join(", ")}}`;
                break;
            case "init_of":
                result = `initOf ${expr.contract.text}(${expr.args.map((arg) => this.ppAstExpression(arg, currentPrecedence)).join(", ")})`;
                break;
            case "conditional":
                result = `${this.ppAstExpression(expr.condition, currentPrecedence)} ? ${this.ppAstExpression(expr.thenBranch, currentPrecedence)} : ${this.ppAstExpression(expr.elseBranch, currentPrecedence)}`;
                break;
            case "number":
                result = expr.value.toString();
                break;
            case "id":
                result = expr.text;
                break;
            case "boolean":
                result = expr.value.toString();
                break;
            case "simplified_string":
            case "string":
                result = `"${expr.value}"`;
                break;
            case "null":
                result = "null";
                break;
            default:
                throw new Error(`Unsupported expression type: ${expr.kind}`);
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

    ppAstStructFieldInitializer(param: Ast.StructFieldInitializer): string {
        return `${param.field.text}: ${this.ppAstExpression(param.initializer)}`;
    }

    //
    // Program
    //

    ppAstProgram(program: Ast.Module): string {
        const entriesFormatted = program.items
            .map((entry, index, array) => {
                const formattedEntry = this.ppProgramItem(entry);
                const nextEntry = array[index + 1];
                if (
                    entry.kind === "constant_def" &&
                    nextEntry.kind === "constant_def"
                ) {
                    return formattedEntry;
                }
                return formattedEntry + "\n";
            })
            .join("\n");
        return entriesFormatted.trim();
    }

    ppProgramItem(item: Ast.ModuleItem): string {
        switch (item.kind) {
            case "struct_decl":
            case "message_decl":
                return this.ppAstStruct(item);
            case "contract":
                return this.ppAstContract(item);
            case "primitive_type_decl":
                return this.ppAstPrimitive(item);
            case "function_def":
                return this.ppAstFunction(item);
            case "native_function_decl":
                return this.ppAstNativeFunction(item);
            case "trait":
                return this.ppAstTrait(item);
            case "constant_def":
                return this.ppAstConstant(item);
            default:
                return `Unknown Program Item Type: ${item.kind}`;
        }
    }

    ppAstProgramImport(importItem: Ast.Import): string {
        return `${this.indent()}import "${importItem.importPath.path.segments.join()}";`;
    }

    ppAstStruct(struct: Ast.StructDecl | Ast.MessageDecl): string {
        const typePrefix =
            struct.kind === "message_decl" ? "message" : "struct";
        const prefixFormatted =
            struct.kind === "message_decl" && struct.opcode !== undefined
                ? this.ppAstExpression(struct.opcode)
                : "";
        this.increaseIndent();
        const fieldsFormatted = struct.fields
            .map((field) => this.ppAstField(field))
            .join("\n");
        this.decreaseIndent();
        return `${this.indent()}${typePrefix} ${prefixFormatted}${struct.name.text} {\n${fieldsFormatted}\n}`;
    }

    ppAstTrait(trait: Ast.Trait): string {
        const traitsFormatted = trait.traits.map((t) => t.text).join(", ");
        const attrsRaw = trait.attributes
            .map((attr) => `@${attr.type}("${attr.name.value}")`)
            .join(" ");
        const attrsFormatted = attrsRaw ? `${attrsRaw} ` : "";
        this.increaseIndent();
        const bodyFormatted = trait.declarations
            .map((dec, index, array) => {
                const formattedDec = this.ppTraitBody(dec);
                const nextDec = array[index + 1];
                if (
                    (dec.kind === "constant_def" &&
                        nextDec.kind === "constant_def") ||
                    (dec.kind === "constant_decl" &&
                        nextDec.kind === "constant_decl") ||
                    (dec.kind === "field_decl" && nextDec.kind === "field_decl")
                ) {
                    return formattedDec;
                }
                return formattedDec + "\n";
            })
            .join("\n");
        const header = traitsFormatted
            ? `trait ${trait.name.text} with ${traitsFormatted}`
            : `trait ${trait.name.text}`;
        this.decreaseIndent();
        return `${this.indent()}${attrsFormatted}${header} {\n${bodyFormatted}${this.indent()}}`;
    }

    ppTraitBody(item: Ast.TraitDeclaration): string {
        switch (item.kind) {
            case "field_decl":
                return this.ppAstField(item);
            case "function_decl":
            case "function_def":
                return this.ppAstFunction(item);
            case "receiver":
                return this.ppAstReceive(item);
            case "constant_decl":
            case "constant_def":
                return this.ppAstConstant(item);
            default:
                return `Unknown Trait Body Type: ${item.kind}`;
        }
    }

    ppAstField(field: Ast.FieldDecl): string {
        const typeFormatted = this.ppAstType(field.type);
        const initializer = field.initializer
            ? ` = ${this.ppAstExpression(field.initializer)}`
            : "";
        const asAlias = field.as ? ` as ${field.as.text}` : "";
        return `${this.indent()}${field.name.text}: ${typeFormatted}${asAlias}${initializer};`;
    }

    ppAstConstant(constant: Ast.ConstantDecl | Ast.ConstantDef): string {
        const valueFormatted =
            constant.kind === "constant_def"
                ? ` = ${this.ppAstExpression(constant.initializer)}`
                : "";
        const attrsRaw = constant.attributes.map((attr) => attr.type).join(" ");
        const attrsFormatted = attrsRaw ? `${attrsRaw} ` : "";
        return `${this.indent()}${attrsFormatted}const ${constant.name.text}: ${this.ppAstType(constant.type)}${valueFormatted};`;
    }

    ppAstContract(contract: Ast.Contract): string {
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
                        nextDec.kind === "constant_def") ||
                    (dec.kind === "field_decl" && nextDec.kind === "field_decl")
                ) {
                    return formattedDec;
                }
                return formattedDec + "\n";
            })
            .join("\n");
        this.decreaseIndent();
        const header = traitsFormatted
            ? `contract ${contract.name.text} with ${traitsFormatted}`
            : `contract ${contract.name.text}`;
        const attrsRaw = contract.attributes
            .map((attr) => `@interface("${attr.name.value}")`)
            .join(" ");
        const attrsFormatted = attrsRaw ? `${attrsRaw} ` : "";
        return `${this.indent()}${attrsFormatted}${header} {\n${bodyFormatted}${this.indent()}}`;
    }

    ppContractBody(declaration: Ast.ContractDeclaration): string {
        switch (declaration.kind) {
            case "field_decl":
                return this.ppAstField(declaration);
            case "function_def":
                return this.ppAstFunction(declaration);
            case "contract_init":
                return this.ppAstInitFunction(declaration);
            case "receiver":
                return this.ppAstReceive(declaration);
            case "constant_def":
                return this.ppAstConstant(declaration);
            default:
                return `Unknown Contract Body Type: ${declaration.kind}`;
        }
    }

    public ppAstFunction(func: Ast.FunctionDecl | Ast.FunctionDef): string {
        const argsFormatted = func.params
            .map(
                (arg) =>
                    `${this.ppAstOptionalId(arg.name)}: ${this.ppAstType(arg.type)}`,
            )
            .join(", ");
        const attrsRaw = func.attributes.map((attr) => attr.type).join(" ");
        const attrsFormatted = attrsRaw ? `${attrsRaw} ` : "";
        const returnType = func.return
            ? `: ${this.ppAstType(func.return)}`
            : "";
        this.increaseIndent();
        const stmtsFormatted =
            func.kind === "function_def"
                ? func.statements
                      .map((stmt) => this.ppAstStatement(stmt))
                      .join("\n")
                : "";
        const body =
            func.kind === "function_def"
                ? ` {\n${stmtsFormatted}\n${this.indent()}}`
                : ";";
        this.decreaseIndent();
        return `${this.indent()}${attrsFormatted}fun ${func.name.text}(${argsFormatted})${returnType}${body}`;
    }

    ppAstReceive(receive: Ast.Receiver): string {
        const header = this.ppAstReceiveHeader(receive);
        const stmtsFormatted = this.ppStatementBlock(receive.statements);
        return `${this.indent()}${header} ${stmtsFormatted}`;
    }

    ppAstReceiveHeader(receive: Ast.Receiver): string {
        if (receive.selector.kind === "bounce")
            return `bounced(${this.ppAstOptionalId(receive.selector.param.name)}: ${this.ppAstType(receive.selector.param.type)})`;
        const prefix =
            receive.selector.kind === "internal" ? "receive" : "external";
        const suffix =
            receive.selector.subKind.kind === "simple"
                ? `(${this.ppAstOptionalId(receive.selector.subKind.param.name)}: ${this.ppAstType(receive.selector.subKind.param.type)})`
                : receive.selector.subKind.kind === "fallback"
                  ? "()"
                  : `("${receive.selector.subKind.comment.value}")`;
        return prefix + suffix;
    }

    ppAstNativeFunction(func: Ast.NativeFunctionDecl): string {
        const argsFormatted = func.params
            .map(
                (arg) =>
                    `${this.ppAstOptionalId(arg.name)}: ${this.ppAstType(arg.type)}`,
            )
            .join(", ");
        const returnType = func.return
            ? `: ${this.ppAstType(func.return)}`
            : "";
        let attrs = func.attributes.map((attr) => attr.type).join(" ");
        attrs = attrs ? attrs + " " : "";
        return `${this.indent()}@name(${func.nativeName.text})\n${this.indent()}${attrs}native ${func.name.text}(${argsFormatted})${returnType};`;
    }

    ppAstInitFunction(initFunc: Ast.ContractInit): string {
        const argsFormatted = initFunc.params
            .map(
                (arg) =>
                    `${this.ppAstOptionalId(arg.name)}: ${this.ppAstType(arg.type)}`,
            )
            .join(", ");

        this.increaseIndent();
        const stmtsFormatted = initFunc.statements
            .map((stmt) => this.ppAstStatement(stmt))
            .join("\n");
        this.decreaseIndent();

        return `${this.indent()}init(${argsFormatted}) {${stmtsFormatted === "" ? "" : "\n"}${stmtsFormatted}${stmtsFormatted === "" ? "" : "\n" + this.indent()}}`;
    }

    //
    // Statements
    //

    ppAstStatement(stmt: Ast.Statement): string {
        switch (stmt.kind) {
            case "statement_let":
                return this.ppAstStatementLet(stmt);
            case "statement_return":
                return this.ppAstStatementReturn(stmt);
            case "statement_expression":
                return this.ppAstStatementExpression(stmt);
            case "statement_assign":
                return this.ppAstStatementAssign(stmt);
            case "statement_augmentedassign":
                return this.ppAstStatementAugmentedAssign(stmt);
            case "statement_condition":
                return this.ppAstCondition(stmt);
            case "statement_while":
                return this.ppAstStatementWhile(stmt);
            case "statement_until":
                return this.ppAstStatementUntil(stmt);
            case "statement_repeat":
                return this.ppAstStatementRepeat(stmt);
            case "statement_foreach":
                return this.ppAstStatementForEach(stmt);
            case "statement_try":
                return this.ppAstStatementTry(stmt);
            default:
                return `Unsupported statement kind: ${stmt.kind}`;
        }
    }

    ppStatementBlock(statements: readonly Ast.Statement[]): string {
        this.increaseIndent();
        const statementsFormatted = statements
            .map((stmt) => this.ppAstStatement(stmt))
            .join("\n");
        this.decreaseIndent();
        const result = `{\n${statementsFormatted}\n${this.indent()}}`;
        return result;
    }

    ppAstStatementLet(statement: Ast.StatementLet): string {
        const expression = this.ppAstExpression(statement.expression);
        const tyAnnotation =
            statement.type === undefined
                ? ""
                : `: ${this.ppAstType(statement.type)}`;
        return `${this.indent()}let ${this.ppAstOptionalId(statement.name)}${tyAnnotation} = ${expression};`;
    }

    ppAstStatementReturn(statement: Ast.StatementReturn): string {
        const expression = statement.expression
            ? this.ppAstExpression(statement.expression)
            : "";
        return `${this.indent()}return ${expression};`;
    }

    ppAstStatementExpression(statement: Ast.StatementExpression): string {
        return `${this.indent()}${this.ppAstExpression(statement.expression)};`;
    }

    ppAstStatementAssign(statement: Ast.StatementAssign): string {
        return `${this.indent()}${this.ppAstExpression(statement.path)} = ${this.ppAstExpression(statement.expression)};`;
    }

    ppAstStatementAugmentedAssign(
        statement: Ast.StatementAugmentedAssign,
    ): string {
        return `${this.indent()}${this.ppAstExpression(statement.path)} ${statement.op}= ${this.ppAstExpression(statement.expression)};`;
    }

    ppAstCondition(statement: Ast.StatementCondition): string {
        const condition = this.ppAstExpression(statement.condition);
        const trueBranch = this.ppStatementBlock(statement.trueStatements);
        const falseBranch = statement.falseStatements
            ? ` else ${this.ppStatementBlock(statement.falseStatements)}`
            : "";
        return `${this.indent()}if (${condition}) ${trueBranch}${falseBranch}`;
    }

    ppAstStatementWhile(statement: Ast.StatementWhile): string {
        const condition = this.ppAstExpression(statement.condition);
        const stmts = this.ppStatementBlock(statement.statements);
        return `${this.indent()}while (${condition}) ${stmts}`;
    }

    ppAstStatementRepeat(statement: Ast.StatementRepeat): string {
        const condition = this.ppAstExpression(statement.iterations);
        const stmts = this.ppStatementBlock(statement.statements);
        return `${this.indent()}repeat (${condition}) ${stmts}`;
    }

    ppAstStatementUntil(statement: Ast.StatementUntil): string {
        const condition = this.ppAstExpression(statement.condition);
        const stmts = this.ppStatementBlock(statement.statements);
        return `${this.indent()}do ${stmts} until (${condition});`;
    }

    ppAstStatementForEach(statement: Ast.StatementForEach): string {
        const header = `foreach (${this.ppAstOptionalId(statement.keyName)}, ${(statement.valueName as Ast.Id).text} in ${this.ppAstExpression(statement.map)})`;
        const body = this.ppStatementBlock(statement.statements);
        return `${this.indent()}${header} ${body}`;
    }

    ppAstStatementTry(statement: Ast.StatementTry): string {
        const tryBody = this.ppStatementBlock(statement.statements);
        const tryPrefix = `${this.indent()}try ${tryBody}`;
        const catchSuffix = statement.catchBlock
            ? ` catch (${this.ppAstOptionalId(statement.catchBlock.catchName)}) ${this.ppStatementBlock(statement.catchBlock.catchStatements)}`
            : "";
        return tryPrefix + catchSuffix;
    }
}

/**
 * Formats an Ast. node into a pretty-printed string representation.
 * @param input The Ast. node to format.
 * @returns A string that represents the formatted Ast. node.
 */
// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function formatAst(input: Ast.AstNode): string {
    const pp = new PrettyPrinter();
    switch (input.kind) {
        case "module":
            return pp.ppAstProgram(input);
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
            return pp.ppAstExpression(input);
        case "struct_decl":
        case "message_decl":
            return pp.ppAstStruct(input);
        case "constant_decl":
        case "constant_def":
            return pp.ppAstConstant(input);
        case "function_decl":
        case "function_def":
            return pp.ppAstFunction(input);
        case "contract":
            return pp.ppAstContract(input);
        case "trait":
            return pp.ppAstTrait(input);
        default:
            throw new Error(`Unsupported Ast. type: ${input.kind}`);
    }
}
