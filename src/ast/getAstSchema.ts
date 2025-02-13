/**
 * AST node constructors are not just constructors: they also generate ids
 * We have this file so that the "current id" state would not be stored globally
 */

import * as A from "./ast";
import { FactoryAst } from "../ast/ast-helpers";
import { SrcInfo } from "../grammar/src-info";

export const getAstSchema = <T>(
    factory: FactoryAst,
    handle: (arg: T) => SrcInfo,
) => {
    const createNode = <T>(src: Omit<T, "id">): T => {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        return factory.createNode(src as any) as T;
    };

    return {
        Module: (
            imports: A.AstImport[],
            items: A.AstModuleItem[],
        ): A.AstModule =>
            createNode<A.AstModule>({ kind: "module", imports, items }),
        Import: (source: A.ImportPath, loc: T): A.AstImport =>
            createNode<A.AstImport>({
                kind: "import",
                importPath: source,
                loc: handle(loc),
            }),
        PrimitiveTypeDecl: (name: A.AstId, loc: T): A.AstPrimitiveTypeDecl =>
            createNode<A.AstPrimitiveTypeDecl>({
                kind: "primitive_type_decl",
                name,
                loc: handle(loc),
            }),
        FunctionDef: (
            attributes: A.AstFunctionAttribute[],
            name: A.AstId,
            retType: A.AstType | null,
            params: A.AstTypedParameter[],
            statements: A.AstStatement[],
            loc: T,
        ): A.AstFunctionDef =>
            createNode<A.AstFunctionDef>({
                kind: "function_def",
                attributes,
                name,
                return: retType,
                params,
                statements,
                loc: handle(loc),
            }),
        AsmFunctionDef: (
            shuffle: A.AstAsmShuffle,
            attributes: A.AstFunctionAttribute[],
            name: A.AstId,
            retType: A.AstType | null,
            params: A.AstTypedParameter[],
            instructions: A.AstAsmInstruction[],
            loc: T,
        ): A.AstAsmFunctionDef =>
            createNode<A.AstAsmFunctionDef>({
                kind: "asm_function_def",
                shuffle,
                attributes,
                name,
                return: retType,
                params,
                instructions,
                loc: handle(loc),
            }),
        FunctionDecl: (
            attributes: A.AstFunctionAttribute[],
            name: A.AstId,
            retType: A.AstType | null,
            params: A.AstTypedParameter[],
            loc: T,
        ): A.AstFunctionDecl =>
            createNode<A.AstFunctionDecl>({
                kind: "function_decl",
                attributes,
                name,
                return: retType,
                params,
                loc: handle(loc),
            }),
        NativeFunctionDecl: (
            attributes: A.AstFunctionAttribute[],
            name: A.AstId,
            nativeName: A.AstFuncId,
            params: A.AstTypedParameter[],
            retType: A.AstType | null,
            loc: T,
        ): A.AstNativeFunctionDecl =>
            createNode<A.AstNativeFunctionDecl>({
                kind: "native_function_decl",
                attributes,
                name,
                nativeName,
                params,
                return: retType,
                loc: handle(loc),
            }),
        ConstantDef: (
            attributes: A.AstConstantAttribute[],
            name: A.AstId,
            type: A.AstType,
            initializer: A.AstExpression,
            loc: T,
        ): A.AstConstantDef =>
            createNode<A.AstConstantDef>({
                kind: "constant_def",
                attributes,
                name,
                type,
                initializer,
                loc: handle(loc),
            }),
        ConstantDecl: (
            attributes: A.AstConstantAttribute[],
            name: A.AstId,
            type: A.AstType,
            loc: T,
        ): A.AstConstantDecl =>
            createNode<A.AstConstantDecl>({
                kind: "constant_decl",
                attributes,
                name,
                type,
                loc: handle(loc),
            }),
        StructDecl: (
            name: A.AstId,
            fields: A.AstFieldDecl[],
            loc: T,
        ): A.AstStructDecl =>
            createNode<A.AstStructDecl>({
                kind: "struct_decl",
                name,
                fields,
                loc: handle(loc),
            }),
        MessageDecl: (
            name: A.AstId,
            opcode: A.AstExpression | null,
            fields: A.AstFieldDecl[],
            loc: T,
        ): A.AstMessageDecl =>
            createNode<A.AstMessageDecl>({
                kind: "message_decl",
                name,
                opcode,
                fields,
                loc: handle(loc),
            }),
        Contract: (
            name: A.AstId,
            traits: A.AstId[],
            attributes: A.AstContractAttribute[],
            declarations: A.AstContractDeclaration[],
            loc: T,
        ): A.AstContract =>
            createNode<A.AstContract>({
                kind: "contract",
                name,
                traits,
                attributes,
                declarations,
                loc: handle(loc),
            }),
        Trait: (
            name: A.AstId,
            traits: A.AstId[],
            attributes: A.AstContractAttribute[],
            declarations: A.AstTraitDeclaration[],
            loc: T,
        ): A.AstTrait =>
            createNode<A.AstTrait>({
                kind: "trait",
                name,
                traits,
                attributes,
                declarations,
                loc: handle(loc),
            }),
        FieldDecl: (
            name: A.AstId,
            type: A.AstType,
            initializer: A.AstExpression | null,
            as: A.AstId | null,
            loc: T,
        ): A.AstFieldDecl =>
            createNode<A.AstFieldDecl>({
                kind: "field_decl",
                name,
                type,
                initializer,
                as,
                loc: handle(loc),
            }),
        Receiver: (
            selector: A.AstReceiverKind,
            statements: A.AstStatement[],
            loc: T,
        ): A.AstReceiver =>
            createNode<A.AstReceiver>({
                kind: "receiver",
                selector,
                statements,
                loc: handle(loc),
            }),
        ReceiverSimple: (param: A.AstTypedParameter): A.AstReceiverSimple =>
            createNode<A.AstReceiverSimple>({
                kind: "simple",
                param,
            }),
        ReceiverFallback: (): A.AstReceiverFallback =>
            createNode<A.AstReceiverFallback>({
                kind: "fallback",
            }),
        ReceiverComment: (comment: A.AstString): A.AstReceiverComment =>
            createNode<A.AstReceiverComment>({
                kind: "comment",
                comment,
            }),
        ReceiverInternal: (
            subKind: A.AstReceiverSubKind,
            loc: T,
        ): A.AstReceiverInternal =>
            createNode<A.AstReceiverInternal>({
                kind: "internal",
                subKind,
                loc: handle(loc),
            }),
        ReceiverExternal: (
            subKind: A.AstReceiverSubKind,
            loc: T,
        ): A.AstReceiverExternal =>
            createNode<A.AstReceiverExternal>({
                kind: "external",
                subKind,
                loc: handle(loc),
            }),
        ReceiverBounce: (
            param: A.AstTypedParameter,
            loc: T,
        ): A.AstReceiverBounce =>
            createNode<A.AstReceiverBounce>({
                kind: "bounce",
                param,
                loc: handle(loc),
            }),
        ContractInit: (
            params: A.AstTypedParameter[],
            statements: A.AstStatement[],
            loc: T,
        ): A.AstContractInit =>
            createNode<A.AstContractInit>({
                kind: "contract_init",
                params,
                statements,
                loc: handle(loc),
            }),
        StatementLet: (
            name: A.AstId,
            type: A.AstType | null,
            expression: A.AstExpression,
            loc: T,
        ): A.AstStatementLet =>
            createNode<A.AstStatementLet>({
                kind: "statement_let",
                name,
                type,
                expression,
                loc: handle(loc),
            }),
        StatementDestruct: (
            type: A.AstTypeId,
            identifiers: Map<string, [A.AstId, A.AstId]>,
            ignoreUnspecifiedFields: boolean,
            expression: A.AstExpression,
            loc: T,
        ): A.AstStatementDestruct =>
            createNode<A.AstStatementDestruct>({
                kind: "statement_destruct",
                type,
                identifiers,
                ignoreUnspecifiedFields,
                expression,
                loc: handle(loc),
            }),
        StatementReturn: (
            expression: A.AstExpression | null,
            loc: T,
        ): A.AstStatementReturn =>
            createNode<A.AstStatementReturn>({
                kind: "statement_return",
                expression,
                loc: handle(loc),
            }),
        StatementExpression: (
            expression: A.AstExpression,
            loc: T,
        ): A.AstStatementExpression =>
            createNode<A.AstStatementExpression>({
                kind: "statement_expression",
                expression,
                loc: handle(loc),
            }),
        StatementAssign: (
            path: A.AstExpression,
            expression: A.AstExpression,
            loc: T,
        ): A.AstStatementAssign =>
            createNode<A.AstStatementAssign>({
                kind: "statement_assign",
                path,
                expression,
                loc: handle(loc),
            }),
        StatementAugmentedAssign: (
            op: A.AstAugmentedAssignOperation,
            path: A.AstExpression,
            expression: A.AstExpression,
            loc: T,
        ): A.AstStatementAugmentedAssign =>
            createNode<A.AstStatementAugmentedAssign>({
                kind: "statement_augmentedassign",
                op,
                path,
                expression,
                loc: handle(loc),
            }),
        StatementCondition: (
            condition: A.AstExpression,
            trueStatements: A.AstStatement[],
            falseStatements: A.AstStatement[] | null,
            loc: T,
        ): A.AstStatementCondition =>
            createNode<A.AstStatementCondition>({
                kind: "statement_condition",
                condition,
                trueStatements,
                falseStatements,
                loc: handle(loc),
            }),
        StatementWhile: (
            condition: A.AstExpression,
            statements: A.AstStatement[],
            loc: T,
        ): A.AstStatementWhile =>
            createNode<A.AstStatementWhile>({
                kind: "statement_while",
                condition,
                statements,
                loc: handle(loc),
            }),
        StatementUntil: (
            condition: A.AstExpression,
            statements: A.AstStatement[],
            loc: T,
        ): A.AstStatementUntil =>
            createNode<A.AstStatementUntil>({
                kind: "statement_until",
                condition,
                statements,
                loc: handle(loc),
            }),
        StatementRepeat: (
            iterations: A.AstExpression,
            statements: A.AstStatement[],
            loc: T,
        ): A.AstStatementRepeat =>
            createNode<A.AstStatementRepeat>({
                kind: "statement_repeat",
                iterations,
                statements,
                loc: handle(loc),
            }),
        StatementTry: (
            statements: A.AstStatement[],
            loc: T,
            catchBlock?: {
                catchName: A.AstId;
                catchStatements: A.AstStatement[];
            },
        ): A.AstStatementTry =>
            createNode<A.AstStatementTry>({
                kind: "statement_try",
                statements,
                catchBlock: catchBlock,
                loc: handle(loc),
            }),
        StatementForEach: (
            keyName: A.AstId,
            valueName: A.AstId,
            map: A.AstExpression,
            statements: A.AstStatement[],
            loc: T,
        ): A.AstStatementForEach =>
            createNode<A.AstStatementForEach>({
                kind: "statement_foreach",
                keyName,
                valueName,
                map,
                statements,
                loc: handle(loc),
            }),
        StatementBlock: (
            statements: A.AstStatement[],
            loc: T,
        ): A.AstStatementBlock =>
            createNode<A.AstStatementBlock>({
                kind: "statement_block",
                statements,
                loc: handle(loc),
            }),
        TypeId: (text: string, loc: T): A.AstTypeId =>
            createNode<A.AstTypeId>({
                kind: "type_id",
                text,
                loc: handle(loc),
            }),
        OptionalType: (typeArg: A.AstType, loc: T): A.AstOptionalType =>
            createNode<A.AstOptionalType>({
                kind: "optional_type",
                typeArg,
                loc: handle(loc),
            }),
        MapType: (
            keyType: A.AstTypeId,
            keyStorageType: A.AstId | null,
            valueType: A.AstTypeId,
            valueStorageType: A.AstId | null,
            loc: T,
        ): A.AstMapType =>
            createNode<A.AstMapType>({
                kind: "map_type",
                keyType,
                keyStorageType,
                valueType,
                valueStorageType,
                loc: handle(loc),
            }),
        BouncedMessageType: (
            messageType: A.AstTypeId,
            loc: T,
        ): A.AstBouncedMessageType =>
            createNode<A.AstBouncedMessageType>({
                kind: "bounced_message_type",
                messageType,
                loc: handle(loc),
            }),
        OpBinary: (
            op: A.AstBinaryOperation,
            left: A.AstExpression,
            right: A.AstExpression,
            loc: T,
        ): A.AstOpBinary =>
            createNode<A.AstOpBinary>({
                kind: "op_binary",
                op,
                left,
                right,
                loc: handle(loc),
            }),
        OpUnary: (
            op: A.AstUnaryOperation,
            operand: A.AstExpression,
            loc: T,
        ): A.AstOpUnary =>
            createNode<A.AstOpUnary>({
                kind: "op_unary",
                op,
                operand,
                loc: handle(loc),
            }),
        FieldAccess: (
            aggregate: A.AstExpression,
            field: A.AstId,
            loc: T,
        ): A.AstFieldAccess =>
            createNode<A.AstFieldAccess>({
                kind: "field_access",
                aggregate,
                field,
                loc: handle(loc),
            }),
        MethodCall: (
            self: A.AstExpression,
            method: A.AstId,
            args: A.AstExpression[],
            loc: T,
        ): A.AstMethodCall =>
            createNode<A.AstMethodCall>({
                kind: "method_call",
                self,
                method,
                args,
                loc: handle(loc),
            }),
        StaticCall: (
            funcId: A.AstId,
            args: A.AstExpression[],
            loc: T,
        ): A.AstStaticCall =>
            createNode<A.AstStaticCall>({
                kind: "static_call",
                function: funcId,
                args,
                loc: handle(loc),
            }),
        StructInstance: (
            type: A.AstId,
            args: A.AstStructFieldInitializer[],
            loc: T,
        ): A.AstStructInstance =>
            createNode<A.AstStructInstance>({
                kind: "struct_instance",
                type,
                args,
                loc: handle(loc),
            }),
        StructFieldInitializer: (
            field: A.AstId,
            initializer: A.AstExpression,
            loc: T,
        ): A.AstStructFieldInitializer =>
            createNode<A.AstStructFieldInitializer>({
                kind: "struct_field_initializer",
                field,
                initializer,
                loc: handle(loc),
            }),
        InitOf: (
            contract: A.AstId,
            args: A.AstExpression[],
            loc: T,
        ): A.AstInitOf =>
            createNode<A.AstInitOf>({
                kind: "init_of",
                contract,
                args,
                loc: handle(loc),
            }),
        Conditional: (
            condition: A.AstExpression,
            thenBranch: A.AstExpression,
            elseBranch: A.AstExpression,
            loc: T,
        ): A.AstConditional =>
            createNode<A.AstConditional>({
                kind: "conditional",
                condition,
                thenBranch,
                elseBranch,
                loc: handle(loc),
            }),
        Id: (text: string, loc: T): A.AstId =>
            createNode<A.AstId>({ kind: "id", text, loc: handle(loc) }),
        FuncId: (text: string, loc: T): A.AstFuncId =>
            createNode<A.AstFuncId>({
                kind: "func_id",
                text,
                loc: handle(loc),
            }),
        Null: (loc: T): A.AstNull =>
            createNode<A.AstNull>({ kind: "null", loc: handle(loc) }),
        String: (value: string, loc: T): A.AstString =>
            createNode<A.AstString>({
                kind: "string",
                value,
                loc: handle(loc),
            }),
        Boolean: (value: boolean, loc: T): A.AstBoolean =>
            createNode<A.AstBoolean>({
                kind: "boolean",
                value,
                loc: handle(loc),
            }),
        Number: (base: A.AstNumberBase, value: bigint, loc: T): A.AstNumber =>
            createNode<A.AstNumber>({
                kind: "number",
                base,
                value,
                loc: handle(loc),
            }),
        ContractAttribute: (
            name: A.AstString,
            loc: T,
        ): A.AstContractAttribute =>
            createNode<A.AstContractAttribute>({
                type: "interface",
                name,
                loc: handle(loc),
            }),
        FunctionAttributeGet: (
            methodId: A.AstExpression | null,
            loc: T,
        ): A.AstFunctionAttributeGet => ({
            kind: "function_attribute",
            type: "get",
            methodId,
            loc: handle(loc),
        }),
        FunctionAttribute: (
            type: A.AstFunctionAttributeName,
            loc: T,
        ): A.AstFunctionAttributeRest => ({
            kind: "function_attribute",
            type,
            loc: handle(loc),
        }),
        ConstantAttribute: (
            type: A.AstConstantAttributeName,
            loc: T,
        ): A.AstConstantAttribute => ({ type, loc: handle(loc) }),
        TypedParameter: (
            name: A.AstId,
            type: A.AstType,
            loc: T,
        ): A.AstTypedParameter =>
            createNode<A.AstTypedParameter>({
                kind: "typed_parameter",
                name,
                type,
                loc: handle(loc),
            }),
        TypeTuple: (
            typeArgs: readonly A.AstTypeNext[],
            loc: T,
        ): A.AstTypeTuple =>
            createNode<A.AstTypeTuple>({
                kind: "tuple_type",
                typeArgs,
                loc: handle(loc),
            }),
        TypeUnit: (loc: T): A.AstTypeUnit =>
            createNode<A.AstTypeUnit>({
                kind: "unit_type",
                loc: handle(loc),
            }),
        TypeTensor: (
            typeArgs: readonly A.AstTypeNext[],
            loc: T,
        ): A.AstTypeTensor =>
            createNode<A.AstTypeTensor>({
                kind: "tensor_type",
                typeArgs,
                loc: handle(loc),
            }),
        TypeAs: (typeArg: A.AstTypeNext, name: A.AstId, loc: T): A.AstTypeAs =>
            createNode<A.AstTypeAs>({
                kind: "as_type",
                typeArg,
                name,
                loc: handle(loc),
            }),
        TypeGeneric: (
            name: A.AstTypeId,
            typeArgs: readonly A.AstTypeNext[],
            loc: T,
        ): A.AstTypeGeneric =>
            createNode<A.AstTypeGeneric>({
                kind: "generic_type",
                name,
                typeArgs,
                loc: handle(loc),
            }),
    };
};

/**
 * List of all constructors for AST nodes
 */
export type AstSchema<T> = ReturnType<typeof getAstSchema<T>>;
