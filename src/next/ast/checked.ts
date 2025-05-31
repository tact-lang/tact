import type { DecodedStatement } from "@/next/ast/checked-stmt";
import type { FuncId, Loc, OptionalId, TypeId } from "@/next/ast/common";
import type { DecodedType, DTypeRef, DTypeBounced } from "@/next/ast/dtype";
import type { Lazy } from "@/next/ast/lazy";
import type { SelfType } from "@/next/ast/mtype";
import type { AsmInstruction, AsmShuffle, ContractAttribute } from "@/next/ast/root";
import type { Value } from "@/next/ast/value";
import type { ViaMember, ViaUser } from "@/next/ast/via";
import type { TactImport } from "@/next/imports/source";

export type SourceCheckResult = {
    // import that lead to reading this file
    readonly importedBy: TactImport;
    // scopes that were computed from this file
    readonly globals: Scope;
}

export type Scope = {
    readonly typeDecls: ReadonlyMap<string, Decl<TypeDeclSig>>;
    readonly functions: ReadonlyMap<string, Decl<FnSig>>;
    readonly constants: ReadonlyMap<string, Decl<ConstSig>>;
    readonly extensions: ReadonlyMap<string, Lazy<readonly Decl<ExtSig>[]>>;
}

export type Decl<T> = {
    readonly decl: T;
    readonly via: ViaUser;
}

export type TypeDeclSig =
    | AliasSig
    | ContractSig
    | TraitSig
    | StructSig
    | MessageSig
    | UnionSig

export type TypeDeclRefable =
    | ContractSig
    | TraitSig
    | StructSig
    | MessageSig
    | UnionSig

export type ConstSig = {
    readonly initializer: Lazy<Value>;
    readonly type: Lazy<DecodedType>;
}

export type FnSig = {
    readonly type: DecodedFnType;
    readonly inline: boolean;
    readonly body: Body;
}

export type Body = TactBody | FuncBody | FiftBody

export type TactBody = {
    readonly kind: "tact";
    readonly statements: readonly DecodedStatement[];
};
export type FuncBody = {
    readonly kind: "func";
    readonly nativeName: FuncId;
};
export type FiftBody = {
    readonly kind: "fift";
    readonly shuffle: Lazy<AsmShuffle>;
    readonly instructions: readonly AsmInstruction[];
};

export type ExtSig = {
    readonly type: DecodedMethodType;
    readonly inline: boolean;
    readonly body: Body;
}

export type AliasSig = {
    readonly kind: 'alias';
    readonly typeParams: TypeParams;
    readonly type: Lazy<DecodedType>;
}

export type InitSig =
    | InitEmpty
    | InitSimple
    | InitFn
export type InitEmpty = {
    readonly kind: 'empty';
    // initOf() would take 0 parameters
    // values to fill all the fields
    readonly fill: Lazy<Ordered<Lazy<Value>>>;
}
export type InitSimple = {
    readonly kind: 'simple';
    // initOf() takes these parameters and
    // sets them into correspondingly named fields
    readonly fill: Ordered<InitParam>;
    readonly loc: Loc;
}
export type InitFn = {
    readonly kind: 'function';
    // here we just specify the function
    readonly params: Parameters;
    readonly statements: readonly DecodedStatement[];
}
export type InitParam = {
    readonly type: Lazy<DecodedType>;
    readonly init: undefined | Lazy<Value>;
    readonly loc: Loc;
}

export type ContractSig = {
    readonly kind: 'contract';
    readonly attributes: readonly ContractAttribute[];
    readonly init: InitSig;
    readonly content: Lazy<ContractContent>;
}
export type ContractContent = CommonSig<
    Lazy<Value>,
    Body
>
export type TraitSig = {
    readonly kind: 'trait';
    readonly content: Lazy<TraitContent>;
}
export type TraitContent = CommonSig<
    Lazy<Value> | undefined,
    Body | undefined
