import type { DecodedStatement } from "@/next/ast/checked-stmt";
import type { FuncId, Loc, OptionalId, TypeId } from "@/next/ast/common";
import type { CType, CTRef, CTBounced } from "@/next/ast/checked-type";
import type { Effects } from "@/next/ast/effects";
import type { Thunk } from "@/next/ast/lazy";
import type { SelfType } from "@/next/ast/type-self";
import type {
    AsmInstruction,
    AsmShuffle,
    ContractAttribute,
} from "@/next/ast/root";
import type { Value } from "@/next/ast/value";
import type { ViaMember, ViaUser } from "@/next/ast/via";
import type { TactImport } from "@/next/imports/source";

export type SourceCheckResult = {
    // import that lead to reading this file
    readonly importedBy: TactImport;
    // scopes that were computed from this file
    readonly globals: CSource;
};

export type CSource = {
    readonly typeDecls: ReadonlyMap<string, Decl<CTypeDecl>>;
    readonly functions: ReadonlyMap<string, Decl<CFunction>>;
    readonly constants: ReadonlyMap<string, Decl<CConstant>>;
    readonly extensions: ReadonlyMap<string, Thunk<readonly Decl<CExtension>[]>>;
};

export type Decl<T> = {
    readonly decl: T;
    readonly via: ViaUser;
};

export type Recover<T> = T | undefined;

export type CTypeDecl =
    | CAlias
    | CContract
    | CTraitSig
    | CStruct
    | CMessage
    | CUnion;

export type CTypeDeclRefable =
    | CContract
    | CTraitSig
    | CStruct
    | CMessage
    | CUnion;

export type CConstant = {
    readonly initializer: Thunk<Recover<Value>>;
    readonly type: Thunk<CType>;
};

export type CFunction = {
    readonly type: CTypeFunction;
    readonly inline: boolean;
    readonly body: CBody;
};

export type CStatements = Thunk<Recover<CStatementsAux>>;

export type CStatementsAux = {
    readonly body: readonly DecodedStatement[];
    readonly effects: Effects;
};

export type CBody = CTactBody | CFuncBody | CFiftBody;

export type CTactBody = {
    readonly kind: "tact";
    readonly statements: CStatements;
};
export type CFuncBody = {
    readonly kind: "func";
    readonly nativeName: FuncId;
};
export type CFiftBody = {
    readonly kind: "fift";
    readonly shuffle: Thunk<Recover<AsmShuffle>>;
    readonly instructions: readonly AsmInstruction[];
};

export type CExtension = {
    readonly type: CTypeMethod;
    readonly inline: boolean;
    readonly body: CBody;
};

export type CAlias = {
    readonly kind: "alias";
    readonly typeParams: CTypeParams;
    readonly type: Thunk<CType>;
};

export type CInitSig = CInitEmpty | CInitSimple | CInitFn;
export type CInitEmpty = {
    readonly kind: "empty";
    // initOf() would take 0 parameters
    // values to fill all the fields
    readonly fill: Thunk<Recover<Ordered<Thunk<Recover<Value>>>>>;
};
export type CInitSimple = {
    readonly kind: "simple";
    // initOf() takes these parameters and
    // sets them into correspondingly named fields
    readonly fill: Ordered<CInitParam>;
    readonly loc: Loc;
};
export type CInitFn = {
    readonly kind: "function";
    // here we just specify the function
    readonly params: CParameters;
    readonly statements: CStatements;
};
export type CInitParam = {
    readonly type: Thunk<CType>;
    readonly init: undefined | Thunk<Recover<Value>>;
    readonly loc: Loc;
};

export type CContract = {
    readonly kind: "contract";
    readonly attributes: readonly ContractAttribute[];
    readonly init: CInitSig;
    readonly content: Thunk<CContractMembers>;
};
export type CContractMembers = CMembers<Thunk<Recover<Value>>, CBody>;
export type CTraitSig = {
    readonly kind: "trait";
    readonly content: Thunk<CTraitMembers>;
};
export type CTraitMembers = CMembers<
    Thunk<Recover<Value>> | undefined,
    CBody | undefined
