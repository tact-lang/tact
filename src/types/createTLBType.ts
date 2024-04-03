import { ABIField, beginCell } from "@ton/core";
import * as cs from "change-case";
import { sha256_sync } from "@ton/crypto";

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
            throw Error("Unsupported cell format " + format);
        }
        return "^slice";
    } else if (type === "fixed-bytes") {
        if (typeof format === "number") {
            return `fixed_bytes${format}`;
        } else if (format !== null) {
            throw Error("Unsupported fixed-bytes format " + format);
        }
        throw Error("Missing fixed-bytes format");
    }

    // Struct types
    if (format === "ref") {
        return `^${type}`;
    } else if (format !== null) {
        throw Error("Unsupported struct format " + format);
    }
    return type;
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

export function createTLBType(
    name: string,
    args: ABIField[],
    kind: "struct" | "message",
    knownHeader: number | null,
): { tlb: string; header: number | null } {
    const fields = args.map(createTLBField).join(" ");
    if (kind === "struct") {
        return { tlb: "_ " + fields + " = " + name, header: null };
    } else {
        const base = cs.snakeCase(name) + " " + fields + " = " + name;
        const op =
            knownHeader !== null
                ? knownHeader
                : beginCell()
                      .storeBuffer(sha256_sync(base))
                      .endCell()
                      .beginParse()
                      .loadUint(32);
        const opText = beginCell()
            .storeUint(op, 32)
            .endCell()
            .beginParse()
            .loadBuffer(4)
            .toString("hex");
        const res =
            cs.snakeCase(name) + "#" + opText + " " + fields + " = " + name;
        return { tlb: res, header: op };
    }
}
