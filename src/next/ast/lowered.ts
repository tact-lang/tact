import type { Effects } from "@/next/ast/effects";
import type { LStmt } from "@/next/ast/lowered-stmt";
import type { FuncId, Loc, OptionalId, Ordered, TypeId } from "@/next/ast/common";
import type { LType, LTRef, LTBounced } from "@/next/ast/lowered-type";
import type { SelfType } from "@/next/ast/type-self";
import type {
    AsmInstruction,
    AsmShuffle,
    ContractAttribute,
} from "@/next/ast/root";
import type { Value } from "@/next/ast/value";

export type LSource = {
    readonly typeDecls: ReadonlyMap<string, LTypeDecl>;
    readonly functions: ReadonlyMap<string, LFunction>;
    readonly constants: ReadonlyMap<string, LConstant>;
    readonly extensions: ReadonlyMap<string, readonly LExtension[]>;
};

export type LTypeDecl =
    | LAlias
    | LContract
    | LTrait
    | LStruct
    | LMessage
    | LUnion;

export type LTypeDeclRefable =
    | LContract
    | LStruct
    | LMessage
    | LUnion;

export type LConstant = {
    readonly initializer: Value;
    readonly type: LType;
};

export type LFunction = {
    readonly type: LTFunction;
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

export type LExtension = {
    readonly type: LTMethod;
    readonly inline: boolean;
    readonly body: LBody;
};

export type LAlias = {
    readonly kind: "alias";
    readonly typeParams: LTypeParams;
    readonly type: LType;
};

export type LInit = LInitEmpty | LInitSimple | LInitFn;
export type LInitEmpty = {
    readonly kind: "empty";
    // initOf() would take 0 parameters
    // values to fill all the fields
    readonly fill: Ordered<Value>;
};
export type LInitSimple = {
    readonly kind: "simple";
    // initOf() takes these parameters and
    // sets them into correspondingly named fields
    readonly fill: Ordered<LInitParam>;
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

export type LContract = {
    readonly kind: "contract";
    readonly attributes: readonly ContractAttribute[];
    readonly init: LInit;
    readonly content: LContractMembers;
};
export type LContractMembers = LMembers<Value, LBody>;
export type LTrait = {
    readonly kind: "trait";
    readonly content: LTraitMembers;
};
export type LTraitMembers = LMembers<Value | undefined, LBody | undefined>;
export type LMembers<Expr, Body> = {
    readonly fieldish: Ordered<LFieldish<Expr>>;
    readonly methods: ReadonlyMap<string, LMethod<Body>>;
    readonly receivers: LReceivers;
};
export type LReceivers = {
    readonly bounce: LBounce;
    readonly internal: LReceiver;
    readonly external: LReceiver;
};

export type LFieldish<Expr> = LField | LFieldConstant<Expr>;
export type LField = {
    readonly kind: "field";
    readonly type: LType;
    readonly init: Value | undefined;
};
export type LFieldConstant<Expr> = {
    readonly kind: "constant";
    readonly type: LType;
    readonly init: Expr;
};

export type LMethod<Body> = {
    readonly type: LTMethod;
    readonly inline: boolean;
    readonly body: Body;
    readonly getMethodId: bigint | undefined;
};

export type LBounce = {
    // NB! can't compute opcodes until all receivers are present
    readonly message: readonly LReceiverMessage[];
    readonly messageAny: undefined | LReceiverAny;
};

export type LReceiver = {
    // NB! can't compute opcodes until all receivers are present
    readonly message: readonly LReceiverOpcode[];
    readonly messageAny: undefined | LReceiverAny;
    readonly stringAny: undefined | LReceiverAny;
    readonly empty: undefined | LReceiverEmpty;
};

export type LReceiverOpcode = LReceiverMessage | LReceiverString;
export type LReceiverMessage = {
    readonly kind: "binary";
    readonly name: OptionalId;
    readonly type: LTRef | LTBounced;
    readonly statements: LStatements;
};
export type LReceiverAny = {
    readonly name: OptionalId;
    readonly statements: LStatements;
};
export type LReceiverString = {
    readonly kind: "string";
    readonly comment: string;
    readonly statements: LStatements;
};
export type LReceiverEmpty = {
    readonly statements: LStatements;
};

export type LStruct = {
    readonly kind: "struct";
    readonly typeParams: LTypeParams;
    readonly fields: Ordered<LField>;
};

export type LMessage = {
    readonly kind: "message";
    readonly opcode: bigint;
    readonly fields: Ordered<LField>;
};

export type LUnion = {
    readonly kind: "union";
    readonly typeParams: LTypeParams;
    readonly cases: ReadonlyMap<string, ReadonlyMap<string, LField>>;
};

export type LTFunction = {
    readonly kind: "DecodedFnType";
    readonly typeParams: LTypeParams;
    readonly params: LParameters;
    readonly returnType: LType;
};

export type LTMethod = {
    readonly kind: "DecodedMethodType";
    readonly mutates: boolean;
    readonly typeParams: LTypeParams;
    readonly self: SelfType;
    readonly params: LParameters;
    readonly returnType: LType;
};

export type LParameter = {
    readonly name: OptionalId;
    readonly type: LType;
    readonly loc: Loc;
};

export type LParameters = {
    readonly order: readonly LParameter[];
    readonly set: ReadonlySet<string>;
};

export type LTypeParams = {
    readonly order: readonly TypeId[];
    readonly set: ReadonlySet<string>;
};
