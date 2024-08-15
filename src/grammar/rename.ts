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
import { dummySrcInfo } from "./grammar";
import { AstHasher, AstHash } from "./hash";
import { topologicalSort } from "../utils/utils";
import { throwInternalCompilerError } from "../errors";
import JSONbig from "json-bigint";

type GivenName = string;

function id(text: string): AstId {
    return { kind: "id", text, id: 0, loc: dummySrcInfo };
}

/**
 * An utility class that provides alpha-renaming and topological sort functionality
 * for the AST comparation.
 */
export class AstRenamer {
    private constructor(
        private sort: boolean,
        private currentIdx: number = 0,
        private renamed: Map<AstHash, GivenName> = new Map(),
    ) {}
    public static make(params: Partial<{ sort: boolean }> = {}): AstRenamer {
        const { sort = true } = params;
        return new AstRenamer(sort);
    }

    /**
     * Renames the given node based on its AST.
     */
    public rename(node: AstNode): AstNode {
        switch (node.kind) {
            case "module":
                // TODO: Sort imports. Does their order affect the behavior of transitive dependencies?
                return { ...node, items: this.renameModuleItems(node.items) };
            default:
                throwInternalCompilerError(
                    `Unsupported node kind: ${node.kind}`,
                );
        }
    }

    private nextIdx(): number {
        const value = this.currentIdx;
        this.currentIdx += 1;
        return value;
    }

    /**
     * Generates a new unique node name.
     */
    private generateName(node: AstNode): GivenName {
        const generate = (prefix: string) => `${prefix}_${this.nextIdx()}`;
        switch (node.kind) {
            case "struct_decl":
                return generate("struct");
            case "message_decl":
                return generate("message");
            default:
                throwInternalCompilerError(`Unsupported node: ${node.kind}`);
        }
    }

    /**
     * Sets new or an existent name based on node's hash.
     */
    private setName(node: AstNode): GivenName {
        const hash = AstHasher.make({ sort: this.sort }).hash(node);
        const existentName = this.renamed.get(hash);
        if (existentName !== undefined) {
            return existentName;
        }
        const name = this.generateName(node);
        this.renamed.set(hash, name);
        return name;
    }

    public renameModuleItems(items: AstModuleItem[]): AstModuleItem[] {
        const primitives = items.filter(
            (item) => item.kind === "primitive_type_decl",
        );

        // TODO: Rename if they refer to the same FunC function.
        const nativeFunctions = items.filter(
            (item) => item.kind === "native_function_decl",
        );

        // Struct and messages can have other structs as their fields.
        // But we don't care; they should have the same name after renaming.
        const structs = this.renameItems(
            items,
            "struct_decl",
            this.setName.bind(this),
            id,
        );
        const messages = this.renameItems(
            items,
            "message_decl",
            this.setName.bind(this),
            id,
        );

        // TODO: Rename
        const functions = items.filter((item) => item.kind === "function_def");

        // TODO: Rename
        const constants = items.filter((item) => item.kind === "constant_def");

        // TODO: Rename
        const traits = items.filter((item) => item.kind === "trait");

        // TODO: Rename
        const contracts = items.filter((item) => item.kind === "contract");

        // TODO: Sort if requested.
        return [
            ...primitives,
            ...nativeFunctions,
            ...structs,
            ...messages,
            ...functions,
            ...constants,
            ...traits,
            ...contracts,
        ];
    }

    private renameItems<T extends { kind: string; name: AstId }>(
        items: T[],
        targetKind: T["kind"],
        setName: (item: T) => string,
        id: (newName: string) => AstId,
    ): T[] {
        return items.reduce((acc, item) => {
            if (item.kind === targetKind) {
                const newName = setName(item);
                acc.push({ ...item, name: id(newName) });
            }
            return acc;
        }, [] as T[]);
    }
}
