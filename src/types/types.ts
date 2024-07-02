import { ABIField, Address, Cell } from "@ton/core";
import {
    AstConstantDef,
    AstFunctionDef,
    ASTInitFunction,
    AstNativeFunctionDecl,
    ASTNode,
    AstReceiver,
    SrcInfo,
    ASTStatement,
    ASTType,
    AstId,
    AstFunctionDecl,
    AstConstantDecl,
} from "../grammar/ast";
import { ItemOrigin } from "../grammar/grammar";
// import {
//     Value
// } from "../grammar/value";

export type TypeDescription = {
    kind: "struct" | "primitive_type_decl" | "contract" | "trait";
    origin: ItemOrigin;
    name: string;
    uid: number;
    header: number | null;
    tlb: string | null;
    signature: string | null;
    fields: FieldDescription[];
    partialFieldCount: number; // Max number of fields that can be parsed when message is bounced
    traits: TypeDescription[];
    functions: Map<string, FunctionDescription>;
    receivers: ReceiverDescription[];
    init: InitDescription | null;
    ast: ASTType;
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
    | null
    | CommentValue
    | StructValue;

export type FieldDescription = {
    name: string;
    index: number;
    type: TypeRef;
    as: string | null;
    default: Value | undefined;
    loc: SrcInfo;
    ast: ASTNode;
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
    isOverrides: boolean;
    isVirtual: boolean;
    isAbstract: boolean;
    isInline: boolean;
    self: string | null;
    returns: TypeRef;
    params: FunctionParameter[];
    ast: AstFunctionDef | AstNativeFunctionDecl | AstFunctionDecl;
};

export type StatementDescription =
    | {
          kind: "native";
          src: ASTStatement;
      }
    | {
          kind: "intrinsic";
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

export type EmptyReceiverSelector =
    | {
          kind: "internal-empty";
      }
    | {
          kind: "external-empty";
      };

export type FallbackReceiverSelector =
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
    ast: ASTInitFunction;
};

export function printTypeRef(src: TypeRef): string {
    if (src.kind === "ref") {
        return src.name + (src.optional ? "?" : "");
    } else if (src.kind === "map") {
        return `map<${src.key + (src.keyAs ? " as " + src.keyAs : "")}, ${src.value + (src.valueAs ? " as " + src.valueAs : "")}>`;
    } else if (src.kind === "void") {
        return "<void>";
    } else if (src.kind === "null") {
        return "<null>";
    } else if (src.kind === "ref_bounced") {
        return `bounced<${src.name}>`;
    } else {
        throw Error("Invalid type ref");
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
