import {
    AstConstantDef,
    AstReceiverKind,
    AstModuleItem,
    AstStructFieldInitializer,
    AstFunctionAttribute,
    AstOpBinary,
    AstOpUnary,
    AstFieldAccess,
    AstConditional,
    AstMethodCall,
    AstStaticCall,
    AstNumber,
    AstBoolean,
    AstString,
    AstStructInstance,
    AstInitOf,
    AstConstantAttribute,
    AstContractAttribute,
    AstTypedParameter,
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
    AstContract,
    AstTrait,
    AstId,
    AstModule,
    AstStructDecl,
    AstMessageDecl,
    AstFunctionDecl,
    AstConstantDecl,
    AstContractInit,
    AstPrimitiveTypeDecl,
    AstTypeId,
    AstMapType,
    AstBouncedMessageType,
    AstFieldDecl,
    AstOptionalType,
    AstNode,
    AstFuncId,
} from "./ast";
import { createHash } from "crypto";
import { throwInternalCompilerError } from "../errors";

export type AstHash = string;

/**
 * Provides functionality to hash AST nodes regardless of names of the elements.
 */
export class AstHasher {
    private constructor(private readonly sort: boolean) {}
    public static make(params: Partial<{ sort: boolean }> = {}): AstHasher {
        const { sort = true } = params;
        return new AstHasher(sort);
    }

    public hash(node: AstNode): AstHash {
        const hasher = AstHasher.make();
        switch (node.kind) {
            case "struct_decl":
                return hasher.hashStructDecl(node);
            case "message_decl":
                return hasher.hashMessageDecl(node);
            default:
                throwInternalCompilerError(`Unsupported node: ${node.kind}`);
        }
    }

    public hashStructDecl(node: AstStructDecl): string {
        const fieldsHash = this.hashFields(node.fields);
        return this.hashString(`struct|${fieldsHash}`);
    }

    public hashMessageDecl(node: AstMessageDecl): string {
        const fieldsHash = this.hashFields(node.fields);
        return this.hashString(`message|${fieldsHash}|${node.opcode}`);
    }

    private hashFields(fields: AstFieldDecl[]): string {
        let hashedFields = fields.map((field) => this.hashFieldDecl(field));
        if (this.sort) {
            hashedFields = hashedFields.sort();
        }
        return hashedFields.join("|");
    }

    private hashString(data: string): string {
        return createHash("sha256").update(data).digest("hex");
    }

    public hashFieldDecl(field: AstFieldDecl): string {
        const typeHash = this.hashAstNode(field.type);
        return `field|${typeHash}`;
    }

    private hashAstNode(node: AstNode): string {
        switch (node.kind) {
            case "type_id":
                return node.text;
            default:
                return node.kind;
        }
    }
}
