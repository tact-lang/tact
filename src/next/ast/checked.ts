import type { Loc, OptionalId, TypeId } from "@/next/ast/common";
import type { DecodedType, DTypeRef } from "@/next/ast/dtype";
import type { SelfType } from "@/next/ast/mtype";
import type { ViaMember, ViaUser } from "@/next/ast/via";
import type { TactImport } from "@/next/imports/source";

export type SourceCheckResult = {
    // import that lead to reading this file
    readonly importedBy: TactImport;
    // scopes that were computed from this file
    readonly globals: Scope;
}

export type DeclSigs = ReadonlyMap<string, DeclSig>

export type Scope = {
    readonly typeDecls: ReadonlyMap<string, TypeDeclSig>;
    readonly fnSigs: ReadonlyMap<string, FnSig>;
    readonly constSigs: ReadonlyMap<string, ConstSig>;
    readonly extSigs: ReadonlyMap<string, readonly ExtSig[]>;
}

export type TypeDeclSig =
    | BadSig
    | AliasSig
    | ContractSig
    | TraitSig
    | StructSig
    | MessageSig
    | UnionSig

export type DeclSig = {
    readonly use: TypeUse;
    readonly arity: number;
    readonly via: ViaUser;
}
export type TypeUse = "usual" | "alias" | "contract" | "forbidden"

export type ConstSig = {
    readonly type: DecodedType;
    readonly via: ViaUser;
}

export type FnSig = {
    readonly type: DecodedFnType;
    readonly via: ViaUser;
}

export type ExtSig = {
    readonly type: DecodedMethodType;
    readonly via: ViaUser;
}

export type BadSig = {
    readonly kind: 'bad';
    readonly arity: number;
    readonly via: ViaUser;
}

export type AliasSig = {
    readonly kind: 'alias';
    readonly typeParams: TypeParams;
    readonly type: DecodedType;
    readonly via: ViaUser;
}

export type ContractSig = {
    readonly kind: 'contract';
    readonly init: Parameters;
    readonly content: CommonSig;
    readonly via: ViaUser;
}
export type TraitSig = {
    readonly kind: 'trait';
    readonly content: CommonSig;
    readonly via: ViaUser;
}
export type CommonSig = {
    readonly name: TypeId;
    readonly fields: Ordered<InhFieldSig>;
    readonly constants: ReadonlyMap<string, FieldConstSig>;
    readonly methods: ReadonlyMap<string, MethodSig>;
    readonly bounce: BounceSig;
    readonly internal: RecvSig;
    readonly external: RecvSig;
}

export type InhFieldSig = {
    readonly type: DecodedType
    readonly via: ViaMember;
}

export type FieldConstSig = {
    readonly overridable: boolean;
    readonly override: boolean;
    readonly type: DecodedType;
    readonly via: ViaMember;
}

export type MethodSig = {
    readonly overridable: boolean;
    readonly override: boolean;
    readonly type: DecodedFnType;
    readonly via: ViaMember;
}

export type BounceSig = {
    readonly message: ReadonlyMap<string, MessageRecv>;
    readonly messageAny: undefined | MessageAnyRecv;
}

export type RecvSig = {
    readonly message: ReadonlyMap<string, MessageRecv>;
    readonly messageAny: undefined | MessageAnyRecv;
    readonly string: ReadonlyMap<string, StringRecv>;
    readonly stringAny: undefined | StringAnyRecv;
    readonly empty: undefined | EmptyRecv;
}

export type MessageRecv = {
    readonly name: OptionalId;
    readonly type: DTypeRef;
    readonly via: ViaMember;
}
export type MessageAnyRecv = {
    readonly name: OptionalId;
    readonly via: ViaMember;
}
export type StringRecv = {
    readonly comment: string;
    readonly via: ViaMember;
}
export type StringAnyRecv = {
    readonly name: OptionalId;
    readonly via: ViaMember;
}
export type EmptyRecv = {
    readonly via: ViaMember;
}

export type StructSig = {
    readonly kind: "struct";
    readonly typeParams: TypeParams;
    readonly fields: Ordered<FieldSig>;
    readonly via: ViaUser;
}

export type MessageSig = {
    readonly kind: "message";
    readonly typeParams: TypeParams;
    readonly fields: Ordered<FieldSig>;
    readonly via: ViaUser;
}

export type UnionSig = {
    readonly kind: "union";
    readonly typeParams: TypeParams;
    readonly cases: ReadonlyMap<string, ReadonlyMap<string, DecodedType>>;
    readonly via: ViaUser;
}

export type FieldSig = {
    readonly type: DecodedType;
    readonly via: ViaUser;
}

export type DecodedFnType = {
    readonly typeParams: TypeParams;
    readonly params: Parameters;
    readonly returnType: DecodedType,
}

export type DecodedMethodType = {
    readonly typeParams: TypeParams;
    readonly self: SelfType;
    readonly params: Parameters;
    readonly returnType: DecodedType,
}

export type DecodedParameter = {
    readonly name: OptionalId;
    readonly type: DecodedType;
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
    readonly type: DecodedType;
    readonly loc: Loc;
};

export type TypeParams = {
    readonly order: readonly TypeId[];
    readonly set: ReadonlySet<string>;
}


