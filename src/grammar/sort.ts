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

/**
 * Provides utilities to sort lists of AST nodes.
 */
export class AstSorter {
    private constructor() {}
    public static make(): AstSorter {
        return new AstSorter();
    }

    public sort<T extends AstNode>(items: T[]): T[] {
        if (items.length === 0) {
            return items;
        }
        const kind = items[0]!.kind;
        switch (kind) {
            case "primitive_type_decl":
                return this.sortPrimitiveTypeDecls(
                    items as AstPrimitiveTypeDecl[],
                ) as T[];
            default:
                throwInternalCompilerError(`Unsupported node kind: ${kind}`);
        }
    }

    private sortPrimitiveTypeDecls(
        decls: AstPrimitiveTypeDecl[],
    ): AstPrimitiveTypeDecl[] {
        return decls.sort((a, b) => {
            // Case-insensitive sorting
            const nameA = a.name.text.toLowerCase();
            const nameB = b.name.text.toLowerCase();
            if (nameA < nameB) {
                return -1;
            }
            if (nameA > nameB) {
                return 1;
            }
            return 0;
        });
    }
}
