/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $c from "@/next/ast/common";
import type * as $d from "@/next/ast/checked-type";
import type * as $m from "@/next/ast/type-self";
import type * as $v from "@/next/ast/via";
import type * as $ from "@/next/ast/checked";
import type { TactImport } from "@/next/imports/source";
import type { Thunk } from "@/next/ast/lazy";
import type {
    AsmInstruction,
    AsmShuffle,
    ContractAttribute,
} from "@/next/ast/root";
import type { DecodedStatement } from "@/next/ast/checked-stmt";
import type { Value } from "@/next/ast/value";
import type { Effects } from "@/next/ast/effects";

export type CTypeParams = $.CTypeParams;
export const CTypeParams = (
    order: readonly $c.TypeId[],
    set: ReadonlySet<string>,
): CTypeParams =>
    Object.freeze({
        order,
        set,
    });
export type CAlias = $.CAlias;
export const CAlias = (
    typeParams: $.CTypeParams,
    type_: Thunk<$d.CType>,
): $.CAlias =>
    Object.freeze({
        kind: "alias",
        typeParams,
        type: type_,
    });
export type Ordered<V> = $.Ordered<V>;
export const Ordered = <V>(
    order: readonly string[],
    map: ReadonlyMap<string, V>,
): $.Ordered<V> =>
    Object.freeze({
        order,
        map,
    });

export type CTypeFunction = $.CTypeFunction;
export const CTypeFunction = (
    typeParams: $.CTypeParams,
    params: $.CParameters,
    returnType: Thunk<$d.CType>,
): $.CTypeFunction =>
    Object.freeze({
        kind: "DecodedFnType",
        typeParams,
        params,
        returnType,
    });
export type CBounce = $.CBounce;
export const CBounce = (
    message: readonly DeclMem<CReceiverMessage>[],
    messageAny: DeclMem<$.CReceiverMessageAny> | undefined,
): $.CBounce =>
    Object.freeze({
        message,
        messageAny,
    });

export type CStruct = $.CStruct;
export const CStruct = (
    typeParams: $.CTypeParams,
    fields: $.Ordered<$.CField>,
): $.CStruct =>
    Object.freeze({
        kind: "struct",
        typeParams,
        fields,
    });
export type CUnion = $.CUnion;
export const CUnion = (
    typeParams: $.CTypeParams,
    cases: ReadonlyMap<string, ReadonlyMap<string, CField>>,
): $.CUnion =>
    Object.freeze({
        kind: "union",
        typeParams,
        cases,
    });
export type CTypeDecl = $.CTypeDecl;
export type CConstant = $.CConstant;
export const CConstant = (
    init: Thunk<Value | undefined>,
    type_: Thunk<$d.CType>,
): $.CConstant =>
    Object.freeze({
        initializer: init,
        type: type_,
    });
export type CExtension = $.CExtension;
export const CExtension = (
    type: $.CTypeMethod,
    inline: boolean,
    body: $.CBody,
): $.CExtension =>
    Object.freeze({
        type,
        inline,
        body,
    });
export type CSource = $.CSource;
export type Decl<T> = $.Decl<T>;
export const Decl = <T>(decl: T, via: $v.ViaUser): Decl<T> => ({
    decl,
    via,
});
export const CSource = (
    typeDecls: ReadonlyMap<string, $.Decl<$.CTypeDecl>>,
    fnSigs: ReadonlyMap<string, $.Decl<$.CFunction>>,
    constSigs: ReadonlyMap<string, $.Decl<$.CConstant>>,
    extSigs: ReadonlyMap<string, Thunk<readonly $.Decl<$.CExtension>[]>>,
): $.CSource =>
    Object.freeze({
        typeDecls,
        functions: fnSigs,
        constants: constSigs,
        extensions: extSigs,
    });
export type CTypeMethod = $.CTypeMethod;
export const CTypeMethod = (
    mutates: boolean,
    typeParams: $.CTypeParams,
    self: $m.SelfType,
    params: $.CParameters,
    returnType: Thunk<$d.CType>,
): $.CTypeMethod =>
    Object.freeze({
        kind: "DecodedMethodType",
        mutates,
        typeParams,
        self,
        params,
        returnType,
    });
