import * as A from "./ast";
import { createHash } from "crypto";
import { throwInternalCompilerError } from "../error/errors";
import JSONbig from "json-bigint";

export type AstHash = string;

/**
 * Provides functionality to hash AST nodes regardless of identifiers.
 */
export class AstHasher {
    private constructor(private readonly sort: boolean) {}
    public static make(params: Partial<{ sort: boolean }> = {}): AstHasher {
        const { sort = true } = params;
        return new AstHasher(sort);
    }

    public hash(node: A.AstNode): AstHash {
        const data =
            node.kind === "id" || node.kind === "func_id"
                ? `${node.kind}_${node.text}`
                : this.getHashData(node);
        return createHash("sha256").update(data).digest("hex");
    }

    /**
     * Generates a string that is used to create a hash.
     */
    private getHashData(node: A.AstNode): string {
        switch (node.kind) {
            case "module":
                return this.hashModule(node as A.AstModule);
            case "struct_decl":
                return this.hashStructDecl(node as A.AstStructDecl);
            case "message_decl":
                return this.hashMessageDecl(node as A.AstMessageDecl);
            case "function_def":
                return this.hashFunctionDef(node as A.AstFunctionDef);
            case "asm_function_def":
                return this.hashAsmFunctionDef(node as A.AstAsmFunctionDef);
            case "constant_def":
                return this.hashConstantDef(node as A.AstConstantDef);
            case "trait":
                return this.hashTrait(node as A.AstTrait);
            case "contract":
                return this.hashContract(node as A.AstContract);
            case "field_decl":
                return this.hashFieldDecl(node as A.AstFieldDecl);
            case "primitive_type_decl":
                return node.kind;
            case "contract_init":
                return this.hashContractInit(node as A.AstContractInit);
            case "native_function_decl":
                return this.hashNativeFunctionDecl(
                    node as A.AstNativeFunctionDecl,
                );
            case "receiver":
                return this.hashReceiver(node as A.AstReceiver);
            case "id":
                return "id";
            case "func_id":
                return "func_id";
            case "typed_parameter":
                return this.hashTypedParameter(node as A.AstTypedParameter);
            case "function_decl":
                return this.hashFunctionDecl(node as A.AstFunctionDecl);
            case "struct_field_initializer":
                return this.hashStructFieldInitializer(
                    node as A.AstStructFieldInitializer,
                );
            case "import":
                return this.hashImport(node as A.AstImport);
            case "constant_decl":
                return this.hashConstantDecl(node as A.AstConstantDecl);
            // Statements
            case "statement_let":
                return `${node.kind}|${node.type ? this.hash(node.type) : "null"}|${this.hash(node.expression)}`;
            case "statement_return":
                return `${node.kind}|${node.expression ? this.hash(node.expression) : "null"}`;
            case "statement_expression":
                return `${node.kind}|${this.hash(node.expression)}`;
            case "statement_assign":
                return `${node.kind}|${this.hash(node.path)}|${this.hash(node.expression)}`;
            case "statement_augmentedassign":
                return `${node.kind}|${node.op}|${this.hash(node.path)}|${this.hash(node.expression)}`;
            case "statement_condition": {
                const trueStatementsHash = this.hashStatements(
                    node.trueStatements,
                );
                const falseStatementsHash = node.falseStatements
                    ? this.hashStatements(node.falseStatements)
                    : "null";
                const elseifHash = node.elseif
                    ? this.hash(node.elseif)
                    : "null";
                return `${node.kind}|${this.hash(node.condition)}|${trueStatementsHash}|${falseStatementsHash}|${elseifHash}`;
            }
            case "statement_while":
                return `${node.kind}|${this.hash(node.condition)}|${this.hashStatements(node.statements)}`;
            case "statement_until":
                return `${node.kind}|${this.hash(node.condition)}|${this.hashStatements(node.statements)}`;
            case "statement_repeat":
                return `${node.kind}|${this.hash(node.iterations)}|${this.hashStatements(node.statements)}`;
            case "statement_try":
                if (node.catchBlock !== undefined) {
                    return `${node.kind}|${this.hashStatements(node.statements)}|${this.hash(node.catchBlock.catchName)}|${this.hashStatements(node.catchBlock.catchStatements)}`;
                }

                return `${node.kind}|${this.hashStatements(node.statements)}`;
            case "statement_foreach":
                return `${node.kind}|${this.hash(node.map)}|${this.hashStatements(node.statements)}`;
            case "statement_destruct":
                return `${node.kind}|${this.hash(node.type)}|${this.hashDestructIdentifiers(Array.from(node.identifiers.values()))}|${this.hash(node.expression)}`;
            case "statement_block": {
                const statementsHash = this.hashStatements(node.statements);
                return `${node.kind}|${statementsHash}`;
            }
            // Expressions
            case "op_binary":
                return `${node.kind}|${node.op}|${this.hash(node.left)}|${this.hash(node.right)}`;
            case "op_unary":
                return `${node.kind}|${node.op}|${this.hash(node.operand)}`;
            case "field_access":
                return `${node.kind}|${this.hash(node.aggregate)}|${node.field.kind}`;
            case "method_call": {
                const argsHash = node.args
                    .map((arg) => this.hash(arg))
                    .join("|");
                return `${node.kind}|${argsHash}`;
            }
            case "static_call": {
                const staticArgsHash = node.args
                    .map((arg) => this.hash(arg))
                    .join("|");
                return `${node.kind}|${staticArgsHash}`;
            }
            case "struct_instance": {
                const structArgsHash = node.args
                    .map((arg) => this.hashStructFieldInitializer(arg))
                    .join("|");
                return `${node.kind}|${structArgsHash}`;
            }
            case "init_of": {
                const initArgsHash = node.args
                    .map((arg) => this.hash(arg))
                    .join("|");
                return `${node.kind}|${initArgsHash}`;
            }
            case "conditional":
                return `${node.kind}|${this.hash(node.condition)}|${this.hash(node.thenBranch)}|${this.hash(node.elseBranch)}`;
            case "number":
                return `${node.kind}|${node.value}`;
            case "boolean":
                return `${node.kind}|${node.value}`;
            case "string":
                return `${node.kind}|${node.value}`;
            case "null":
                return node.kind;
            // Types
            case "type_id":
                return `${node.kind}|${node.text}`;
            case "optional_type":
                return `${node.kind}|${this.hash(node.typeArg)}`;
            case "map_type": {
                const keyStorageHash = node.keyStorageType
                    ? this.hash(node.keyStorageType)
                    : "null";
                const valueStorageHash = node.valueStorageType
                    ? this.hash(node.valueStorageType)
                    : "null";
                return `${node.kind}|${this.hash(node.keyType)}|${keyStorageHash}|${this.hash(node.valueType)}|${valueStorageHash}`;
            }
            case "bounced_message_type":
                return `${node.kind}|${this.hash(node.messageType)}`;
            default:
                throwInternalCompilerError(
                    `Unsupported node: ${JSONbig.stringify(node)}`,
                );
        }
    }

