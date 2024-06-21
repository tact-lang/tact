import { ABIField, Address, Cell } from "@ton/core";
import {
    ASTConstant,
    ASTFunction,
    ASTInitFunction,
    ASTNativeFunction,
    ASTNode,
    ASTReceive,
    ASTRef,
    ASTStatement,
    ASTType,
} from "../grammar/ast";
// import {
//     Value
// } from "../grammar/value";

export type TypeOrigin = "stdlib" | "user";

export type TypeDescription = {
    kind: "struct" | "primitive" | "contract" | "trait";
    origin: TypeOrigin;
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
    ref: ASTRef;
    ast: ASTNode;
    abi: ABIField;
};

export type ConstantDescription = {
    name: string;
    type: TypeRef;
    value: Value | undefined;
    ref: ASTRef;
    ast: ASTConstant;
};

export type FunctionArgument = {
    name: string;
    type: TypeRef;
    ref: ASTRef;
};

export type InitArgument = {
    name: string;
    type: TypeRef;
    as: string | null;
    ref: ASTRef;
};

export type FunctionDescription = {
    name: string;
    origin: TypeOrigin;
    isGetter: boolean;
    isMutating: boolean;
    isOverrides: boolean;
    isVirtual: boolean;
    isAbstract: boolean;
    isInline: boolean;
    self: string | null;
    returns: TypeRef;
    args: FunctionArgument[];
    ast: ASTFunction | ASTNativeFunction;
};

export type StatementDescription =
    | {
          kind: "native";
          src: ASTStatement;
      }
    | {
          kind: "intrinsic";
      };

export type ReceiverSelector =
    | {
          kind: "internal-binary";
          type: string;
          name: string;
      }
    | {
          kind: "internal-empty";
      }
    | {
          kind: "internal-comment";
          comment: string;
      }
    | {
          kind: "internal-comment-fallback";
          name: string;
      }
    | {
          kind: "internal-fallback";
          name: string;
      }
    | {
          kind: "bounce-fallback";
          name: string;
      }
    | {
          kind: "bounce-binary";
          name: string;
          type: string;
          bounced: boolean;
      }
    | {
          kind: "external-binary";
          type: string;
          name: string;
      }
    | {
          kind: "external-empty";
      }
    | {
          kind: "external-comment";
          comment: string;
      }
    | {
          kind: "external-comment-fallback";
          name: string;
      }
    | {
          kind: "external-fallback";
          name: string;
      };

export type ReceiverDescription = {
    selector: ReceiverSelector;
    ast: ASTReceive;
};

export type InitDescription = {
    args: InitArgument[];
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
