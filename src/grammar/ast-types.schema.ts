/* eslint-disable @typescript-eslint/no-explicit-any */
import { entries } from "../utils/tricks";
import * as A from "./ast";
import { SrcInfo } from "./src-info";

type Matcher<U> = {
    fail: U;
    path: (part: string, child: () => U) => U;
    eps: U;
    eq: <T>(left: T, right: T) => U;
    short: (children: U[]) => U;
    every: (children: U[]) => U;
}

type Err = { path: string, left: unknown, right: unknown }
type ErrMatcher = (path: string[]) => [boolean, Err[]];

const getMatcher = (): Matcher<ErrMatcher> => ({
    fail: path => [false, [{ path: path.join(''), left: undefined, right: undefined }]],
    path: (part, child) => path => child()([...path, part]),
    eps: () => [true, []],
    eq: (l, r) => path => {
        // console.log(path.join(''), l, r);
        const res = l === r || l === 'type_id' && r === 'id';
        return [
            res,
            res ? [] : [{ path: path.join(''), left: l, right: r }],
        ];
    },
    short: children => path => {
        const results: Err[] = [];
        const status = children.every(child => {
            const [r, errors] = child(path);
            results.push(...errors);
            return r;
        });
        return [status, results];
    },
    every: children => path => {
        const res = children.map(child => child(path));
        return [
            res.every(([res]) => res),
            res.flatMap(([, errors]) => errors),
        ];
    },
});

type Type<U, T> = {
    eq: (left: T, right: T) => U;
}

interface Schema {
    unknown: Comparator<unknown>;
    string: Comparator<string>;
    number: Comparator<number>;
    bigint: Comparator<bigint>;
    boolean: Comparator<boolean>;
    literal: <K extends string>(key: K) => Comparator<K>;
    object: <T>(children: {
        [K in keyof T]: Comparator<T[K]>;
    }) => Comparator<T>;
    literalUnion: <const T extends string | number>(keys: T[]) => Comparator<T>;
    array: <T>(child: Comparator<T>) => Comparator<T[]>;
    map: <T>(value: Comparator<T>) => Comparator<Map<string, T>>;
    pair: <T, V>(t: Comparator<T>, u: Comparator<V>) => Comparator<[T, V]>;
    nullable: <T>(child: Comparator<T>) => Comparator<T | null>;
    disjointUnion: <K extends string, T>(
        key: K,
        children: {
            [L in keyof T]: Comparator<
                T[L] extends Record<K, L>
                    ? T[L]
                    : T[L] extends Record<K, infer V>
                        ? Record<K, V>
                        : unknown
            >
        }
    ) => Comparator<T[keyof T]>;
    lazy: <T>(child: () => Comparator<T>) => Comparator<T>;
}

const getSchema = ({ fail, path, eps, eq, short, every }: Matcher<ErrMatcher>): Schema => {
    const simpleType = <T>(): Comparator<T> => ({
        eq,
    });

    const string = simpleType<string>();
    const number = simpleType<number>();

    return {
        unknown: {
            eq: () => eps,
        },
        string,
        number,
        bigint: simpleType<bigint>(),
        boolean: simpleType<boolean>(),
        literal: () => string,
        literalUnion: () => ({
            eq,
        }),
        object: children => ({
            eq: (a, b) =>
                typeof a !== 'object' || a === null ||
                typeof b !== 'object' || b === null
                ? fail
                : every(entries(children).map(
                    ([k, child]) => path(`.${k as any}`, () =>
                        k in (a as any) && k in (b as any)
                            ? child.eq(a[k], b[k])
                            : fail)
                )),
        }),
        array: child => ({
            eq: (as, bs) => short([
                path('.length', () => number.eq(as.length, bs.length)),
                every([...as.entries()].map(([i, a]) => (
                    path(`[${i}]`, () => {
                        return bs[i] ? child.eq(a, bs[i]) : fail;
                    })
                )))
            ]),
        }),
        map: child => ({
            eq: (as, bs) => short([
                path('.size', () => eq(as.size, bs.size)),
                every([...as.entries()].map(([k, a]) => (
                    path(`.get("${k}")`, () => {
                        const b = bs.get(k);
                        return b ? child.eq(a, b) : fail;
                    })
                )))
            ])
        }),
        pair: (left, right) => ({
            eq: ([al, ar], [bl, br]) => every([
                path('[0]', () => left.eq(al, bl)),
                path('[1]', () => right.eq(ar, br))
            ]),
        }),
        nullable: child => ({
            eq: (a, b) =>
                a === null && b === null
                    ? eq(a, b)
                    : a !== null && b !== null
                        ? child.eq(a, b)
                        : fail
        }),
        disjointUnion: (key, children) => ({
            eq: (a, b) => short([
                eq((a as any)[key], (b as any)[key]),
                (children as any)[(a as any)[key]].eq(a as any, b as any),
            ]),
        }),
        lazy: <T>(child: () => Comparator<T>) => {
            let cache: Comparator<T> | undefined;
            const getChild = () => cache ?? (cache = child());
            return {
                eq: (a: T, b: T) => getChild().eq(a, b),
            };
        },
    };
};