    private hashDestructIdentifiers(
        identifiers: readonly (readonly [A.AstId, A.AstId])[],
    ): string {
        const identifiersHash = identifiers
            .map(([key, value]) => `${this.hash(key)}|${this.hash(value)}`)
            .join("|");
        return identifiersHash;
    }

    private hashStructDecl(node: A.AstStructDecl): string {
        const fieldsHash = this.hashFields(node.fields);
        return `struct|${fieldsHash}`;
    }

    private hashMessageDecl(node: A.AstMessageDecl): string {
        const fieldsHash = this.hashFields(node.fields);
        return `message|${fieldsHash}|${node.opcode ? this.hash(node.opcode) : "null"}`;
    }

    private hashFunctionDef(node: A.AstFunctionDef): string {
        const attributesHash = this.hashAttributes(node.attributes);
        const returnHash = node.return ? this.hash(node.return) : "void";
        const paramsHash = this.hashParams(node.params);
        const statementsHash = this.hashStatements(node.statements);
        return `function|${attributesHash}|${returnHash}|${paramsHash}|${statementsHash}`;
    }

    private hashAsmFunctionDef(node: A.AstAsmFunctionDef): string {
        const asmAttributeHash = `asm|${this.hashIds(node.shuffle.args)}|->|${node.shuffle.ret.map((num) => num.value.toString()).join("|")}`;
        const attributesHash = this.hashAttributes(node.attributes);
        const returnHash = node.return ? this.hash(node.return) : "void";
        const paramsHash = this.hashParams(node.params);
        const instructionsHash = this.hashInstructions(node.instructions);
        return `function|${asmAttributeHash}|${attributesHash}|${returnHash}|${paramsHash}|${instructionsHash}`;
    }

    private hashConstantDef(node: A.AstConstantDef): string {
        const attributesHash = this.hashAttributes(node.attributes);
        const typeHash = this.hash(node.type);
        const initializerHash = this.hash(node.initializer);
        return `constant|${attributesHash}|${typeHash}|${initializerHash}`;
    }

    private hashTrait(node: A.AstTrait): string {
        const traitsHash = this.hashIds(node.traits);
        const attributesHash = this.hashContractAttributes(node.attributes);
        const declarationsHash = this.hashDeclarations(node.declarations);
        return `trait|${traitsHash}|${attributesHash}|${declarationsHash}`;
    }

    private hashContract(node: A.AstContract): string {
        const traitsHash = this.hashIds(node.traits);
        const attributesHash = this.hashContractAttributes(node.attributes);
        const declarationsHash = this.hashDeclarations(node.declarations);
        return `contract|${traitsHash}|${attributesHash}|${declarationsHash}`;
    }

