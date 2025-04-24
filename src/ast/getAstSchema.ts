/**
 * AST node constructors are not just constructors: they also generate ids
 * We have this file so that the "current id" state would not be stored globally
 */

import type { Loc } from "@tonstudio/parser-runtime";
import type * as Ast from "@/ast/ast";
import type { FactoryAst } from "@/ast/ast-helpers";
import type { SrcInfo } from "@/grammar/src-info";

export const getAstSchema = (
    factory: FactoryAst,
    toSrcInfo: (location: Loc) => SrcInfo,
) => {
    const createNode = <T>(src: Omit<T, "id">): T => {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        return factory.createNode(src as any) as T;
    };

    return {
        Module: (imports: Ast.Import[], items: Ast.ModuleItem[]): Ast.Module =>
            createNode<Ast.Module>({ kind: "module", imports, items }),
        Import: (source: Ast.ImportPath, loc: Loc): Ast.Import =>
            createNode<Ast.Import>({
                kind: "import",
                importPath: source,
                loc: toSrcInfo(loc),
            }),
        PrimitiveTypeDecl: (name: Ast.Id, loc: Loc): Ast.PrimitiveTypeDecl =>
            createNode<Ast.PrimitiveTypeDecl>({
                kind: "primitive_type_decl",
                name,
                loc: toSrcInfo(loc),
            }),
        FunctionDef: (
            attributes: Ast.FunctionAttribute[],
            name: Ast.Id,
            retType: Ast.Type | undefined,
            params: Ast.TypedParameter[],
            statements: Ast.Statement[],
            loc: Loc,
        ): Ast.FunctionDef =>
            createNode<Ast.FunctionDef>({
                kind: "function_def",
                attributes,
                name,
                return: retType,
                params,
                statements,
                loc: toSrcInfo(loc),
            }),
        AsmFunctionDef: (
            shuffle: Ast.AsmShuffle,
            attributes: Ast.FunctionAttribute[],
            name: Ast.Id,
            retType: Ast.Type | undefined,
            params: Ast.TypedParameter[],
            instructions: Ast.AsmInstruction[],
            loc: Loc,
        ): Ast.AsmFunctionDef =>
            createNode<Ast.AsmFunctionDef>({
                kind: "asm_function_def",
                shuffle,
                attributes,
                name,
                return: retType,
                params,
                instructions,
                loc: toSrcInfo(loc),
            }),
        FunctionDecl: (
            attributes: Ast.FunctionAttribute[],
            name: Ast.Id,
            retType: Ast.Type | undefined,
            params: Ast.TypedParameter[],
            loc: Loc,
        ): Ast.FunctionDecl =>
            createNode<Ast.FunctionDecl>({
                kind: "function_decl",
                attributes,
                name,
                return: retType,
                params,
                loc: toSrcInfo(loc),
            }),
        NativeFunctionDecl: (
            attributes: Ast.FunctionAttribute[],
            name: Ast.Id,
            nativeName: Ast.FuncId,
            params: Ast.TypedParameter[],
            retType: Ast.Type | undefined,
            loc: Loc,
        ): Ast.NativeFunctionDecl =>
            createNode<Ast.NativeFunctionDecl>({
                kind: "native_function_decl",
                attributes,
                name,
                nativeName,
                params,
                return: retType,
                loc: toSrcInfo(loc),
            }),
        ConstantDef: (
            attributes: Ast.ConstantAttribute[],
            name: Ast.Id,
            type: Ast.Type,
            initializer: Ast.Expression,
            loc: Loc,
        ): Ast.ConstantDef =>
            createNode<Ast.ConstantDef>({
                kind: "constant_def",
                attributes,
                name,
                type,
                initializer,
                loc: toSrcInfo(loc),
            }),
        ConstantDecl: (
            attributes: Ast.ConstantAttribute[],
            name: Ast.Id,
            type: Ast.Type,
            loc: Loc,
        ): Ast.ConstantDecl =>
            createNode<Ast.ConstantDecl>({
                kind: "constant_decl",
                attributes,
                name,
                type,
                loc: toSrcInfo(loc),
            }),
        StructDecl: (
            name: Ast.Id,
            fields: Ast.FieldDecl[],
            loc: Loc,
        ): Ast.StructDecl =>
            createNode<Ast.StructDecl>({
                kind: "struct_decl",
                name,
                fields,
                loc: toSrcInfo(loc),
            }),
        MessageDecl: (
            name: Ast.Id,
            opcode: Ast.Expression | undefined,
            fields: Ast.FieldDecl[],
            loc: Loc,
        ): Ast.MessageDecl =>
            createNode<Ast.MessageDecl>({
                kind: "message_decl",
                name,
                opcode,
                fields,
                loc: toSrcInfo(loc),
            }),
        Contract: (
            name: Ast.Id,
            traits: Ast.Id[],
            attributes: Ast.ContractAttribute[],
            params: undefined | readonly Ast.FieldDecl[],
            declarations: Ast.ContractDeclaration[],
            loc: Loc,
        ): Ast.Contract =>
            createNode<Ast.Contract>({
                kind: "contract",
                name,
                traits,
                attributes,
                params,
                declarations,
                loc: toSrcInfo(loc),
            }),
        Trait: (
            name: Ast.Id,
            traits: Ast.Id[],
            attributes: Ast.ContractAttribute[],
            declarations: Ast.TraitDeclaration[],
            loc: Loc,
        ): Ast.Trait =>
            createNode<Ast.Trait>({
                kind: "trait",
                name,
                traits,
                attributes,
                declarations,
                loc: toSrcInfo(loc),
            }),
        FieldDecl: (
            name: Ast.Id,
            type: Ast.Type,
            initializer: Ast.Expression | undefined,
            as: Ast.Id | undefined,
            loc: Loc,
        ): Ast.FieldDecl =>
            createNode<Ast.FieldDecl>({
                kind: "field_decl",
                name,
                type,
                initializer,
                as,
                loc: toSrcInfo(loc),
            }),
        Receiver: (
            selector: Ast.ReceiverKind,
            statements: Ast.Statement[],
            loc: Loc,
        ): Ast.Receiver =>
            createNode<Ast.Receiver>({
                kind: "receiver",
                selector,
                statements,
                loc: toSrcInfo(loc),
            }),
        ReceiverSimple: (param: Ast.TypedParameter): Ast.ReceiverSimple =>
            createNode<Ast.ReceiverSimple>({
                kind: "simple",
                param,
            }),
        ReceiverFallback: (): Ast.ReceiverFallback =>
            createNode<Ast.ReceiverFallback>({
                kind: "fallback",
            }),
        ReceiverComment: (comment: Ast.String): Ast.ReceiverComment =>
            createNode<Ast.ReceiverComment>({
                kind: "comment",
                comment,
            }),
        ReceiverInternal: (
            subKind: Ast.ReceiverSubKind,
            loc: Loc,
        ): Ast.ReceiverInternal =>
            createNode<Ast.ReceiverInternal>({
                kind: "internal",
                subKind,
                loc: toSrcInfo(loc),
            }),
        ReceiverExternal: (
            subKind: Ast.ReceiverSubKind,
            loc: Loc,
        ): Ast.ReceiverExternal =>
            createNode<Ast.ReceiverExternal>({
                kind: "external",
                subKind,
                loc: toSrcInfo(loc),
            }),
        ReceiverBounce: (
            param: Ast.TypedParameter,
            loc: Loc,
        ): Ast.ReceiverBounce =>
            createNode<Ast.ReceiverBounce>({
                kind: "bounce",
                param,
                loc: toSrcInfo(loc),
            }),
        ContractInit: (
            params: Ast.TypedParameter[],
            statements: Ast.Statement[],
            loc: Loc,
        ): Ast.ContractInit =>
            createNode<Ast.ContractInit>({
                kind: "contract_init",
                params,
                statements,
                loc: toSrcInfo(loc),
            }),
        StatementLet: (
            name: Ast.OptionalId,
            type: Ast.Type | undefined,
            expression: Ast.Expression,
            loc: Loc,
        ): Ast.StatementLet =>
            createNode<Ast.StatementLet>({
                kind: "statement_let",
                name,
                type,
                expression,
                loc: toSrcInfo(loc),
            }),
        StatementDestruct: (
            type: Ast.TypeId,
            identifiers: Map<string, [Ast.Id, Ast.OptionalId]>,
            ignoreUnspecifiedFields: boolean,
            expression: Ast.Expression,
            loc: Loc,
        ): Ast.StatementDestruct =>
            createNode<Ast.StatementDestruct>({
                kind: "statement_destruct",
                type,
                identifiers,
                ignoreUnspecifiedFields,
                expression,
                loc: toSrcInfo(loc),
            }),
        StatementReturn: (
            expression: Ast.Expression | undefined,
            loc: Loc,
        ): Ast.StatementReturn =>
            createNode<Ast.StatementReturn>({
                kind: "statement_return",
                expression,
                loc: toSrcInfo(loc),
            }),
        StatementExpression: (
            expression: Ast.Expression,
            loc: Loc,
        ): Ast.StatementExpression =>
            createNode<Ast.StatementExpression>({
                kind: "statement_expression",
                expression,
                loc: toSrcInfo(loc),
            }),
        StatementAssign: (
            path: Ast.Expression,
            expression: Ast.Expression,
            loc: Loc,
        ): Ast.StatementAssign =>
            createNode<Ast.StatementAssign>({
                kind: "statement_assign",
                path,
                expression,
                loc: toSrcInfo(loc),
            }),
        StatementAugmentedAssign: (
            op: Ast.AugmentedAssignOperation,
            path: Ast.Expression,
            expression: Ast.Expression,
            loc: Loc,
        ): Ast.StatementAugmentedAssign =>
            createNode<Ast.StatementAugmentedAssign>({
                kind: "statement_augmentedassign",
                op,
                path,
                expression,
                loc: toSrcInfo(loc),
            }),
        StatementCondition: (
            condition: Ast.Expression,
            trueStatements: Ast.Statement[],
            falseStatements: Ast.Statement[] | undefined,
            loc: Loc,
        ): Ast.StatementCondition =>
            createNode<Ast.StatementCondition>({
                kind: "statement_condition",
                condition,
                trueStatements,
                falseStatements,
                loc: toSrcInfo(loc),
            }),
        StatementWhile: (
            condition: Ast.Expression,
            statements: Ast.Statement[],
            loc: Loc,
        ): Ast.StatementWhile =>
            createNode<Ast.StatementWhile>({
                kind: "statement_while",
                condition,
                statements,
                loc: toSrcInfo(loc),
            }),
        StatementUntil: (
            condition: Ast.Expression,
            statements: Ast.Statement[],
            loc: Loc,
        ): Ast.StatementUntil =>
            createNode<Ast.StatementUntil>({
                kind: "statement_until",
                condition,
                statements,
                loc: toSrcInfo(loc),
            }),
        StatementRepeat: (
            iterations: Ast.Expression,
            statements: Ast.Statement[],
            loc: Loc,
        ): Ast.StatementRepeat =>
            createNode<Ast.StatementRepeat>({
                kind: "statement_repeat",
                iterations,
                statements,
                loc: toSrcInfo(loc),
            }),
        StatementTry: (
            statements: Ast.Statement[],
            loc: Loc,
            catchBlock?: {
                catchName: Ast.OptionalId;
                catchStatements: Ast.Statement[];
            },
        ): Ast.StatementTry =>
            createNode<Ast.StatementTry>({
                kind: "statement_try",
                statements,
                catchBlock: catchBlock,
                loc: toSrcInfo(loc),
            }),
        StatementForEach: (
            keyName: Ast.OptionalId,
            valueName: Ast.OptionalId,
            map: Ast.Expression,
            statements: Ast.Statement[],
            loc: Loc,
        ): Ast.StatementForEach =>
            createNode<Ast.StatementForEach>({
                kind: "statement_foreach",
                keyName,
                valueName,
                map,
                statements,
                loc: toSrcInfo(loc),
            }),
        StatementBlock: (
            statements: Ast.Statement[],
            loc: Loc,
        ): Ast.StatementBlock =>
            createNode<Ast.StatementBlock>({
                kind: "statement_block",
                statements,
                loc: toSrcInfo(loc),
            }),
        TypeId: (text: string, loc: Loc): Ast.TypeId =>
            createNode<Ast.TypeId>({
                kind: "type_id",
                text,
                loc: toSrcInfo(loc),
            }),
        OptionalType: (typeArg: Ast.Type, loc: Loc): Ast.OptionalType =>
            createNode<Ast.OptionalType>({
                kind: "optional_type",
                typeArg,
                loc: toSrcInfo(loc),
            }),
        MapType: (
            keyType: Ast.TypeId,
            keyStorageType: Ast.Id | undefined,
            valueType: Ast.TypeId,
            valueStorageType: Ast.Id | undefined,
            loc: Loc,
        ): Ast.MapType =>
            createNode<Ast.MapType>({
                kind: "map_type",
                keyType,
                keyStorageType,
                valueType,
                valueStorageType,
                loc: toSrcInfo(loc),
            }),
        BouncedMessageType: (
            messageType: Ast.TypeId,
            loc: Loc,
        ): Ast.BouncedMessageType =>
            createNode<Ast.BouncedMessageType>({
                kind: "bounced_message_type",
                messageType,
                loc: toSrcInfo(loc),
            }),
        OpBinary: (
            op: Ast.BinaryOperation,
            left: Ast.Expression,
            right: Ast.Expression,
            loc: Loc,
        ): Ast.OpBinary =>
            createNode<Ast.OpBinary>({
                kind: "op_binary",
                op,
                left,
                right,
                loc: toSrcInfo(loc),
            }),
        OpUnary: (
            op: Ast.UnaryOperation,
            operand: Ast.Expression,
            loc: Loc,
        ): Ast.OpUnary =>
            createNode<Ast.OpUnary>({
                kind: "op_unary",
                op,
                operand,
                loc: toSrcInfo(loc),
            }),
        FieldAccess: (
            aggregate: Ast.Expression,
            field: Ast.Id,
            loc: Loc,
        ): Ast.FieldAccess =>
            createNode<Ast.FieldAccess>({
                kind: "field_access",
                aggregate,
                field,
                loc: toSrcInfo(loc),
            }),
        MethodCall: (
            self: Ast.Expression,
            method: Ast.Id,
            args: Ast.Expression[],
            loc: Loc,
        ): Ast.MethodCall =>
            createNode<Ast.MethodCall>({
                kind: "method_call",
                self,
                method,
                args,
                loc: toSrcInfo(loc),
            }),
        StaticCall: (
            funcId: Ast.Id,
            args: Ast.Expression[],
            loc: Loc,
        ): Ast.StaticCall =>
            createNode<Ast.StaticCall>({
                kind: "static_call",
                function: funcId,
                args,
                loc: toSrcInfo(loc),
            }),
        StructInstance: (
            type: Ast.Id,
            args: Ast.StructFieldInitializer[],
            loc: Loc,
        ): Ast.StructInstance =>
            createNode<Ast.StructInstance>({
                kind: "struct_instance",
                type,
                args,
                loc: toSrcInfo(loc),
            }),
        StructFieldInitializer: (
            field: Ast.Id,
            initializer: Ast.Expression,
            loc: Loc,
        ): Ast.StructFieldInitializer =>
            createNode<Ast.StructFieldInitializer>({
                kind: "struct_field_initializer",
                field,
                initializer,
                loc: toSrcInfo(loc),
            }),
        MapLiteral: (
            type: Ast.MapType,
            fields: readonly Ast.MapField[],
            loc: Loc,
        ): Ast.MapLiteral =>
            createNode<Ast.MapLiteral>({
                kind: "map_literal",
                type,
                fields,
                loc: toSrcInfo(loc),
            }),
        SetLiteral: (
            valueType: Ast.TypeId,
            valueStorageType: Ast.Id | undefined,
            fields: readonly Ast.Expression[],
            loc: Loc,
        ): Ast.SetLiteral =>
            createNode<Ast.SetLiteral>({
                kind: "set_literal",
                valueType,
                valueStorageType,
                fields,
                loc: toSrcInfo(loc),
            }),
        InitOf: (
            contract: Ast.Id,
            args: Ast.Expression[],
            loc: Loc,
        ): Ast.InitOf =>
            createNode<Ast.InitOf>({
                kind: "init_of",
                contract,
                args,
                loc: toSrcInfo(loc),
            }),
        CodeOf: (contract: Ast.Id, loc: Loc): Ast.CodeOf =>
            createNode<Ast.CodeOf>({
                kind: "code_of",
                contract,
                loc: toSrcInfo(loc),
            }),
        Conditional: (
            condition: Ast.Expression,
            thenBranch: Ast.Expression,
            elseBranch: Ast.Expression,
            loc: Loc,
        ): Ast.Conditional =>
            createNode<Ast.Conditional>({
                kind: "conditional",
                condition,
                thenBranch,
                elseBranch,
                loc: toSrcInfo(loc),
            }),
        Id: (text: string, loc: Loc): Ast.Id =>
            createNode<Ast.Id>({ kind: "id", text, loc: toSrcInfo(loc) }),
        Wildcard: (loc: Loc): Ast.Wildcard =>
            createNode<Ast.Wildcard>({ kind: "wildcard", loc: toSrcInfo(loc) }),
        FuncId: (text: string, loc: Loc): Ast.FuncId =>
            createNode<Ast.FuncId>({
                kind: "func_id",
                text,
                loc: toSrcInfo(loc),
            }),
        Null: (loc: Loc): Ast.Null =>
            createNode<Ast.Null>({ kind: "null", loc: toSrcInfo(loc) }),
        String: (value: string, loc: Loc): Ast.String =>
            createNode<Ast.String>({
                kind: "string",
                value,
                loc: toSrcInfo(loc),
            }),
        Boolean: (value: boolean, loc: Loc): Ast.Boolean =>
            createNode<Ast.Boolean>({
                kind: "boolean",
                value,
                loc: toSrcInfo(loc),
            }),
        Number: (base: Ast.NumberBase, value: bigint, loc: Loc): Ast.Number =>
            createNode<Ast.Number>({
                kind: "number",
                base,
                value,
                loc: toSrcInfo(loc),
            }),
        ContractAttribute: (
            name: Ast.String,
            loc: Loc,
        ): Ast.ContractAttribute =>
            createNode<Ast.ContractAttribute>({
                type: "interface",
                name,
                loc: toSrcInfo(loc),
            }),
        FunctionAttributeGet: (
            methodId: Ast.Expression | undefined,
            loc: Loc,
        ): Ast.FunctionAttributeGet => ({
            kind: "function_attribute",
            type: "get",
            methodId,
            loc: toSrcInfo(loc),
        }),
        FunctionAttribute: (
            type: Ast.FunctionAttributeName,
            loc: Loc,
        ): Ast.FunctionAttributeRest => ({
            kind: "function_attribute",
            type,
            loc: toSrcInfo(loc),
        }),
        ConstantAttribute: (
            type: Ast.ConstantAttributeName,
            loc: Loc,
        ): Ast.ConstantAttribute => ({ type, loc: toSrcInfo(loc) }),
        TypedParameter: (
            name: Ast.OptionalId,
            type: Ast.Type,
            as: Ast.Id | undefined,
            loc: Loc,
        ): Ast.TypedParameter =>
            createNode<Ast.TypedParameter>({
                kind: "typed_parameter",
                name,
                type,
                as,
                loc: toSrcInfo(loc),
            }),
    };
};

/**
 * List of all constructors for AST nodes
 */
export type AstSchema = ReturnType<typeof getAstSchema>;