const z = getSchema(getMatcher());
type Comparator<T> = Type<ErrMatcher, T>

export const srcInfo: Comparator<SrcInfo> = z.unknown;

export const id = z.unknown;

export const astString = z.object({
    kind: z.literal("string"),
    value: z.string,
    id,
    loc: srcInfo,
});

export const astId = z.object({
    kind: z.literal("id"),
    text: z.string,
    id,
    loc: srcInfo,
});

export const astAsmInstruction = z.string;

export const astFuncId = z.object({
    kind: z.literal("func_id"),
    text: z.string,
    id,
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
    text: z.string,
    id,
    loc: srcInfo,
});

export const astMapType = z.object({
    kind: z.literal("map_type"),
    keyType: astTypeId,
    keyStorageType: z.nullable(astId),
    valueType: astTypeId,
    valueStorageType: z.nullable(astId),
    id,
    loc: srcInfo,
});

export const astBouncedMessageType = z.object({
    kind: z.literal("bounced_message_type"),
    messageType: astTypeId,
    id,
    loc: srcInfo,
});

export const astBoolean = z.object({
    kind: z.literal("boolean"),
    value: z.boolean,
    id,
    loc: srcInfo,
});

export const astNull = z.object({
    kind: z.literal("null"),
    id,
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
    id,
    loc: srcInfo,
});

export const astDestructEnd = z.object({
    kind: z.literal("destruct_end"),
    ignoreUnspecifiedFields: z.boolean,
    id,
    loc: srcInfo,
});

export const astNumberBase = z.literalUnion([2, 8, 10, 16]);