    private hashFields(fields: readonly A.AstFieldDecl[]): string {
        let hashedFields = fields.map((field) => this.hashFieldDecl(field));
        if (this.sort) {
            hashedFields = hashedFields.sort();
        }
        return hashedFields.join("|");
    }

    private hashParams(params: readonly A.AstTypedParameter[]): string {
        let hashedParams = params.map((param) =>
            this.hashTypedParameter(param),
        );
        if (this.sort) {
            hashedParams = hashedParams.sort();
        }
        return hashedParams.join("|");
    }

    private hashTypedParameter(param: A.AstTypedParameter): string {
        const typeHash = this.hash(param.type);
        return `param|${typeHash}`;
    }

    private hashAttributes(
        attributes: readonly (
            | A.AstFunctionAttribute
            | A.AstConstantAttribute
        )[],
    ): string {
        return attributes
            .map((attr) => attr.type)
            .sort()
            .join("|");
    }

    private hashContractAttributes(
        attributes: readonly A.AstContractAttribute[],
    ): string {
        return attributes
            .map((attr) => `${attr.type}|${attr.name.value}`)
            .sort()
            .join("|");
    }

    private hashIds(ids: readonly A.AstId[]): string {
        return ids
            .map((id) => id.kind)
            .sort()
            .join("|"); // Ignore actual id.text, just hash based on kind
    }

    private hashDeclarations(declarations: readonly A.AstNode[]): string {
        let hashedDeclarations = declarations.map((decl) => this.hash(decl));
        if (this.sort) {
            hashedDeclarations = hashedDeclarations.sort();
        }
        return hashedDeclarations.join("|");
    }

    private hashStatements(statements: readonly A.AstStatement[]): string {
        let hashedStatements = statements.map((stmt) => this.hash(stmt));
        if (this.sort) {
            hashedStatements = hashedStatements.sort();
        }
        return hashedStatements.join("|");
    }

    private hashInstructions(
        instructions: readonly A.AstAsmInstruction[],
    ): string {
        return instructions.join("|");
    }

    private hashStructFieldInitializer(
        initializer: A.AstStructFieldInitializer,
    ): string {
        return `field_initializer|${this.hash(initializer.initializer)}`;
    }

    private hashFieldDecl(field: A.AstFieldDecl): string {
        const typeHash = this.hash(field.type);
        return `field|${typeHash}`;
    }

    private hashContractInit(node: A.AstContractInit): string {
        const paramsHash = this.hashParams(node.params);
        const statementsHash = this.hashStatements(node.statements);
        return `${node.kind}|${paramsHash}|${statementsHash}`;
    }

    private hashNativeFunctionDecl(node: A.AstNativeFunctionDecl): string {
        const attributesHash = this.hashAttributes(node.attributes);
        const paramsHash = this.hashParams(node.params);
        const returnHash = node.return ? this.hash(node.return) : "void";
        return `${node.kind}|${attributesHash}|${paramsHash}|${returnHash}`;
    }

    private hashReceiver(node: A.AstReceiver): string {
        const selectorHash = node.selector.kind;
        const statementsHash = this.hashStatements(node.statements);
        return `${node.kind}|${selectorHash}|${statementsHash}`;
    }

    private hashFunctionDecl(node: A.AstFunctionDecl): string {
        const attributesHash = this.hashAttributes(node.attributes);
        const returnHash = node.return ? this.hash(node.return) : "void";
        const paramsHash = this.hashParams(node.params);
        return `${node.kind}|${attributesHash}|${returnHash}|${paramsHash}`;
    }

    private hashImport(node: A.AstImport): string {
        const { language, type, path } = node.importPath;
        return `${node.kind}|${language}|${type}|${path.stepsUp}|${path.segments.join("/")}`;
    }

    private hashConstantDecl(node: A.AstConstantDecl): string {
        const attributesHash = this.hashAttributes(node.attributes);
        const typeHash = this.hash(node.type);
        return `${node.kind}|${attributesHash}|${typeHash}`;
    }

    private hashModule(node: A.AstModule): string {
        const importsHash = this.hashImports(node.imports);
        const itemsHash = this.hashModuleItems(node.items);
        return `${node.kind}|${importsHash}|${itemsHash}`;
    }

    private hashImports(imports: readonly A.AstImport[]): string {
        let hashedImports = imports.map((imp) => this.hash(imp));
        if (this.sort) {
            hashedImports = hashedImports.sort();
        }
        return hashedImports.join("|");
    }

    private hashModuleItems(items: readonly A.AstModuleItem[]): string {
        let hashedItems = items.map((item) => this.hash(item));
        if (this.sort) {
            hashedItems = hashedItems.sort();
        }
        return hashedItems.join("|");
    }
}
