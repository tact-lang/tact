import * as A from "./ast";

type Comparator<T> = (left: T, right: T) => boolean;

interface Skhema {
    unknown: () => Comparator<unknown>;
    string: () => Comparator<string>;
    number: () => Comparator<number>;
    bigint: () => Comparator<bigint>;
    boolean: () => Comparator<boolean>;
    literal: <K extends string>(key: K) => Comparator<K>;
    object: <T>(children: {
        [K in keyof T]: Comparator<T[K]>;
    }) => Comparator<T>;
    literalUnion: <const T extends string | number>(keys: T[]) => Comparator<T>;
    array: <T>(child: Comparator<T>) => Comparator<T[]>;
    map: <T>(value: Comparator<T>) => Comparator<Map<string, T>>;
    pair: <T, U>(t: Comparator<T>, u: Comparator<T>) => Comparator<[T, U]>;
    nullable: <T>(child: Comparator<T>) => Comparator<T | null>;
    disjointUnion: <K extends string, T>(
        key: K,
        children: { [K in keyof T]: Comparator<T[K] & Record<K, string>> },
    ) => Comparator<T[keyof T]>;
    lazy: <T>(child: () => Comparator<T>) => Comparator<T>;
}

declare const z: Skhema;

export const srcInfo = z.unknown();

export const astString = z.object({
    kind: z.literal("string"),
    value: z.string(),
    id: z.number(),
    loc: srcInfo,
});

export const astId = z.object({
    kind: z.literal("id"),
    text: z.string(),
    id: z.number(),
    loc: srcInfo,
});

export const astAsmInstruction = z.string();

export const astFuncId = z.object({
    kind: z.literal("func_id"),
    text: z.string(),
    id: z.number(),
    loc: srcInfo,
});

export const astContractAttribute = z.object({
    type: z.literal("interface"),
    name: astString,
    loc: srcInfo,
});

export const astAugmentedAssignOperation = z.literalUnion([
    "+",
    "-",
    "*",
    "/",
    "&&",
    "||",
    "%",
    "|",
    "<<",
    ">>",
    "&",
    "^",
]);

export const astTypeId = z.object({
    kind: z.literal("type_id"),
    text: z.string(),
    id: z.number(),
    loc: srcInfo,
});

export const astMapType = z.object({
    kind: z.literal("map_type"),
    keyType: astTypeId,
    keyStorageType: z.nullable(astId),
    valueType: astTypeId,
    valueStorageType: z.nullable(astId),
    id: z.number(),
    loc: srcInfo,
});

export const astBouncedMessageType = z.object({
    kind: z.literal("bounced_message_type"),
    messageType: astTypeId,
    id: z.number(),
    loc: srcInfo,
});

export const astBoolean = z.object({
    kind: z.literal("boolean"),
    value: z.boolean(),
    id: z.number(),
    loc: srcInfo,
});

export const astNull = z.object({
    kind: z.literal("null"),
    id: z.number(),
    loc: srcInfo,
});

export const astBinaryOperation = z.literalUnion([
    "+",
    "-",
    "*",
    "/",
    "!=",
    ">",
    "<",
    ">=",
    "<=",
    "==",
    "&&",
    "||",
    "%",
    "<<",
    ">>",
    "&",
    "|",
    "^",
]);

export const astUnaryOperation = z.literalUnion(["+", "-", "!", "!!", "~"]);

export const astDestructMapping = z.object({
    kind: z.literal("destruct_mapping"),
    field: astId,
    name: astId,
    id: z.number(),
    loc: srcInfo,
});

export const astDestructEnd = z.object({
    kind: z.literal("destruct_end"),
    ignoreUnspecifiedFields: z.boolean(),
    id: z.number(),
    loc: srcInfo,
});

export const astNumberBase = z.literalUnion([2, 8, 10, 16]);

export const astNumber = z.object({
    kind: z.literal("number"),
    base: astNumberBase,
    value: z.bigint(),
    id: z.number(),
    loc: srcInfo,
});