>
export type CommonSig<Expr, Body> = {
    readonly fieldish: Ordered<DeclMem<Fieldish<Expr>>>;
    readonly methods: ReadonlyMap<string, DeclMem<MethodSig<Body>>>;
    readonly receivers: Receivers;
}
export type Receivers = {
    readonly bounce: BounceSig;
    readonly internal: RecvSig;
    readonly external: RecvSig;
}

export type Fieldish<Expr> = InhFieldSig | FieldConstSig<Expr>;
export type InhFieldSig = {
    readonly kind: 'field';
    readonly type: Lazy<DecodedType>
    readonly init: Lazy<Value> | undefined;
}
export type FieldConstSig<Expr> = {
    readonly kind: 'constant';
    readonly overridable: boolean;
    readonly type: Lazy<DecodedType>;
    readonly init: Expr;
}

export type MethodSig<Body> = {
    readonly overridable: boolean;
    readonly type: DecodedMethodType;
    readonly inline: boolean;
    readonly body: Body;
    readonly getMethodId: Lazy<bigint> | undefined;
}

export type BounceSig = {
    // NB! can't compute opcodes until all receivers are present
    readonly message: readonly DeclMem<MessageRecv>[];
    readonly messageAny: undefined | DeclMem<MessageAnyRecv>;
}

export type RecvSig = {
    // NB! can't compute opcodes until all receivers are present
    readonly message: readonly DeclMem<OpcodeRecv>[];
    readonly messageAny: undefined | DeclMem<MessageAnyRecv>;
    readonly stringAny: undefined | DeclMem<StringAnyRecv>;
    readonly empty: undefined | DeclMem<EmptyRecv>;
}

export type OpcodeRecv = MessageRecv | StringRecv;
export type MessageRecv = {
    readonly kind: "binary";
    readonly name: OptionalId;
    readonly type: DTypeRef | DTypeBounced;
    readonly statements: readonly DecodedStatement[];
}
export type MessageAnyRecv = {
    readonly name: OptionalId;
    readonly statements: readonly DecodedStatement[];
}
export type StringRecv = {
    readonly kind: "string";
    readonly comment: string;
    readonly statements: readonly DecodedStatement[];
}
export type StringAnyRecv = {
    readonly name: OptionalId;
    readonly statements: readonly DecodedStatement[];
}
export type EmptyRecv = {
    readonly statements: readonly DecodedStatement[];
}

export type DeclMem<T> = {
    readonly decl: T;
    readonly via: ViaMember;
}

export type StructSig = {
    readonly kind: "struct";
    readonly typeParams: TypeParams;
    readonly fields: Ordered<InhFieldSig>;
}

export type MessageSig = {
    readonly kind: "message";
    readonly opcode: Lazy<bigint>;
    readonly fields: Ordered<InhFieldSig>;
}

export type UnionSig = {
    readonly kind: "union";
    readonly typeParams: TypeParams;
    readonly cases: ReadonlyMap<string, ReadonlyMap<string, InhFieldSig>>;
}

export type DecodedFnType = {
    readonly kind: "DecodedFnType";
    readonly typeParams: TypeParams;
    readonly params: Parameters;
    readonly returnType: Lazy<DecodedType>,
}

export type DecodedMethodType = {
    readonly kind: "DecodedMethodType";
    readonly mutates: boolean;
    readonly typeParams: TypeParams;
    readonly self: SelfType;
    readonly params: Parameters;
    readonly returnType: Lazy<DecodedType>,
}

export type DecodedParameter = {
    readonly name: OptionalId;
    readonly type: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type Ordered<T> = {
    readonly order: readonly string[];
    readonly map: ReadonlyMap<string, T>;
}

export type Parameters = {
    readonly order: readonly Parameter[];
    readonly set: ReadonlySet<string>;
}

export type Parameter = {
    readonly name: OptionalId;
    readonly type: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type TypeParams = {
    readonly order: readonly TypeId[];
    readonly set: ReadonlySet<string>;
}
