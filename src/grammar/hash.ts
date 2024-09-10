import {
    AstConstantDef,
    AstModuleItem,
    AstStatement,
    AstStructFieldInitializer,
    AstFunctionAttribute,
    AstConstantAttribute,
    AstContractAttribute,
    AstTypedParameter,
    AstImport,
    AstNativeFunctionDecl,
    AstReceiver,
    AstFunctionDef,
    AstContract,
    AstTrait,
    AstId,
    AstModule,
    AstStructDecl,
    AstMessageDecl,
    AstFunctionDecl,
    AstConstantDecl,
    AstContractInit,
    AstFieldDecl,
    AstNode,
    AstAsmFunctionDef,
    AstAsmInstruction,
} from "./ast";
import { createHash } from "crypto";
import { throwInternalCompilerError } from "../errors";
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

    public hash(node: AstNode): AstHash {
        const data =
            node.kind === "id" || node.kind === "func_id"
                ? `${node.kind}_${node.text}`
                : this.getHashData(node);
        return createHash("sha256").update(data).digest("hex");
    }

    /**
     * Generates a string that is used to create a hash.
     */
    private getHashData(node: AstNode): string {
        switch (node.kind) {
            case "module":
                return this.hashModule(node);
            case "struct_decl":
                return this.hashStructDecl(node);
            case "message_decl":
                return this.hashMessageDecl(node);
            case "function_def":
                return this.hashFunctionDef(node);
            case "asm_function_def":
                return this.hashAsmFunctionDef(node);
            case "constant_def":
                return this.hashConstantDef(node);
            case "trait":
                return this.hashTrait(node);
            case "contract":
                return this.hashContract(node);
            case "field_decl":
                return this.hashFieldDecl(node);
            case "primitive_type_decl":
                return `${node.kind}|${node.name.kind}`;
            case "contract_init":
                return this.hashContractInit(node);
            case "native_function_decl":
                return this.hashNativeFunctionDecl(node);
            case "receiver":
                return this.hashReceiver(node);
            case "id":
                return "id";
            case "func_id":
                return "func_id";
            case "typed_parameter":
                return this.hashTypedParameter(node);
            case "function_decl":
                return this.hashFunctionDecl(node);
            case "struct_field_initializer":
                return this.hashStructFieldInitializer(node);
            case "import":
                return this.hashImport(node);
            case "constant_decl":
                return this.hashConstantDecl(node);
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
                return `${node.kind}|${this.hashStatements(node.statements)}`;
            case "statement_try_catch":
                return `${node.kind}|${this.hashStatements(node.statements)}|${this.hash(node.catchName)}|${this.hashStatements(node.catchStatements)}`;
            case "statement_foreach":
                return `${node.kind}|${this.hash(node.map)}|${this.hashStatements(node.statements)}`;
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

    private hashStructDecl(node: AstStructDecl): string {
        const fieldsHash = this.hashFields(node.fields);
        return `struct|${fieldsHash}`;
    }

    private hashMessageDecl(node: AstMessageDecl): string {
        const fieldsHash = this.hashFields(node.fields);
        return `message|${fieldsHash}|${node.opcode?.value}`;
    }

    private hashFunctionDef(node: AstFunctionDef): string {
        const attributesHash = this.hashAttributes(node.attributes);
        const returnHash = node.return ? this.hash(node.return) : "void";
        const paramsHash = this.hashParams(node.params);
        const statementsHash = this.hashStatements(node.statements);
        return `function|${attributesHash}|${returnHash}|${paramsHash}|${statementsHash}`;
    }

    private hashAsmFunctionDef(node: AstAsmFunctionDef): string {
        const asmAttributeHash = `asm|${this.hashIds(node.shuffle.args)}|->|${node.shuffle.ret.map((num) => num.value.toString()).join("|")}`;
        const attributesHash = this.hashAttributes(node.attributes);
        const returnHash = node.return ? this.hash(node.return) : "void";
        const paramsHash = this.hashParams(node.params);
        const instructionsHash = this.hashInstructions(node.instructions);
        return `function|${asmAttributeHash}|${attributesHash}|${returnHash}|${paramsHash}|${instructionsHash}`;
    }

    private hashConstantDef(node: AstConstantDef): string {
        const attributesHash = this.hashAttributes(node.attributes);
        const typeHash = this.hash(node.type);
        const initializerHash = this.hash(node.initializer);
        return `constant|${attributesHash}|${typeHash}|${initializerHash}`;
    }

    private hashTrait(node: AstTrait): string {
        const traitsHash = this.hashIds(node.traits);
        const attributesHash = this.hashContractAttributes(node.attributes);
        const declarationsHash = this.hashDeclarations(node.declarations);
        return `trait|${traitsHash}|${attributesHash}|${declarationsHash}`;
    }

    private hashContract(node: AstContract): string {
        const traitsHash = this.hashIds(node.traits);
        const attributesHash = this.hashContractAttributes(node.attributes);
        const declarationsHash = this.hashDeclarations(node.declarations);
        return `contract|${traitsHash}|${attributesHash}|${declarationsHash}`;
    }

    private hashFields(fields: AstFieldDecl[]): string {
        let hashedFields = fields.map((field) => this.hashFieldDecl(field));
        if (this.sort) {
            hashedFields = hashedFields.sort();
        }
        return hashedFields.join("|");
    }

    private hashParams(params: AstTypedParameter[]): string {
        let hashedParams = params.map((param) =>
            this.hashTypedParameter(param),
        );
        if (this.sort) {
            hashedParams = hashedParams.sort();
        }
        return hashedParams.join("|");
    }

    private hashTypedParameter(param: AstTypedParameter): string {
        const typeHash = this.hash(param.type);
        return `param|${typeHash}`;
    }

    private hashAttributes(
        attributes: (AstFunctionAttribute | AstConstantAttribute)[],
    ): string {
        return attributes
            .map((attr) => attr.type)
            .sort()
            .join("|");
    }

    private hashContractAttributes(attributes: AstContractAttribute[]): string {
        return attributes
            .map((attr) => `${attr.type}|${attr.name.value}`)
            .sort()
            .join("|");
    }

    private hashIds(ids: AstId[]): string {
        return ids
            .map((id) => id.kind)
            .sort()
            .join("|"); // Ignore actual id.text, just hash based on kind
    }

    private hashDeclarations(declarations: AstNode[]): string {
        let hashedDeclarations = declarations.map((decl) => this.hash(decl));
        if (this.sort) {
            hashedDeclarations = hashedDeclarations.sort();
        }
        return hashedDeclarations.join("|");
    }

    private hashStatements(statements: AstStatement[]): string {
        let hashedStatements = statements.map((stmt) => this.hash(stmt));
        if (this.sort) {
            hashedStatements = hashedStatements.sort();
        }
        return hashedStatements.join("|");
    }

    private hashInstructions(instructions: AstAsmInstruction[]): string {
        return instructions.join("|");
    }

    private hashStructFieldInitializer(
        initializer: AstStructFieldInitializer,
    ): string {
        return `field_initializer|${this.hash(initializer.initializer)}`;
    }

    private hashFieldDecl(field: AstFieldDecl): string {
        const typeHash = this.hash(field.type);
        return `field|${typeHash}`;
    }

    private hashContractInit(node: AstContractInit): string {
        const paramsHash = this.hashParams(node.params);
        const statementsHash = this.hashStatements(node.statements);
        return `${node.kind}|${paramsHash}|${statementsHash}`;
    }

    private hashNativeFunctionDecl(node: AstNativeFunctionDecl): string {
        const attributesHash = this.hashAttributes(node.attributes);
        const paramsHash = this.hashParams(node.params);
        const returnHash = node.return ? this.hash(node.return) : "void";
        return `${node.kind}|${attributesHash}|${paramsHash}|${returnHash}`;
    }

    private hashReceiver(node: AstReceiver): string {
        const selectorHash = node.selector.kind;
        const statementsHash = this.hashStatements(node.statements);
        return `${node.kind}|${selectorHash}|${statementsHash}`;
    }

    private hashFunctionDecl(node: AstFunctionDecl): string {
        const attributesHash = this.hashAttributes(node.attributes);
        const returnHash = node.return ? this.hash(node.return) : "void";
        const paramsHash = this.hashParams(node.params);
        return `${node.kind}|${attributesHash}|${returnHash}|${paramsHash}`;
    }

    private hashImport(node: AstImport): string {
        return `${node.kind}|${this.hash(node.path)}`;
    }

    private hashConstantDecl(node: AstConstantDecl): string {
        const attributesHash = this.hashAttributes(node.attributes);
        const typeHash = this.hash(node.type);
        return `${node.kind}|${attributesHash}|${typeHash}`;
    }

    private hashModule(node: AstModule): string {
        const importsHash = this.hashImports(node.imports);
        const itemsHash = this.hashModuleItems(node.items);
        return `${node.kind}|${importsHash}|${itemsHash}`;
    }

    private hashImports(imports: AstImport[]): string {
        let hashedImports = imports.map((imp) => this.hash(imp));
        if (this.sort) {
            hashedImports = hashedImports.sort();
        }
        return hashedImports.join("|");
    }

    private hashModuleItems(items: AstModuleItem[]): string {
        let hashedItems = items.map((item) => this.hash(item));
        if (this.sort) {
            hashedItems = hashedItems.sort();
        }
        return hashedItems.join("|");
    }
}
