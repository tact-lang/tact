import * as changeCase from "change-case";
import { ABIField } from "@ton/core";
import { CompilerContext } from "../context";
import { idToHex } from "../utils/idToHex";
import { newMessageId } from "../utils/newMessageId";
import { getAllTypes, getType } from "./resolveDescriptors";

export function resolveSignatures(ctx: CompilerContext) {
    const types = getAllTypes(ctx);
    const signatures = new Map<
        string,
        { signature: string; tlb: string; id: number | null }
    >();
    function createTypeFormat(
        type: string,
        format: string | number | boolean | null,
    ) {
        if (type === "int") {
            if (typeof format === "number") {
                return `int${format}`;
            } else if (format !== null) {
                throw Error("Unsupported int format " + format);
            }
            return `int`;
        } else if (type === "uint") {
            if (typeof format === "number") {
                return `uint${format}`;
            } else if (format === "coins") {
                return `coins`;
            } else if (format !== null) {
                throw Error("Unsupported uint format " + format);
            }
            return `uint`;
        } else if (type === "bool") {
            if (format !== null) {
                throw Error("Unsupported bool format " + format);
            }
            return "bool";
        } else if (type === "address") {
            if (format !== null) {
                throw Error("Unsupported address format " + format);
            }
            return "address";
        } else if (type === "cell") {
            if (format === "remainder") {
                return "remainder<cell>";
            } else if (format === "ref") {
                return "^cell";
            }
            if (format !== null) {
                throw Error("Unsupported cell format " + format);
            }
            return "^cell";
        } else if (type === "slice") {
            if (format === "remainder") {
                return "remainder<slice>";
            } else if (format === "ref") {
                return "^slice";
            } else if (format !== null) {
                throw Error("Unsupported slice format " + format);
            }
            return "^slice";
        } else if (type === "builder") {
            if (format === "remainder") {
                return "remainder<builder>";
            } else if (format === "ref") {
                return "^slice";
            } else if (format !== null) {
                throw Error("Unsupported builder format " + format);
            }
            return "^builder";
        } else if (type === "string") {
            if (format !== null) {
                throw Error("Unsupported builder format " + format);
            }
            return "^string";
        } else if (type === "fixed-bytes") {
            if (typeof format === "number") {
                return `fixed_bytes${format}`;
            } else if (format !== null) {
                throw Error("Unsupported fixed-bytes format " + format);
            }
            throw Error("Missing fixed-bytes format");
        }

        // Struct types
        const t = getType(ctx, type);
        if (t.kind !== "struct") {
            throw Error("Unsupported type " + type);
        }
        const s = createTupleSignature(type);
        if (format === "ref") {
            return `^${s.signature}`;
        } else if (format !== null) {
            throw Error("Unsupported struct format " + format);
        }
        return `${s.signature}`;
    }

    function createTLBField(src: ABIField) {
        if (src.type.kind === "simple") {
            let base = createTypeFormat(
                src.type.type,
                src.type.format ? src.type.format : null,
            );
            if (src.type.optional) {
                base = "Maybe " + base;
            }
            return src.name + ":" + base;
        }

        if (src.type.kind === "dict") {
            if (src.type.format !== null && src.type.format !== undefined) {
                throw Error("Unsupported map format " + src.type.format);
            }
            const key = createTypeFormat(
                src.type.key,
                src.type.keyFormat ? src.type.keyFormat : null,
            );
            const value = createTypeFormat(
                src.type.value,
                src.type.valueFormat ? src.type.valueFormat : null,
            );
            return src.name + ":dict<" + key + ", " + value + ">";
        }

        throw Error("Unsupported ABI field");
    }

    function createTupleSignature(name: string): {
        signature: string;
        tlb: string;
        id: number | null;
    } {
        if (signatures.has(name)) {
            return signatures.get(name)!;
        }
        const t = getType(ctx, name);
        if (t.kind !== "struct") {
            throw Error("Unsupported type " + name);
        }
        const fields = t.fields.map((v) => createTLBField(v.abi));

        // Calculate signature and method id
        const signature = name + "{" + fields.join(",") + "}";
        let id: number | null = null;
        if (t.ast.kind === "def_struct" && t.ast.message) {
            if (t.ast.prefix !== null) {
                id = t.ast.prefix;
            } else {
                id = newMessageId(signature);
            }
        }

        // Calculate TLB
        const tlbHeader =
            id !== null ? changeCase.snakeCase(name) + "#" + idToHex(id) : "_";
        const tlb = tlbHeader + " " + fields.join(" ") + " = " + name;

        signatures.set(name, { signature, id, tlb });
        return { signature, id, tlb };
    }

    for (const k in types) {
        const t = types[k];
        if (t.kind === "struct") {
            const r = createTupleSignature(t.name);
            t.tlb = r.tlb;
            t.signature = r.signature;
            t.header = r.id;
        }
    }

    return ctx;
}
