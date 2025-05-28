import type { DecodedExpression } from "@/next/ast/checked-expr";
import type { DecodedStatement } from "@/next/ast/checked-stmt";
import type { FuncId, Loc, OptionalId, TypeId } from "@/next/ast/common";
import type { DecodedType, DTypeRef } from "@/next/ast/dtype";
import type { Lazy } from "@/next/ast/lazy";
import type { SelfType } from "@/next/ast/mtype";
import type { AsmInstruction, AsmShuffle, ContractAttribute } from "@/next/ast/root";
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

export type ConstSig = {
    readonly initializer: Lazy<DecodedExpression>;
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

export type ContractSig = {
    readonly kind: 'contract';
    readonly attributes: readonly ContractAttribute[];
    readonly params: Parameters;
    readonly content: Lazy<ContractContent>;
}
export type ContractContent = CommonSig<
    Lazy<DecodedExpression>,
    Body
>
export type TraitSig = {
    readonly kind: 'trait';
    readonly content: Lazy<TraitContent>;
}
export type TraitContent = CommonSig<
    Lazy<DecodedExpression> | undefined,
    Body | undefined
>
export type CommonSig<Expr, Body> = {
    readonly fieldish: Ordered<DeclMem<Fieldish<Expr>>>;
    readonly methods: ReadonlyMap<string, DeclMem<MethodSig<Body>>>;
    readonly bounce: BounceSig;
    readonly internal: RecvSig;
    readonly external: RecvSig;
}

export type Fieldish<Expr> = InhFieldSig<Expr> | FieldConstSig<Expr>;
export type InhFieldSig<Expr> = {
    readonly kind: 'field';
    readonly type: Lazy<DecodedType>
    readonly init: Expr;
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
    readonly message: ReadonlyMap<string, DeclMem<MessageRecv>>;
    readonly messageAny: undefined | DeclMem<MessageAnyRecv>;
}

export type RecvSig = {
    readonly message: ReadonlyMap<string, DeclMem<MessageRecv>>;
    readonly messageAny: undefined | DeclMem<MessageAnyRecv>;
    readonly string: ReadonlyMap<string, DeclMem<StringRecv>>;
    readonly stringAny: undefined | DeclMem<StringAnyRecv>;
    readonly empty: undefined | DeclMem<EmptyRecv>;
}

export type MessageRecv = {
    readonly name: OptionalId;
    readonly type: DTypeRef;
}
export type MessageAnyRecv = {
    readonly name: OptionalId;
}
export type StringRecv = {
    readonly comment: string;
}
export type StringAnyRecv = {
    readonly name: OptionalId;
}
export type EmptyRecv = {
    readonly one: 1;
}

export type DeclMem<T> = {
    readonly decl: T;
    readonly via: ViaMember;
}

export type StructSig = {
    readonly kind: "struct";
    readonly typeParams: TypeParams;
    readonly fields: Ordered<FieldSig>;
}

export type MessageSig = {
    readonly kind: "message";
    readonly fields: Ordered<FieldSig>;
}

export type UnionSig = {
    readonly kind: "union";
    readonly typeParams: TypeParams;
    readonly cases: ReadonlyMap<string, ReadonlyMap<string, Lazy<DecodedType>>>;
}

export type FieldSig = {
    readonly type: Lazy<DecodedType>;
    readonly via: ViaUser;
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
