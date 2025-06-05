import type { Effects } from "@/next/ast/effects";
import type { LStmt } from "@/next/ast/lowered-stmt";
import type { FuncId, Loc, OptionalId, TypeId } from "@/next/ast/common";
import type { LType, LTypeRef, LTypeBounced } from "@/next/ast/lowered-type";
import type { SelfType } from "@/next/ast/type-self";
import type {
    AsmInstruction,
    AsmShuffle,
    ContractAttribute,
} from "@/next/ast/root";
import type { Value } from "@/next/ast/value";

export type LSource = {
    readonly typeDecls: ReadonlyMap<string, LTypeDeclSig>;
    readonly functions: ReadonlyMap<string, LFnSig>;
    readonly constants: ReadonlyMap<string, LConstSig>;
    readonly extensions: ReadonlyMap<string, readonly LExtSig[]>;
};

export type LTypeDeclSig =
    | LAliasSig
    | LContractSig
    | LTraitSig
    | LStructSig
    | LMessageSig
    | LUnionSig;

export type LConstSig = {
    readonly initializer: Value;
    readonly type: LType;
};

export type LFnSig = {
    readonly type: LDecodedFnType;
    readonly inline: boolean;
    readonly body: LBody;
};

export type LStatements = {
    readonly body: readonly LStmt[];
    readonly effects: Effects;
};

export type LBody = LTactBody | LFuncBody | LFiftBody;

export type LTactBody = {
    readonly kind: "tact";
    readonly statements: LStatements;
};
export type LFuncBody = {
    readonly kind: "func";
    readonly nativeName: FuncId;
};
export type LFiftBody = {
    readonly kind: "fift";
    readonly shuffle: AsmShuffle;
    readonly instructions: readonly AsmInstruction[];
};

export type LExtSig = {
    readonly type: LDecodedMethodType;
    readonly inline: boolean;
    readonly body: LBody;
};

export type LAliasSig = {
    readonly kind: "alias";
    readonly typeParams: LTypeParams;
    readonly type: LType;
};

export type LInitSig = LInitEmpty | LInitSimple | LInitFn;
export type LInitEmpty = {
    readonly kind: "empty";
    // initOf() would take 0 parameters
    // values to fill all the fields
    readonly fill: LOrdered<Value>;
};
export type LInitSimple = {
    readonly kind: "simple";
    // initOf() takes these parameters and
    // sets them into correspondingly named fields
    readonly fill: LOrdered<LInitParam>;
    readonly loc: Loc;
};
export type LInitFn = {
    readonly kind: "function";
    // here we just specify the function
    readonly params: LParameters;
    readonly statements: LStatements;
};
export type LInitParam = {
    readonly type: LType;
    readonly init: undefined | Value;
    readonly loc: Loc;
};

export type LContractSig = {
    readonly kind: "contract";
    readonly attributes: readonly ContractAttribute[];
    readonly init: LInitSig;
    readonly content: LContractContent;
};
export type LContractContent = LCommonSig<Value, LBody>;
export type LTraitSig = {
    readonly kind: "trait";
    readonly content: LTraitContent;
};
export type LTraitContent = LCommonSig<Value | undefined, LBody | undefined>;
export type LCommonSig<Expr, Body> = {
    readonly fieldish: LOrdered<LFieldish<Expr>>;
    readonly methods: ReadonlyMap<string, LMethodSig<Body>>;
    readonly receivers: LReceivers;
};
export type LReceivers = {
    readonly bounce: LBounceSig;
    readonly internal: LRecvSig;
    readonly external: LRecvSig;
};

export type LFieldish<Expr> = LInhFieldSig | LFieldConstSig<Expr>;
export type LInhFieldSig = {
    readonly kind: "field";
    readonly type: LType;
    readonly init: Value | undefined;
};
export type LFieldConstSig<Expr> = {
    readonly kind: "constant";
    readonly overridable: boolean;
    readonly type: LType;
    readonly init: Expr;
};

export type LMethodSig<Body> = {
    readonly overridable: boolean;
    readonly type: LDecodedMethodType;
    readonly inline: boolean;
    readonly body: Body;
    readonly getMethodId: bigint | undefined;
};

export type LBounceSig = {
    // NB! can't compute opcodes until all receivers are present
    readonly message: readonly LMessageRecv[];
    readonly messageAny: undefined | LMessageAnyRecv;
};

export type LRecvSig = {
    // NB! can't compute opcodes until all receivers are present
    readonly message: readonly LOpcodeRecv[];
    readonly messageAny: undefined | LMessageAnyRecv;
    readonly stringAny: undefined | LStringAnyRecv;
    readonly empty: undefined | LEmptyRecv;
};

export type LOpcodeRecv = LMessageRecv | LStringRecv;
export type LMessageRecv = {
    readonly kind: "binary";
    readonly name: OptionalId;
    readonly type: LTypeRef | LTypeBounced;
    readonly statements: LStatements;
};
export type LMessageAnyRecv = {
    readonly name: OptionalId;
    readonly statements: LStatements;
};
export type LStringRecv = {
    readonly kind: "string";
    readonly comment: string;
    readonly statements: LStatements;
};
export type LStringAnyRecv = {
    readonly name: OptionalId;
    readonly statements: LStatements;
};
export type LEmptyRecv = {
    readonly statements: LStatements;
};

export type LStructSig = {
    readonly kind: "struct";
    readonly typeParams: LTypeParams;
    readonly fields: LOrdered<LInhFieldSig>;
};

export type LMessageSig = {
    readonly kind: "message";
    readonly opcode: bigint;
    readonly fields: LOrdered<LInhFieldSig>;
};

export type LUnionSig = {
    readonly kind: "union";
    readonly typeParams: LTypeParams;
    readonly cases: ReadonlyMap<string, ReadonlyMap<string, LInhFieldSig>>;
};

export type LDecodedFnType = {
    readonly kind: "DecodedFnType";
    readonly typeParams: LTypeParams;
    readonly params: LParameters;
    readonly returnType: LType;
};

export type LDecodedMethodType = {
    readonly kind: "DecodedMethodType";
    readonly mutates: boolean;
    readonly typeParams: LTypeParams;
    readonly self: SelfType;
    readonly params: LParameters;
    readonly returnType: LType;
};

export type LDecodedParameter = {
    readonly name: OptionalId;
    readonly type: LType;
    readonly loc: Loc;
};

export type LOrdered<T> = {
    readonly order: readonly string[];
    readonly map: ReadonlyMap<string, T>;
};

export type LParameters = {
    readonly order: readonly LParameter[];
    readonly set: ReadonlySet<string>;
};

export type LParameter = {
    readonly name: OptionalId;
    readonly type: LType;
    readonly loc: Loc;
};

export type LTypeParams = {
    readonly order: readonly TypeId[];
    readonly set: ReadonlySet<string>;
};
