import type { ABITypeRef } from "@ton/core";
import { getType } from "@/types/resolveDescriptors";
import type { WriterContext } from "@/generator/Writer";

export function resolveFuncTypeFromAbi(
    fields: ABITypeRef[],
    ctx: WriterContext,
): string {
    if (fields.length === 0) {
        return "tuple";
    }
    const res: string[] = [];
    for (const f of fields) {
        switch (f.kind) {
            case "dict":
                {
                    res.push("cell");
                }
                break;
            case "simple": {
                if (
                    f.type === "int" ||
                    f.type === "uint" ||
                    f.type === "bool"
                ) {
                    res.push("int");
                } else if (f.type === "cell") {
                    res.push("cell");
                } else if (f.type === "slice") {
                    res.push("slice");
                } else if (f.type === "builder") {
                    res.push("builder");
                } else if (f.type === "address") {
                    res.push("slice");
                } else if (f.type === "fixed-bytes") {
                    res.push("slice");
                } else if (f.type === "string") {
                    res.push("slice");
                } else {
                    const t = getType(ctx.ctx, f.type);
                    if (t.kind !== "struct") {
                        throw Error("Unsupported type: " + t.kind);
                    }
                    if (f.optional ?? t.fields.length === 0) {
                        res.push("tuple");
                    } else {
                        const loaded = t.fields.map((v) => v.abi.type);
                        res.push(resolveFuncTypeFromAbi(loaded, ctx));
                    }
                }
            }
        }
    }
    return `(${res.join(", ")})`;
}