>;
export type CMembers<Expr, Body> = {
    readonly fieldish: Ordered<DeclMem<CFieldish<Expr>>>;
    readonly methods: ReadonlyMap<string, DeclMem<CMethod<Body>>>;
    readonly receivers: CReceivers;
};
export type CReceivers = {
    readonly bounce: CBounce;
    readonly internal: CReceiver;
    readonly external: CReceiver;
};

export type CFieldish<Expr> = CField | CFieldConstant<Expr>;
export type CField = {
    readonly kind: "field";
    readonly type: Thunk<CType>;
    readonly init: Thunk<Recover<Value>> | undefined;
};
export type CFieldConstant<Expr> = {
    readonly kind: "constant";
    readonly overridable: boolean;
    readonly type: Thunk<CType>;
    readonly init: Expr;
};

export type CMethod<Body> = {
    readonly overridable: boolean;
    readonly type: CTypeMethod;
    readonly inline: boolean;
    readonly body: Body;
    readonly getMethodId: Thunk<Recover<bigint>> | undefined;
};

export type CBounce = {
    // NB! can't compute opcodes until all receivers are present
    readonly message: readonly DeclMem<CReceiverMessage>[];
    readonly messageAny: undefined | DeclMem<CReceiverMessageAny>;
};

export type CReceiver = {
    // NB! can't compute opcodes until all receivers are present
    readonly message: readonly DeclMem<CReceiverOpcode>[];
    readonly messageAny: undefined | DeclMem<CReceiverMessageAny>;
    readonly stringAny: undefined | DeclMem<CReceiverStringAny>;
    readonly empty: undefined | DeclMem<CReceiverEmpty>;
};

export type CReceiverOpcode = CReceiverMessage | CReceiverString;
export type CReceiverMessage = {
    readonly kind: "binary";
    readonly name: OptionalId;
    readonly type: CTRef | CTBounced;
    readonly statements: CStatements;
};
export type CReceiverMessageAny = {
    readonly name: OptionalId;
    readonly statements: CStatements;
};
export type CReceiverString = {
    readonly kind: "string";
    readonly comment: string;
    readonly statements: CStatements;
};
export type CReceiverStringAny = {
    readonly name: OptionalId;
    readonly statements: CStatements;
};
export type CReceiverEmpty = {
    readonly statements: CStatements;
};

export type DeclMem<T> = {
    readonly decl: T;
    readonly via: ViaMember;
};

export type CStruct = {
    readonly kind: "struct";
    readonly typeParams: CTypeParams;
    readonly fields: Ordered<CField>;
};

export type CMessage = {
    readonly kind: "message";
    readonly opcode: Thunk<Recover<bigint>>;
    readonly fields: Ordered<CField>;
};

export type CUnion = {
    readonly kind: "union";
    readonly typeParams: CTypeParams;
    readonly cases: ReadonlyMap<string, ReadonlyMap<string, CField>>;
};

export type CTypeFunction = {
    readonly kind: "DecodedFnType";
    readonly typeParams: CTypeParams;
    readonly params: CParameters;
    readonly returnType: Thunk<CType>;
};

export type CTypeMethod = {
    readonly kind: "DecodedMethodType";
    readonly mutates: boolean;
    readonly typeParams: CTypeParams;
    readonly self: SelfType;
    readonly params: CParameters;
    readonly returnType: Thunk<CType>;
};

export type CParameter = {
    readonly name: OptionalId;
    readonly type: Thunk<CType>;
    readonly loc: Loc;
};

export type Ordered<T> = {
    readonly order: readonly string[];
    readonly map: ReadonlyMap<string, T>;
};

export type CParameters = {
    readonly order: readonly CParameter[];
    readonly set: ReadonlySet<string>;
};

export type CTypeParams = {
    readonly order: readonly TypeId[];
    readonly set: ReadonlySet<string>;
};