export type CParameter = $.CParameter;
export const CParameter = (
    name: $c.OptionalId,
    type_: Thunk<$d.CType>,
    loc: $c.Loc,
): $.CParameter =>
    Object.freeze({
        name,
        type: type_,
        loc,
    });
export type SourceCheckResult = $.SourceCheckResult;
export const SourceCheckResult = (
    importedBy: TactImport,
    globals: $.CSource,
): $.SourceCheckResult =>
    Object.freeze({
        importedBy,
        globals,
    });
export type Recover<T> = $.Recover<T>;
export type CParameters = $.CParameters;
export const CParameters = (
    order: readonly $.CParameter[],
    set: ReadonlySet<string>,
): $.CParameters =>
    Object.freeze({
        order,
        set,
    });
export type CTactBody = $.CTactBody;
export const CTactBody = (
    statements: Thunk<CStatementsAux | undefined>,
): $.CTactBody =>
    Object.freeze({
        kind: "tact",
        statements,
    });
export type CFuncBody = $.CFuncBody;
export const CFuncBody = (nativeName: $c.FuncId): $.CFuncBody =>
    Object.freeze({
        kind: "func",
        nativeName,
    });
export type CFiftBody = $.CFiftBody;
export const CFiftBody = (
    shuffle: Thunk<AsmShuffle | undefined>,
    instructions: readonly AsmInstruction[],
): $.CFiftBody =>
    Object.freeze({
        kind: "fift",
        shuffle,
        instructions,
    });
export type CBody = $.CBody;
export type CFunction = $.CFunction;
export const CFunction = (
    type_: $.CTypeFunction,
    inline: boolean,
    body: $.CBody,
): $.CFunction =>
    Object.freeze({
        type: type_,
        inline,
        body,
    });
export type DeclMem<T> = $.DeclMem<T>;
export const DeclMem = <T>(decl: T, via: $v.ViaMember): DeclMem<T> => ({
    decl,
    via,
});
export type CField = $.CField;
export const CField = (
    type_: Thunk<$d.CType>,
    init: Thunk<Value | undefined> | undefined,
): $.CField =>
    Object.freeze({
        kind: "field",
        type: type_,
        init,
    });
export type CFieldConstant<Expr> = $.CFieldConstant<Expr>;
export const CFieldConstant = <Expr>(
    overridable: boolean,
    type_: Thunk<$d.CType>,
    init: Expr,
): $.CFieldConstant<Expr> =>
    Object.freeze({
        kind: "constant",
        overridable,
        type: type_,
        init,
    });
export type CFieldish<Expr> = $.CFieldish<Expr>;
export type CMethod<Body> = $.CMethod<Body>;
export const CMethod = <Body>(
    overridable: boolean,
    type_: $.CTypeMethod,
    inline: boolean,
    body: Body,
    getMethodId: Thunk<undefined | bigint> | undefined,
): $.CMethod<Body> =>
    Object.freeze({
        overridable,
        type: type_,
        inline,
        body,
        getMethodId,
    });
export type CReceivers = $.CReceivers;
export type CMembers<Expr, Body> = $.CMembers<Expr, Body>;
export const CMembers = <Expr, Body>(
    fieldish: $.Ordered<$.DeclMem<$.CFieldish<Expr>>>,
    methods: ReadonlyMap<string, $.DeclMem<$.CMethod<Body>>>,
    receivers: $.CReceivers,
): $.CMembers<Expr, Body> =>
    Object.freeze({
        fieldish,
        methods,
        receivers,
    });
export type CContractMembers = $.CContractMembers;
export type CTraitMembers = $.CTraitMembers;
export type CTraitSig = $.CTraitSig;
export const CTraitSig = (
    content: Thunk<
        $.CMembers<Thunk<Value | undefined> | undefined, $.CBody | undefined>
    >,
): $.CTraitSig =>
    Object.freeze({
        kind: "trait",
        content,
    });