export const astConstantAttributeName = z.literalUnion([
    "virtual",
    "override",
    "abstract",
]);

export const astConstantAttribute = z.object({
    type: astConstantAttributeName,
    loc: srcInfo,
});

export const astFunctionAttributeName = z.literalUnion([
    "mutates",
    "extends",
    "virtual",
    "abstract",
    "override",
    "inline",
]);

export const astFunctionAttributeRest = z.object({
    kind: z.literal("function_attribute"),
    type: astFunctionAttributeName,
    loc: srcInfo,
});

export const astImport = z.object({
    kind: z.literal("import"),
    path: astString,
    id: z.number(),
    loc: srcInfo,
});

export const astAsmShuffle = z.object({
    args: z.array(astId),
    ret: z.array(astNumber),
});

export const astValue = z.disjointUnion("kind", {
    astNumber,
    astBoolean,
    astNull,
    astString,
});

export const astExpression: Comparator<A.AstExpression> = z.disjointUnion(
    "kind",
    {
        astExpressionPrimary: z.lazy(() => astExpressionPrimary),
        astOpBinary: z.lazy(() => astOpBinary),
        astOpUnary: z.lazy(() => astOpUnary),
        astConditional: z.lazy(() => astConditional),
    },
);

export const astFunctionAttributeGet: Comparator<A.AstFunctionAttributeGet> =
    z.object({
        kind: z.literal("function_attribute"),
        type: z.literal("get"),
        methodId: z.nullable(astExpression),
        loc: srcInfo,
    });

export const astFunctionAttribute: Comparator<A.AstFunctionAttribute> =
    z.disjointUnion("kind", {
        astFunctionAttributeGet,
        astFunctionAttributeRest,
    });

export const astOptionalType: Comparator<A.AstOptionalType> = z.object({
    kind: z.literal("optional_type"),
    typeArg: z.lazy(() => astType),
    id: z.number(),
    loc: srcInfo,
});

export const astType: Comparator<A.AstType> = z.disjointUnion("kind", {
    astTypeId,
    astOptionalType,
    astMapType,
    astBouncedMessageType,
});

export const astTypedParameter: Comparator<A.AstTypedParameter> = z.object({
    kind: z.literal("typed_parameter"),
    name: astId,
    type: astType,
    id: z.number(),
    loc: srcInfo,
});

export const astOpBinary: Comparator<A.AstOpBinary> = z.object({
    kind: z.literal("op_binary"),
    op: astBinaryOperation,
    left: astExpression,
    right: astExpression,
    id: z.number(),
    loc: srcInfo,
});

export const astOpUnary: Comparator<A.AstOpUnary> = z.object({
    kind: z.literal("op_unary"),
    op: astUnaryOperation,
    operand: astExpression,
    id: z.number(),
    loc: srcInfo,
});

export const astConditional: Comparator<A.AstConditional> = z.object({
    kind: z.literal("conditional"),
    condition: astExpression,
    thenBranch: astExpression,
    elseBranch: astExpression,
    id: z.number(),
    loc: srcInfo,
});

export const astMethodCall: Comparator<A.AstMethodCall> = z.object({
    kind: z.literal("method_call"),
    self: astExpression,
    method: astId,
    args: z.array(astExpression),
    id: z.number(),
    loc: srcInfo,
});

export const astFieldAccess: Comparator<A.AstFieldAccess> = z.object({
    kind: z.literal("field_access"),
    aggregate: astExpression,
    field: astId,
    id: z.number(),
    loc: srcInfo,
});

export const astStaticCall: Comparator<A.AstStaticCall> = z.object({
    kind: z.literal("static_call"),
    function: astId,
    args: z.array(astExpression),
    id: z.number(),
    loc: srcInfo,
});

export const astStructFieldInitializer: Comparator<A.AstStructFieldInitializer> =
    z.object({
        kind: z.literal("struct_field_initializer"),
        field: astId,
        initializer: astExpression,
        id: z.number(),
        loc: srcInfo,
    });

