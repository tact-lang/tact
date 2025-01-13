import { ABIField } from "@ton/core";
import { throwInternalCompilerError } from "../errors";
import {
    AstConstantDef,
    AstFunctionDef,
    AstContractInit,
    AstNativeFunctionDecl,
    AstReceiver,
    AstTypeDecl,
    AstId,
    AstFunctionDecl,
    AstConstantDecl,
    AstFieldDecl,
    AstAsmFunctionDef,
    AstNumber,
    AstLiteral,
    idText,
} from "../grammar/ast";
import { ItemOrigin, SrcInfo } from "../grammar";

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

export function showValue(val: AstLiteral): string {
    switch (val.kind) {
        case "number":
            return val.value.toString(val.base);
        case "simplified_string":
        case "comment_value":
            return val.value;
        case "boolean":
            return val.value ? "true" : "false";
        case "address":
            return val.value.toRawString();
        case "cell":
        case "slice":
            return val.value.toString();
        case "null":
            return "null";
        case "struct_value": {
            const assocList = val.args.map(
                (field) =>
                    `${idText(field.field)}: ${showValue(field.initializer)}`,
            );
            return `{${assocList.join(",")}}`;
        }
        default:
            throwInternalCompilerError("Invalid value");
    }
}

export type FieldDescription = {
    name: string;
    index: number;
    type: TypeRef;
    as: string | null;
    default: AstLiteral | undefined;
    loc: SrcInfo;
    ast: AstFieldDecl;
    abi: ABIField;
};

export type ConstantDescription = {
    name: string;
    type: TypeRef;
    value: AstLiteral | undefined;
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
    methodId: number | null;
    isMutating: boolean;
    isOverride: boolean;
    isVirtual: boolean;
    isAbstract: boolean;
    isInline: boolean;
    self: TypeRef | null;
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