export type CReceiverMessage = $.CReceiverMessage;
export const CReceiverMessage = (
    name: $c.OptionalId,
    type_: $d.CTRef | $d.CTBounced,
    statements: Thunk<undefined | CStatementsAux>,
): $.CReceiverMessage =>
    Object.freeze({
        kind: "binary",
        name,
        type: type_,
        statements,
    });
export type CReceiverMessageAny = $.CReceiverMessageAny;
export const CReceiverMessageAny = (
    name: $c.OptionalId,
    statements: Thunk<undefined | CStatementsAux>,
): $.CReceiverMessageAny =>
    Object.freeze({
        name,
        statements,
    });
export type CReceiverString = $.CReceiverString;
export const CReceiverString = (
    comment: string,
    statements: Thunk<undefined | CStatementsAux>,
): $.CReceiverString =>
    Object.freeze({
        kind: "string",
        comment,
        statements,
    });
export type CReceiverStringAny = $.CReceiverStringAny;
export const CReceiverStringAny = (
    name: $c.OptionalId,
    statements: Thunk<undefined | CStatementsAux>,
): $.CReceiverStringAny =>
    Object.freeze({
        name,
        statements,
    });
export type CReceiverEmpty = $.CReceiverEmpty;
export const CReceiverEmpty = (
    statements: Thunk<undefined | CStatementsAux>,
): $.CReceiverEmpty =>
    Object.freeze({
        statements,
    });
export type CReceiverOpcode = $.CReceiverOpcode;
export type CReceiver = $.CReceiver;
export const CReceiver = (
    message: readonly DeclMem<CReceiverOpcode>[],
    messageAny: $.DeclMem<$.CReceiverMessageAny> | undefined,
    stringAny: $.DeclMem<$.CReceiverStringAny> | undefined,
    empty: $.DeclMem<$.CReceiverEmpty> | undefined,
): $.CReceiver =>
    Object.freeze({
        message,
        messageAny,
        stringAny,
        empty,
    });
export type CMessage = $.CMessage;
export const CMessage = (
    opcode: Thunk<undefined | bigint>,
    fields: $.Ordered<$.CField>,
): $.CMessage =>
    Object.freeze({
        kind: "message",
        opcode,
        fields,
    });
export type CInitEmpty = $.CInitEmpty;
export const CInitEmpty = (
    fill: Thunk<undefined | $.Ordered<Thunk<Value | undefined>>>,
): $.CInitEmpty =>
    Object.freeze({
        kind: "empty",
        fill,
    });
export type CInitParam = $.CInitParam;
export const CInitParam = (
    type_: Thunk<$d.CType>,
    init: Thunk<Value | undefined> | undefined,
    loc: $c.Loc,
): $.CInitParam =>
    Object.freeze({
        type: type_,
        init,
        loc,
    });
export type CInitSimple = $.CInitSimple;
export const CInitSimple = (
    fill: $.Ordered<$.CInitParam>,
    loc: $c.Loc,
): $.CInitSimple =>
    Object.freeze({
        kind: "simple",
        fill,
        loc,
    });
export type CStatementsAux = $.CStatementsAux;
export const CStatementsAux = (
    body: readonly DecodedStatement[],
    effects: Effects,
): $.CStatementsAux =>
    Object.freeze({
        body,
        effects,
    });
export type CInitFn = $.CInitFn;
export const CInitFn = (
    params: $.CParameters,
    statements: Thunk<undefined | CStatementsAux>,
): $.CInitFn =>
    Object.freeze({
        kind: "function",
        params,
        statements,
    });
export type CStatements = $.CStatements;
export type CInitSig = $.CInitSig;
export type CContract = $.CContract;
export type CTypeDeclRefable = $.CTypeDeclRefable;
export const CContract = (
    attributes: readonly ContractAttribute[],
    init: $.CInitSig,
    content: Thunk<$.CContractMembers>,
): $.CContract =>
    Object.freeze({
        kind: "contract",
        attributes,
        init,
        content,
    });