export const astStructInstance: Comparator<A.AstStructInstance> = z.object({
    kind: z.literal("struct_instance"),
    type: astId,
    args: z.array(astStructFieldInitializer),
    id: z.number(),
    loc: srcInfo,
});

export const astInitOf: Comparator<A.AstInitOf> = z.object({
    kind: z.literal("init_of"),
    contract: astId,
    args: z.array(astExpression),
    id: z.number(),
    loc: srcInfo,
});

export const astExpressionPrimary: Comparator<A.AstExpressionPrimary> =
    z.disjointUnion("kind", {
        astMethodCall,
        astFieldAccess,
        astStaticCall,
        astStructInstance,
        astNumber,
        astBoolean,
        astId,
        astNull,
        astInitOf,
        astString,
    });

export const astReceiverKind: Comparator<A.AstReceiverKind> = z.disjointUnion(
    "kind",
    {
        "internal-simple": z.object({
            kind: z.literal("internal-simple"),
            param: astTypedParameter,
        }),
        "internal-fallback": z.object({
            kind: z.literal("internal-fallback"),
        }),
        "internal-comment": z.object({
            kind: z.literal("internal-comment"),
            comment: astString,
        }),
        bounce: z.object({
            kind: z.literal("bounce"),
            param: astTypedParameter,
        }),
        "external-simple": z.object({
            kind: z.literal("external-simple"),
            param: astTypedParameter,
        }),
        "external-fallback": z.object({
            kind: z.literal("external-fallback"),
        }),
        "external-comment": z.object({
            kind: z.literal("external-comment"),
            comment: astString,
        }),
    },
);

export const astStatement: Comparator<A.AstStatement> = z.disjointUnion(
    "kind",
    {
        astStatementLet: z.lazy(() => astStatementLet),
        astStatementReturn: z.lazy(() => astStatementReturn),
        astStatementExpression: z.lazy(() => astStatementExpression),
        astStatementAssign: z.lazy(() => astStatementAssign),
        astStatementAugmentedAssign: z.lazy(() => astStatementAugmentedAssign),
        astCondition: z.lazy(() => astCondition),
        astStatementWhile: z.lazy(() => astStatementWhile),
        astStatementUntil: z.lazy(() => astStatementUntil),
        astStatementRepeat: z.lazy(() => astStatementRepeat),
        astStatementTry: z.lazy(() => astStatementTry),
        astStatementTryCatch: z.lazy(() => astStatementTryCatch),
        astStatementForEach: z.lazy(() => astStatementForEach),
        astStatementDestruct: z.lazy(() => astStatementDestruct),
    },
);

export const astContractDeclaration: Comparator<A.AstContractDeclaration> =
    z.disjointUnion("kind", {
        astFieldDecl: z.lazy(() => astFieldDecl),
        astFunctionDef: z.lazy(() => astFunctionDef),
        astAsmFunctionDef: z.lazy(() => astAsmFunctionDef),
        astContractInit: z.lazy(() => astContractInit),
        astReceiver: z.lazy(() => astReceiver),
        astConstantDef: z.lazy(() => astConstantDef),
    });

export const astTraitDeclaration: Comparator<A.AstTraitDeclaration> =
    z.disjointUnion("kind", {
        astFieldDecl: z.lazy(() => astFieldDecl),
        astFunctionDef: z.lazy(() => astFunctionDef),
        astAsmFunctionDef: z.lazy(() => astAsmFunctionDef),
        astFunctionDecl: z.lazy(() => astFunctionDecl),
        astReceiver: z.lazy(() => astReceiver),
        astConstantDef: z.lazy(() => astConstantDef),
        astConstantDecl: z.lazy(() => astConstantDecl),
    });

export const astTypeDecl: Comparator<A.AstTypeDecl> = z.disjointUnion("kind", {
    astPrimitiveTypeDecl: z.lazy(() => astPrimitiveTypeDecl),
    astStructDecl: z.lazy(() => astStructDecl),
    astMessageDecl: z.lazy(() => astMessageDecl),
    astContract: z.lazy(() => astContract),
    astTrait: z.lazy(() => astTrait),
});