export const astNumber = z.object({
    kind: z.literal("number"),
    base: astNumberBase,
    value: z.bigint,
    id,
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

export const astImport = z.object({
    kind: z.literal("import"),
    path: astString,
    id,
    loc: srcInfo,
});

export const astAsmShuffle = z.object({
    args: z.array(astId),
    ret: z.array(astNumber),
});

export const astValue = z.disjointUnion("kind", {
    number: astNumber,
    boolean: astBoolean,
    null: astNull,
    string: astString,
});

export const astExpression: Comparator<A.AstExpression> = z.disjointUnion(
    "kind",
    {
        method_call: z.lazy(() => astMethodCall),
        field_access: z.lazy(() => astFieldAccess),
        static_call: z.lazy(() => astStaticCall),
        struct_instance: z.lazy(() => astStructInstance),
        number: z.lazy(() => astNumber),
        boolean: z.lazy(() => astBoolean),
        id: z.lazy(() => astId),
        null: z.lazy(() => astNull),
        init_of: z.lazy(() => astInitOf),
        string: z.lazy(() => astString),
        op_binary: z.lazy(() => astOpBinary),
        op_unary: z.lazy(() => astOpUnary),
        conditional: z.lazy(() => astConditional),
    },
);

export const astFunctionAttributeGet: Comparator<A.AstFunctionAttributeGet> =
    z.object({
        kind: z.literal("function_attribute"),
        type: z.literal("get"),
        methodId: z.nullable(astExpression),
        loc: srcInfo,
    });

export const astFunctionAttributeMutates = z.object({
    kind: z.literal("function_attribute"),
    type: z.literal("mutates"),
    loc: srcInfo,
});
export const astFunctionAttributeExtends = z.object({
    kind: z.literal("function_attribute"),
    type: z.literal("extends"),
    loc: srcInfo,
});
export const astFunctionAttributeVirtual = z.object({
    kind: z.literal("function_attribute"),
    type: z.literal("virtual"),
    loc: srcInfo,
});
export const astFunctionAttributeAbstract = z.object({
    kind: z.literal("function_attribute"),
    type: z.literal("abstract"),
    loc: srcInfo,
});
export const astFunctionAttributeOverride = z.object({
    kind: z.literal("function_attribute"),
    type: z.literal("override"),
    loc: srcInfo,
});
export const astFunctionAttributeInline = z.object({
    kind: z.literal("function_attribute"),
    type: z.literal("inline"),
    loc: srcInfo,
});

export const astFunctionAttribute: Comparator<A.AstFunctionAttribute> =
    z.disjointUnion("kind", {
        function_attribute: z.disjointUnion("type", {
            get: astFunctionAttributeGet,
            mutates: astFunctionAttributeMutates,
            extends: astFunctionAttributeExtends,
            virtual: astFunctionAttributeVirtual,
            abstract: astFunctionAttributeAbstract,
            override: astFunctionAttributeOverride,
            inline: astFunctionAttributeInline,
        })
    });

export const astOptionalType: Comparator<A.AstOptionalType> = z.object({
    kind: z.literal("optional_type"),
    typeArg: z.lazy(() => astType),
    id,
    loc: srcInfo,
});

export const astType: Comparator<A.AstType> = z.disjointUnion("kind", {
    type_id: astTypeId,
    optional_type: astOptionalType,
    map_type: astMapType,
    bounced_message_type: astBouncedMessageType,
});

export const astTypedParameter: Comparator<A.AstTypedParameter> = z.object({
    kind: z.literal("typed_parameter"),
    name: astId,
    type: astType,
    id,
    loc: srcInfo,
});

export const astOpBinary: Comparator<A.AstOpBinary> = z.object({
    kind: z.literal("op_binary"),
    op: astBinaryOperation,
    left: astExpression,
    right: astExpression,
    id,
    loc: srcInfo,
});

export const astOpUnary: Comparator<A.AstOpUnary> = z.object({
    kind: z.literal("op_unary"),
    op: astUnaryOperation,
    operand: astExpression,
    id,
    loc: srcInfo,
});

export const astConditional: Comparator<A.AstConditional> = z.object({
    kind: z.literal("conditional"),
    condition: astExpression,
    thenBranch: astExpression,
    elseBranch: astExpression,
    id,
    loc: srcInfo,
});

export const astMethodCall: Comparator<A.AstMethodCall> = z.object({
    kind: z.literal("method_call"),
    self: astExpression,
    method: astId,
    args: z.array(astExpression),
    id,
    loc: srcInfo,
});

export const astFieldAccess: Comparator<A.AstFieldAccess> = z.object({
    kind: z.literal("field_access"),
    aggregate: astExpression,
    field: astId,
    id,
    loc: srcInfo,
});

export const astStaticCall: Comparator<A.AstStaticCall> = z.object({
    kind: z.literal("static_call"),
    function: astId,
    args: z.array(astExpression),
    id,
    loc: srcInfo,
});

export const astStructFieldInitializer: Comparator<A.AstStructFieldInitializer> =
    z.object({
        kind: z.literal("struct_field_initializer"),
        field: astId,
        initializer: astExpression,
        id,
        loc: srcInfo,
    });

export const astStructInstance: Comparator<A.AstStructInstance> = z.object({
    kind: z.literal("struct_instance"),
    type: astId,
    args: z.array(astStructFieldInitializer),
    id,
    loc: srcInfo,
});

export const astInitOf: Comparator<A.AstInitOf> = z.object({
    kind: z.literal("init_of"),
    contract: astId,
    args: z.array(astExpression),
    id,
    loc: srcInfo,
});

export const astExpressionPrimary: Comparator<A.AstExpressionPrimary> =
    z.disjointUnion("kind", {
        method_call: astMethodCall,
        field_access: astFieldAccess,
        static_call: astStaticCall,
        struct_instance: astStructInstance,
        number: astNumber,
        boolean: astBoolean,
        id: astId,
        null: astNull,
        init_of: astInitOf,
        string: astString,
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
        statement_let: z.lazy(() => astStatementLet),
        statement_return: z.lazy(() => astStatementReturn),
        statement_expression: z.lazy(() => astStatementExpression),
        statement_assign: z.lazy(() => astStatementAssign),
        statement_augmentedassign: z.lazy(() => astStatementAugmentedAssign),
        statement_condition: z.lazy(() => astCondition),
        statement_while: z.lazy(() => astStatementWhile),
        statement_until: z.lazy(() => astStatementUntil),
        statement_repeat: z.lazy(() => astStatementRepeat),
        statement_try: z.lazy(() => astStatementTry),
        statement_try_catch: z.lazy(() => astStatementTryCatch),
        statement_foreach: z.lazy(() => astStatementForEach),
        statement_destruct: z.lazy(() => astStatementDestruct),
    },
);

export const astContractDeclaration: Comparator<A.AstContractDeclaration> =
    z.disjointUnion("kind", {
        field_decl: z.lazy(() => astFieldDecl),
        function_def: z.lazy(() => astFunctionDef),
        asm_function_def: z.lazy(() => astAsmFunctionDef),
        contract_init: z.lazy(() => astContractInit),
        receiver: z.lazy(() => astReceiver),
        constant_def: z.lazy(() => astConstantDef),
    });

export const astTraitDeclaration: Comparator<A.AstTraitDeclaration> =
    z.disjointUnion("kind", {
        field_decl: z.lazy(() => astFieldDecl),
        function_def: z.lazy(() => astFunctionDef),
        asm_function_def: z.lazy(() => astAsmFunctionDef),
        function_decl: z.lazy(() => astFunctionDecl),
        receiver: z.lazy(() => astReceiver),
        constant_def: z.lazy(() => astConstantDef),
        constant_decl: z.lazy(() => astConstantDecl),
    });

export const astTypeDecl: Comparator<A.AstTypeDecl> = z.disjointUnion("kind", {
    primitive_type_decl: z.lazy(() => astPrimitiveTypeDecl),
    struct_decl: z.lazy(() => astStructDecl),
    message_decl: z.lazy(() => astMessageDecl),
    contract: z.lazy(() => astContract),
    trait: z.lazy(() => astTrait),
});

export const astConstantDecl: Comparator<A.AstConstantDecl> = z.object({
    kind: z.literal("constant_decl"),
    attributes: z.array(astConstantAttribute),
    name: astId,
    type: astType,
    id,
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
    id,
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
        id,
        loc: srcInfo,
    });

export const astConstantDef: Comparator<A.AstConstantDef> = z.object({
    kind: z.literal("constant_def"),
    attributes: z.array(astConstantAttribute),
    name: astId,
    type: astType,
    initializer: astExpression,
    id,
    loc: srcInfo,
});

export const astFieldDecl: Comparator<A.AstFieldDecl> = z.object({
    kind: z.literal("field_decl"),
    name: astId,
    type: astType,
    initializer: z.nullable(astExpression),
    as: z.nullable(astId),
    id,
    loc: srcInfo,
});

export const astStatementLet: Comparator<A.AstStatementLet> = z.object({
    kind: z.literal("statement_let"),
    name: astId,
    type: z.nullable(astType),
    expression: astExpression,
    id,
    loc: srcInfo,
});

export const astStatementReturn: Comparator<A.AstStatementReturn> = z.object({
    kind: z.literal("statement_return"),
    expression: z.nullable(astExpression),
    id,
    loc: srcInfo,
});

export const astStatementExpression: Comparator<A.AstStatementExpression> =
    z.object({
        kind: z.literal("statement_expression"),
        expression: astExpression,
        id,
        loc: srcInfo,
    });

export const astStatementAssign: Comparator<A.AstStatementAssign> = z.object({
    kind: z.literal("statement_assign"),
    path: astExpression,
    expression: astExpression,
    id,
    loc: srcInfo,
});

export const astStatementAugmentedAssign: Comparator<A.AstStatementAugmentedAssign> =
    z.object({
        kind: z.literal("statement_augmentedassign"),
        op: astAugmentedAssignOperation,
        path: astExpression,
        expression: astExpression,
        id,
        loc: srcInfo,
    });

export const astPrimitiveTypeDecl = z.object({
    kind: z.literal("primitive_type_decl"),
    name: astId,
    id,
    loc: srcInfo,
});

export const astStructDecl: Comparator<A.AstStructDecl> = z.object({
    kind: z.literal("struct_decl"),
    name: astId,
    fields: z.array(astFieldDecl),
    id,
    loc: srcInfo,
});

export const astMessageDecl: Comparator<A.AstMessageDecl> = z.object({
    kind: z.literal("message_decl"),
    name: astId,
    opcode: z.nullable(astExpression),
    fields: z.array(astFieldDecl),
    id,
    loc: srcInfo,
});

export const astFunctionDecl: Comparator<A.AstFunctionDecl> = z.object({
    kind: z.literal("function_decl"),
    attributes: z.array(astFunctionAttribute),
    name: astId,
    return: z.nullable(astType),
    params: z.array(astTypedParameter),
    id,
    loc: srcInfo,
});

export const astStatementTry = z.object({
    kind: z.literal("statement_try"),
    statements: z.array(astStatement),
    id,
    loc: srcInfo,
});

export const astStatementTryCatch = z.object({
    kind: z.literal("statement_try_catch"),
    statements: z.array(astStatement),
    catchName: astId,
    catchStatements: z.array(astStatement),
    id,
    loc: srcInfo,
});

export const astFunctionDef: Comparator<A.AstFunctionDef> = z.object({
    kind: z.literal("function_def"),
    attributes: z.array(astFunctionAttribute),
    name: astId,
    return: z.nullable(astType),
    params: z.array(astTypedParameter),
    statements: z.array(astStatement),
    id,
    loc: srcInfo,
});

export const astContract: Comparator<A.AstContract> = z.object({
    kind: z.literal("contract"),
    name: astId,
    traits: z.array(astId),
    attributes: z.array(astContractAttribute),
    declarations: z.array(astContractDeclaration),
    id,
    loc: srcInfo,
});

export const astTrait: Comparator<A.AstTrait> = z.object({
    kind: z.literal("trait"),
    name: astId,
    traits: z.array(astId),
    attributes: z.array(astContractAttribute),
    declarations: z.array(astTraitDeclaration),
    id,
    loc: srcInfo,
});

export const astContractInit: Comparator<A.AstContractInit> = z.object({
    kind: z.literal("contract_init"),
    params: z.array(astTypedParameter),
    statements: z.array(astStatement),
    id,
    loc: srcInfo,
});

export const astReceiver: Comparator<A.AstReceiver> = z.object({
    kind: z.literal("receiver"),
    selector: astReceiverKind,
    statements: z.array(astStatement),
    id,
    loc: srcInfo,
});

export const astCondition: Comparator<A.AstCondition> = z.object({
    kind: z.literal("statement_condition"),
    condition: astExpression,
    trueStatements: z.array(astStatement),
    falseStatements: z.nullable(z.array(astStatement)),
    elseif: z.nullable(z.lazy(() => astCondition)),
    id,
    loc: srcInfo,
});

export const astStatementWhile: Comparator<A.AstStatementWhile> = z.object({
    kind: z.literal("statement_while"),
    condition: astExpression,
    statements: z.array(astStatement),
    id,
    loc: srcInfo,
});

export const astStatementUntil: Comparator<A.AstStatementUntil> = z.object({
    kind: z.literal("statement_until"),
    condition: astExpression,
    statements: z.array(astStatement),
    id,
    loc: srcInfo,
});

export const astStatementRepeat: Comparator<A.AstStatementRepeat> = z.object({
    kind: z.literal("statement_repeat"),
    iterations: astExpression,
    statements: z.array(astStatement),
    id,
    loc: srcInfo,
});

export const astStatementForEach: Comparator<A.AstStatementForEach> = z.object({
    kind: z.literal("statement_foreach"),
    keyName: astId,
    valueName: astId,
    map: astExpression,
    statements: z.array(astStatement),
    id,
    loc: srcInfo,
});

export const astStatementDestruct = z.object({
    kind: z.literal("statement_destruct"),
    type: astTypeId,
    identifiers: z.map(z.pair(astId, astId)),
    ignoreUnspecifiedFields: z.boolean,
    expression: astExpression,
    id,
    loc: srcInfo,
});

export const astModuleItem: Comparator<A.AstModuleItem> = z.disjointUnion(
    "kind",
    {
        primitive_type_decl: astPrimitiveTypeDecl,
        function_def: astFunctionDef,
        asm_function_def: astAsmFunctionDef,
        native_function_decl: astNativeFunctionDecl,
        constant_def: astConstantDef,
        struct_decl: astStructDecl,
        message_decl: astMessageDecl,
        contract: astContract,
        trait: astTrait,
    },
);

export const astModule: Comparator<A.AstModule> = z.object({
    kind: z.literal("module"),
    imports: z.array(astImport),
    items: z.array(astModuleItem),
    id,
});
