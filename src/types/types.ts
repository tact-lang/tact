import { ABIField, Address, Cell, Slice } from "@ton/core";
import { throwInternalCompilerError } from "../errors";
import {
    AstConstantDef,
    AstFunctionDef,
    AstContractInit,
    AstNativeFunctionDecl,
    AstReceiver,
    SrcInfo,
    AstTypeDecl,
    AstId,
    AstFunctionDecl,
    AstConstantDecl,
    AstFieldDecl,
    AstAsmFunctionDef,
    AstNumber,
} from "../grammar/ast";
import { dummySrcInfo, ItemOrigin } from "../grammar/grammar";

export type TypeDescription = {
    kind: "struct" | "primitive_type_decl" | "contract" | "trait";
    origin: ItemOrigin;
    name: string;
    uid: number;
    header: AstNumber | null;
    tlb: string | null;
    signature: string | null;
    fields: FieldDescription[];
    partialFieldCount: number; // Max number of fields that can be parsed when message is bounced
    traits: TypeDescription[];
    functions: Map<string, FunctionDescription>;
    receivers: ReceiverDescription[];
    init: InitDescription | null;
    ast: AstTypeDecl;
    dependsOn: TypeDescription[];
    interfaces: string[];
    constants: ConstantDescription[];
};

export type TypeRef =
    | {
          kind: "ref";
          name: string;
          optional: boolean;
      }
    | {
          kind: "map";
          key: string;
          keyAs: string | null;
          value: string;
          valueAs: string | null;
      }
    | {
          kind: "ref_bounced";
          name: string;
      }
    | {
          kind: "void";
      }
    | {
          kind: "null";
      };

// https://github.com/microsoft/TypeScript/issues/35164 and
// https://github.com/microsoft/TypeScript/pull/57293
// eslint-disable-next-line @typescript-eslint/consistent-indexed-object-style
export type StructValue = {
    [key: string]: Value;
};

export class CommentValue {
    constructor(public readonly comment: string) {}
}

export type Value =
    | bigint
    | boolean
    | string
    | Address
    | Cell
    | Slice
    | null
    | CommentValue
    | StructValue;

export function showValue(val: Value): string {
    if (typeof val === "bigint") {
        return val.toString(10);
    } else if (typeof val === "string") {
        return val;
    } else if (typeof val === "boolean") {
        return val ? "true" : "false";
    } else if (Address.isAddress(val)) {
        return val.toRawString();
    } else if (val instanceof Cell || val instanceof Slice) {
        return val.toString();
    } else if (val === null) {
        return "null";
    } else if (val instanceof CommentValue) {
        return val.comment;
    } else if (typeof val === "object" && "$tactStruct" in val) {
        const assocList = Object.entries(val).map(([key, value]) => {
            return `${key}: ${showValue(value)}`;
        });
        return `{${assocList.join(",")}}`;
    } else {
        throwInternalCompilerError("Invalid value", dummySrcInfo);
    }
}

export type FieldDescription = {
    name: string;
    index: number;
    type: TypeRef;
    as: string | null;
    default: Value | undefined;
    loc: SrcInfo;
    ast: AstFieldDecl;
    abi: ABIField;
};

export type ConstantDescription = {
    name: string;
    type: TypeRef;
    value: Value | undefined;
    loc: SrcInfo;
    ast: AstConstantDef | AstConstantDecl;
};

export type FunctionParameter = {
    name: AstId;
    type: TypeRef;
    loc: SrcInfo;
};

export type InitParameter = {
    name: AstId;
    type: TypeRef;
    as: string | null;
    loc: SrcInfo;
};

export type FunctionDescription = {
    name: string;
    origin: ItemOrigin;
    isGetter: boolean;
    isMutating: boolean;
    isOverride: boolean;
    isVirtual: boolean;
    isAbstract: boolean;
    isInline: boolean;
    self: string | null;
    returns: TypeRef;
    params: FunctionParameter[];
    ast:
        | AstFunctionDef
        | AstNativeFunctionDecl
        | AstFunctionDecl
        | AstAsmFunctionDef;
};

export type BinaryReceiverSelector =
    | {
          kind: "internal-binary";
          type: string;
          name: AstId;
      }
    | {
          kind: "bounce-binary";
          name: AstId;
          type: string;
          bounced: boolean;
      }
    | {
          kind: "external-binary";
          type: string;
          name: AstId;
      };

export type CommentReceiverSelector =
    | {
          kind: "internal-comment";
          comment: string;
      }
    | {
          kind: "external-comment";
          comment: string;
      };

type EmptyReceiverSelector =
    | {
          kind: "internal-empty";
      }
    | {
          kind: "external-empty";
      };

type FallbackReceiverSelector =
    | {
          kind: "internal-comment-fallback";
          name: AstId;
      }
    | {
          kind: "internal-fallback";
          name: AstId;
      }
    | {
          kind: "bounce-fallback";
          name: AstId;
      }
    | {
          kind: "external-comment-fallback";
          name: AstId;
      }
    | {
          kind: "external-fallback";
          name: AstId;
      };

export type ReceiverSelector =
    | BinaryReceiverSelector
    | CommentReceiverSelector
    | EmptyReceiverSelector
    | FallbackReceiverSelector;

// TODO: improve this for empty and fallbacks
export function receiverSelectorName(selector: ReceiverSelector): string {
    switch (selector.kind) {
        case "internal-binary":
        case "bounce-binary":
        case "external-binary":
            return selector.type;
        case "internal-comment":
        case "external-comment":
            return selector.comment;
        case "internal-empty":
        case "external-empty":
            return selector.kind;
        case "internal-fallback":
        case "bounce-fallback":
        case "external-fallback":
            return selector.kind;
        case "internal-comment-fallback":
        case "external-comment-fallback":
            return selector.kind;
    }
}

export type ReceiverDescription = {
    selector: ReceiverSelector;
    ast: AstReceiver;
};

export type InitDescription = {
    params: InitParameter[];
    ast: AstContractInit;
};

export function printTypeRef(src: TypeRef): string {
    switch (src.kind) {
        case "ref":
            return `${src.name}${src.optional ? "?" : ""}`;
        case "map":
            return `map<${src.key + (src.keyAs ? " as " + src.keyAs : "")}, ${src.value + (src.valueAs ? " as " + src.valueAs : "")}>`;
        case "void":
            return "<void>";
        case "null":
            return "<null>";
        case "ref_bounced":
            return `bounced<${src.name}>`;
    }
}

export function typeRefEquals(a: TypeRef, b: TypeRef) {
    if (a.kind !== b.kind) {
        return false;
    }
    if (a.kind === "ref" && b.kind === "ref") {
        return a.name === b.name && a.optional === b.optional;
    }
    if (a.kind === "map" && b.kind === "map") {
        return a.key === b.key && a.value === b.value;
    }
    if (a.kind === "ref_bounced" && b.kind === "ref_bounced") {
        return a.name === b.name;
    }
    if (a.kind === "null" && b.kind === "null") {
        return true;
    }
    if (a.kind === "void" && b.kind === "void") {
        return true;
    }
    return false;
}