export const astConstantDecl: Comparator<A.AstConstantDecl> = z.object({
    kind: z.literal("constant_decl"),
    attributes: z.array(astConstantAttribute),
    name: astId,
    type: astType,
    id: z.number(),
    loc: srcInfo,
});

export const astAsmFunctionDef: Comparator<A.AstAsmFunctionDef> = z.object({
    kind: z.literal("asm_function_def"),
    shuffle: astAsmShuffle,
    attributes: z.array(astFunctionAttribute),
    name: astId,
    return: z.nullable(astType),
    params: z.array(astTypedParameter),
    instructions: z.array(astAsmInstruction),
    id: z.number(),
    loc: srcInfo,
});

export const astNativeFunctionDecl: Comparator<A.AstNativeFunctionDecl> =
    z.object({
        kind: z.literal("native_function_decl"),
        attributes: z.array(astFunctionAttribute),
        name: astId,
        nativeName: astFuncId,
        params: z.array(astTypedParameter),
        return: z.nullable(astType),
        id: z.number(),
        loc: srcInfo,
    });

export const astConstantDef: Comparator<A.AstConstantDef> = z.object({
    kind: z.literal("constant_def"),
    attributes: z.array(astConstantAttribute),
    name: astId,
    type: astType,
    initializer: astExpression,
    id: z.number(),
    loc: srcInfo,
});

export const astFieldDecl: Comparator<A.AstFieldDecl> = z.object({
    kind: z.literal("field_decl"),
    name: astId,
    type: astType,
    initializer: z.nullable(astExpression),
    as: z.nullable(astId),
    id: z.number(),
    loc: srcInfo,
});

export const astStatementLet: Comparator<A.AstStatementLet> = z.object({
    kind: z.literal("statement_let"),
    name: astId,
    type: z.nullable(astType),
    expression: astExpression,
    id: z.number(),
    loc: srcInfo,
});

export const astStatementReturn: Comparator<A.AstStatementReturn> = z.object({
    kind: z.literal("statement_return"),
    expression: z.nullable(astExpression),
    id: z.number(),
    loc: srcInfo,
});

export const astStatementExpression: Comparator<A.AstStatementExpression> =
    z.object({
        kind: z.literal("statement_expression"),
        expression: astExpression,
        id: z.number(),
        loc: srcInfo,
    });

export const astStatementAssign: Comparator<A.AstStatementAssign> = z.object({
    kind: z.literal("statement_assign"),
    path: astExpression,
    expression: astExpression,
    id: z.number(),
    loc: srcInfo,
});

export const astStatementAugmentedAssign: Comparator<A.AstStatementAugmentedAssign> =
    z.object({
        kind: z.literal("statement_augmentedassign"),
        op: astAugmentedAssignOperation,
        path: astExpression,
        expression: astExpression,
        id: z.number(),
        loc: srcInfo,
    });

export const astPrimitiveTypeDecl = z.object({
    kind: z.literal("primitive_type_decl"),
    name: astId,
    id: z.number(),
    loc: srcInfo,
});

export const astStructDecl: Comparator<A.AstStructDecl> = z.object({
    kind: z.literal("struct_decl"),
    name: astId,
    fields: z.array(astFieldDecl),
    id: z.number(),
    loc: srcInfo,
});

export const astMessageDecl: Comparator<A.AstMessageDecl> = z.object({
    kind: z.literal("message_decl"),
    name: astId,
    opcode: z.nullable(astExpression),
    fields: z.array(astFieldDecl),
    id: z.number(),
    loc: srcInfo,
});

export const astFunctionDecl: Comparator<A.AstFunctionDecl> = z.object({
    kind: z.literal("function_decl"),
    attributes: z.array(astFunctionAttribute),
    name: astId,
    return: z.nullable(astType),
    params: z.array(astTypedParameter),
    id: z.number(),
    loc: srcInfo,
});

