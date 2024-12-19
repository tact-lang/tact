/**
 * AST node constructors are not just constructors: they also generate ids
 * We have this file so that the "current id" state would not be stored globally
 */

import * as A from "./ast";
import { SrcInfo } from "./src-info";

export type Location = readonly [from: number, to: number];

export const getAstSchema = (
    factory: A.FactoryAst,
    toSrcInfo: (location: Location) => SrcInfo,
) => {
    const createNode = <T>(src: Omit<T, "id">): T => {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        return factory.createNode(src as any) as T;
    }

    return {
        Module: (imports: A.AstImport[], items: A.AstModuleItem[]): A.AstModule => createNode<A.AstModule>({ kind: "module", imports, items, }),
        Import: (path: A.AstString, loc: Location): A.AstImport => createNode<A.AstImport>({ kind: "import", path, loc: toSrcInfo(loc), }),
        PrimitiveTypeDecl: (name: A.AstId, loc: Location): A.AstPrimitiveTypeDecl => createNode<A.AstPrimitiveTypeDecl>({ kind: "primitive_type_decl", name, loc: toSrcInfo(loc), }),
        FunctionDef: (attributes: A.AstFunctionAttribute[], name: A.AstId, retType: A.AstType | null, params: A.AstTypedParameter[], statements: A.AstStatement[], loc: Location): A.AstFunctionDef => createNode<A.AstFunctionDef>({ kind: "function_def", attributes, name, return: retType, params, statements, loc: toSrcInfo(loc), }),
        AsmFunctionDef: (shuffle: A.AstAsmShuffle, attributes: A.AstFunctionAttribute[], name: A.AstId, retType: A.AstType | null, params: A.AstTypedParameter[], instructions: readonly A.AstAsmInstruction[], loc: Location): A.AstAsmFunctionDef => createNode<A.AstAsmFunctionDef>({ kind: "asm_function_def", shuffle, attributes, name, return: retType, params, instructions, loc: toSrcInfo(loc), }),
        FunctionDecl: (attributes: A.AstFunctionAttribute[], name: A.AstId, retType: A.AstType | null, params: A.AstTypedParameter[], loc: Location): A.AstFunctionDecl => createNode<A.AstFunctionDecl>({ kind: "function_decl", attributes, name, return: retType, params, loc: toSrcInfo(loc), }),
        NativeFunctionDecl: (attributes: A.AstFunctionAttribute[], name: A.AstId, nativeName: A.AstFuncId, params: A.AstTypedParameter[], retType: A.AstType | null, loc: Location): A.AstNativeFunctionDecl => createNode<A.AstNativeFunctionDecl>({ kind: "native_function_decl", attributes, name, nativeName, params, return: retType, loc: toSrcInfo(loc), }),
        ConstantDef: (attributes: A.AstConstantAttribute[], name: A.AstId, type: A.AstType, initializer: A.AstExpression, loc: Location): A.AstConstantDef => createNode<A.AstConstantDef>({ kind: "constant_def", attributes, name, type, initializer, loc: toSrcInfo(loc), }),
        ConstantDecl: (attributes: A.AstConstantAttribute[], name: A.AstId, type: A.AstType, loc: Location): A.AstConstantDecl => createNode<A.AstConstantDecl>({ kind: "constant_decl", attributes, name, type, loc: toSrcInfo(loc), }),
        StructDecl: (name: A.AstId, fields: A.AstFieldDecl[], loc: Location): A.AstStructDecl => createNode<A.AstStructDecl>({ kind: "struct_decl", name, fields, loc: toSrcInfo(loc), }),
        MessageDecl: (name: A.AstId, opcode: A.AstNumber | null, fields: A.AstFieldDecl[], loc: Location): A.AstMessageDecl => createNode<A.AstMessageDecl>({ kind: "message_decl", name, opcode, fields, loc: toSrcInfo(loc), }),
        Contract: (name: A.AstId, traits: A.AstId[], attributes: A.AstContractAttribute[], declarations: A.AstContractDeclaration[], loc: Location): A.AstContract => createNode<A.AstContract>({ kind: "contract", name, traits, attributes, declarations, loc: toSrcInfo(loc), }),
        Trait: (name: A.AstId, traits: A.AstId[], attributes: A.AstContractAttribute[], declarations: A.AstTraitDeclaration[], loc: Location): A.AstTrait => createNode<A.AstTrait>({ kind: "trait", name, traits, attributes, declarations, loc: toSrcInfo(loc), }),
        FieldDecl: (name: A.AstId, type: A.AstType, initializer: A.AstExpression | null, as: A.AstId | null, loc: Location): A.AstFieldDecl => createNode<A.AstFieldDecl>({ kind: "field_decl", name, type, initializer, as, loc: toSrcInfo(loc), }),
        Receiver: (selector: A.AstReceiverKind, statements: A.AstStatement[], loc: Location): A.AstReceiver => createNode<A.AstReceiver>({ kind: "receiver", selector, statements, loc: toSrcInfo(loc), }),
        ContractInit: (params: A.AstTypedParameter[], statements: A.AstStatement[], loc: Location): A.AstContractInit => createNode<A.AstContractInit>({ kind: "contract_init", params, statements, loc: toSrcInfo(loc), }),
        StatementLet: (name: A.AstId, type: A.AstType | null, expression: A.AstExpression, loc: Location): A.AstStatementLet => createNode<A.AstStatementLet>({ kind: "statement_let", name, type, expression, loc: toSrcInfo(loc), }),
        StatementReturn: (expression: A.AstExpression | null, loc: Location): A.AstStatementReturn => createNode<A.AstStatementReturn>({ kind: "statement_return", expression, loc: toSrcInfo(loc), }),
        StatementExpression: (expression: A.AstExpression, loc: Location): A.AstStatementExpression => createNode<A.AstStatementExpression>({ kind: "statement_expression", expression, loc: toSrcInfo(loc), }),
        StatementAssign: (path: A.AstExpression, expression: A.AstExpression, loc: Location): A.AstStatementAssign => createNode<A.AstStatementAssign>({ kind: "statement_assign", path, expression, loc: toSrcInfo(loc), }),
        StatementAugmentedAssign: (op: A.AstAugmentedAssignOperation, path: A.AstExpression, expression: A.AstExpression, loc: Location): A.AstStatementAugmentedAssign => createNode<A.AstStatementAugmentedAssign>({ kind: "statement_augmentedassign", op, path, expression, loc: toSrcInfo(loc), }),
        Condition: (condition: A.AstExpression, trueStatements: A.AstStatement[], falseStatements: A.AstStatement[] | null, elseif: A.AstCondition | null, loc: Location): A.AstCondition => createNode<A.AstCondition>({ kind: "statement_condition", condition, trueStatements, falseStatements, elseif, loc: toSrcInfo(loc), }),
        StatementWhile: (condition: A.AstExpression, statements: A.AstStatement[], loc: Location): A.AstStatementWhile => createNode<A.AstStatementWhile>({ kind: "statement_while", condition, statements, loc: toSrcInfo(loc), }),
        StatementUntil: (condition: A.AstExpression, statements: A.AstStatement[], loc: Location): A.AstStatementUntil => createNode<A.AstStatementUntil>({ kind: "statement_until", condition, statements, loc: toSrcInfo(loc), }),
        StatementRepeat: (iterations: A.AstExpression, statements: A.AstStatement[], loc: Location): A.AstStatementRepeat => createNode<A.AstStatementRepeat>({ kind: "statement_repeat", iterations, statements, loc: toSrcInfo(loc), }),
        StatementTry: (statements: A.AstStatement[], loc: Location): A.AstStatementTry => createNode<A.AstStatementTry>({ kind: "statement_try", statements, loc: toSrcInfo(loc), }),
        StatementTryCatch: (statements: A.AstStatement[], catchName: A.AstId, catchStatements: A.AstStatement[], loc: Location): A.AstStatementTryCatch => createNode<A.AstStatementTryCatch>({ kind: "statement_try_catch", statements, catchName, catchStatements, loc: toSrcInfo(loc), }),
        StatementForEach: (keyName: A.AstId, valueName: A.AstId, map: A.AstExpression, statements: A.AstStatement[], loc: Location): A.AstStatementForEach => createNode<A.AstStatementForEach>({ kind: "statement_foreach", keyName, valueName, map, statements, loc: toSrcInfo(loc), }),
        TypeId: (text: string, loc: Location): A.AstTypeId => createNode<A.AstTypeId>({ kind: "type_id", text, loc: toSrcInfo(loc), }),
        OptionalType: (typeArg: A.AstType, loc: Location): A.AstOptionalType => createNode<A.AstOptionalType>({ kind: "optional_type", typeArg, loc: toSrcInfo(loc), }),
        MapType: (keyType: A.AstTypeId, keyStorageType: A.AstId | null, valueType: A.AstTypeId, valueStorageType: A.AstId | null, loc: Location): A.AstMapType => createNode<A.AstMapType>({ kind: "map_type", keyType, keyStorageType, valueType, valueStorageType, loc: toSrcInfo(loc), }),
        BouncedMessageType: (messageType: A.AstTypeId, loc: Location): A.AstBouncedMessageType => createNode<A.AstBouncedMessageType>({ kind: "bounced_message_type", messageType, loc: toSrcInfo(loc), }),
        OpBinary: (op: A.AstBinaryOperation, left: A.AstExpression, right: A.AstExpression, loc: Location): A.AstOpBinary => createNode<A.AstOpBinary>({ kind: "op_binary", op, left, right, loc: toSrcInfo(loc), }),
        OpUnary: (op: A.AstUnaryOperation, operand: A.AstExpression, loc: Location): A.AstOpUnary => createNode<A.AstOpUnary>({ kind: "op_unary", op, operand, loc: toSrcInfo(loc), }),
        FieldAccess: (aggregate: A.AstExpression, field: A.AstId, loc: Location): A.AstFieldAccess => createNode<A.AstFieldAccess>({ kind: "field_access", aggregate, field, loc: toSrcInfo(loc), }),
        MethodCall: (self: A.AstExpression, method: A.AstId, args: A.AstExpression[], loc: Location): A.AstMethodCall => createNode<A.AstMethodCall>({ kind: "method_call", self, method, args, loc: toSrcInfo(loc), }),
        StaticCall: (funcId: A.AstId, args: A.AstExpression[], loc: Location): A.AstStaticCall => createNode<A.AstStaticCall>({ kind: "static_call", function: funcId, args, loc: toSrcInfo(loc), }),
        StructInstance: (type: A.AstId, args: A.AstStructFieldInitializer[], loc: Location): A.AstStructInstance => createNode<A.AstStructInstance>({ kind: "struct_instance", type, args, loc: toSrcInfo(loc), }),
        StructFieldInitializer: (field: A.AstId, initializer: A.AstExpression, loc: Location): A.AstStructFieldInitializer => createNode<A.AstStructFieldInitializer>({ kind: "struct_field_initializer", field, initializer, loc: toSrcInfo(loc), }),
        InitOf: (contract: A.AstId, args: A.AstExpression[], loc: Location): A.AstInitOf => createNode<A.AstInitOf>({ kind: "init_of", contract, args, loc: toSrcInfo(loc), }),
        Conditional: (condition: A.AstExpression, thenBranch: A.AstExpression, elseBranch: A.AstExpression, loc: Location): A.AstConditional => createNode<A.AstConditional>({ kind: "conditional", condition, thenBranch, elseBranch, loc: toSrcInfo(loc), }),
        Id: (text: string, loc: Location): A.AstId => createNode<A.AstId>({ kind: "id", text, loc: toSrcInfo(loc), }),
        FuncId: (text: string, loc: Location): A.AstFuncId => createNode<A.AstFuncId>({ kind: "func_id", text, loc: toSrcInfo(loc), }),
        Null: (loc: Location): A.AstNull => createNode<A.AstNull>({ kind: "null", loc: toSrcInfo(loc), }),
        String: (value: string, loc: Location): A.AstString => createNode<A.AstString>({ kind: "string", value, loc: toSrcInfo(loc), }),
        Boolean: (value: boolean, loc: Location): A.AstBoolean => createNode<A.AstBoolean>({ kind: "boolean", value, loc: toSrcInfo(loc), }),
        Number: (base: A.AstNumberBase, value: bigint, loc: Location): A.AstNumber => createNode<A.AstNumber>({ kind: "number", base, value, loc: toSrcInfo(loc), }),
        ContractAttribute: (name: A.AstString, loc: Location): A.AstContractAttribute => createNode<A.AstContractAttribute>({ type: "interface", name, loc: toSrcInfo(loc), }),
        FunctionAttributeGet: (methodId: A.AstExpression | null, loc: Location): A.AstFunctionAttributeGet => ({ kind: 'function_attribute', type: 'get', methodId, loc: toSrcInfo(loc), }),
        FunctionAttribute: (type: A.AstFunctionAttributeName, loc: Location): A.AstFunctionAttributeRest => ({ kind: 'function_attribute', type, loc: toSrcInfo(loc), }),
        ConstantAttribute: (type: A.AstConstantAttributeName, loc: Location): A.AstConstantAttribute => ({ type, loc: toSrcInfo(loc), }),
        TypedParameter: (name: A.AstId, type: A.AstType, loc: Location): A.AstTypedParameter => createNode<A.AstTypedParameter>({ kind: "typed_parameter", name, type, loc: toSrcInfo(loc), }),
    };
};

/**
 * List of all constructors for AST nodes
 */
export type AstSchema = ReturnType<typeof getAstSchema>;