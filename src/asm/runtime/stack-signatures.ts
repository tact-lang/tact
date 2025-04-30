import {
    InstructionSignature,
    Schema,
    StackEntry,
    StackValues,
} from "@/asm/runtime/stack-signatures-schema";

let signatures: Schema | undefined = undefined;

export const signatureString = (signature: InstructionSignature): string => {
    return (
        stackString(signature.inputs?.stack ?? []) +
        " -> " +
        stackString(signature.outputs?.stack ?? [])
    );
};

const stackString = (values: StackValues): string => {
    if (values.length === 0) {
        return "∅";
    }
    return values.map((value) => entryString(value)).join(" ");
};

const entryString = (entry: StackEntry): string => {
    if (entry.type === "simple") {
        const types = entry.value_types ?? [];
        if (types.length === 0) {
            return entry.name + ":Any";
        }
        const typesStr = types
            .map((it) => (it === "Integer" ? "Int" : it))
            .join("|");
        return entry.name + ":" + typesStr;
    }

    if (entry.type === "const") {
        if (entry.value === null) {
            return "null";
        }
        return entry.value.toString();
    }

    if (entry.type === "array") {
        return `x_1...x_${entry.length_var}`;
    }

    const variants = entry.match
        .map(
            (arm) =>
                "(" + stackString(arm.stack) + " " + arm.value.toString() + ")",
        )
        .join("|");
    if (entry.else) {
        const elseValues = stackString(entry.else);
        return variants + "|" + elseValues;
    }
    return variants;
};

export const signatureOf = async (
    name: string,
): Promise<InstructionSignature | undefined> => {
    const fs = await import("node:fs");

    if (signatures) {
        return signatures[name];
    }

    const signaturesData = fs.readFileSync(
        `${__dirname}/stack-signatures-data.json`,
        "utf8",
    );
    signatures = JSON.parse(signaturesData) as Schema;
    return signatures[name];
};