export const astStatementTry = z.object({
    kind: z.literal("statement_try"),
    statements: z.array(astStatement),
    id: z.number(),
    loc: srcInfo,
});

export const astStatementTryCatch = z.object({
    kind: z.literal("statement_try_catch"),
    statements: z.array(astStatement),
    catchName: astId,
    catchStatements: z.array(astStatement),
    id: z.number(),
    loc: srcInfo,
});

export const astFunctionDef: Comparator<A.AstFunctionDef> = z.object({
    kind: z.literal("function_def"),
    attributes: z.array(astFunctionAttribute),
    name: astId,
    return: z.nullable(astType),
    params: z.array(astTypedParameter),
    statements: z.array(astStatement),
    id: z.number(),
    loc: srcInfo,
});

export const astContract: Comparator<A.AstContract> = z.object({
    kind: z.literal("contract"),
    name: astId,
    traits: z.array(astId),
    attributes: z.array(astContractAttribute),
    declarations: z.array(astContractDeclaration),
    id: z.number(),
    loc: srcInfo,
});

export const astTrait: Comparator<A.AstTrait> = z.object({
    kind: z.literal("trait"),
    name: astId,
    traits: z.array(astId),
    attributes: z.array(astContractAttribute),
    declarations: z.array(astTraitDeclaration),
    id: z.number(),
    loc: srcInfo,
});

export const astContractInit: Comparator<A.AstContractInit> = z.object({
    kind: z.literal("contract_init"),
    params: z.array(astTypedParameter),
    statements: z.array(astStatement),
    id: z.number(),
    loc: srcInfo,
});

export const astReceiver: Comparator<A.AstReceiver> = z.object({
    kind: z.literal("receiver"),
    selector: astReceiverKind,
    statements: z.array(astStatement),
    id: z.number(),
    loc: srcInfo,
});

export const astCondition: Comparator<A.AstCondition> = z.object({
    kind: z.literal("statement_condition"),
    condition: astExpression,
    trueStatements: z.array(astStatement),
    falseStatements: z.nullable(z.array(astStatement)),
    elseif: z.nullable(z.lazy(() => astCondition)),
    id: z.number(),
    loc: srcInfo,
});

export const astStatementWhile: Comparator<A.AstStatementWhile> = z.object({
    kind: z.literal("statement_while"),
    condition: astExpression,
    statements: z.array(astStatement),
    id: z.number(),
    loc: srcInfo,
});

export const astStatementUntil: Comparator<A.AstStatementUntil> = z.object({
    kind: z.literal("statement_until"),
    condition: astExpression,
    statements: z.array(astStatement),
    id: z.number(),
    loc: srcInfo,
});

export const astStatementRepeat: Comparator<A.AstStatementRepeat> = z.object({
    kind: z.literal("statement_repeat"),
    iterations: astExpression,
    statements: z.array(astStatement),
    id: z.number(),
    loc: srcInfo,
});

export const astStatementForEach: Comparator<A.AstStatementForEach> = z.object({
    kind: z.literal("statement_foreach"),
    keyName: astId,
    valueName: astId,
    map: astExpression,
    statements: z.array(astStatement),
    id: z.number(),
    loc: srcInfo,
});

export const astStatementDestruct = z.object({
    kind: z.literal("statement_destruct"),
    type: astTypeId,
    identifiers: z.map(z.pair(astId, astId)),
    ignoreUnspecifiedFields: z.boolean(),
    expression: astExpression,
    id: z.number(),
    loc: srcInfo,
});

export const astModuleItem: Comparator<A.AstModuleItem> = z.disjointUnion(
    "kind",
    {
        astPrimitiveTypeDecl,
        astFunctionDef,
        astAsmFunctionDef,
        astNativeFunctionDecl,
        astConstantDef,
        astStructDecl,
        astMessageDecl,
        astContract,
        astTrait,
    },
);

export const astModule: Comparator<A.AstModule> = z.object({
    kind: z.literal("module"),
    imports: z.array(astImport),
    items: z.array(astModuleItem),
    id: z.number(),
});