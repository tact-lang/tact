import { ABITypeRef } from "@ton/core";
import { getType } from "../../types/resolveDescriptors";
import { WriterContext } from "../Writer";

export function resolveFuncTypeFromAbiUnpack(
    name: string,
    fields: { name: string; type: ABITypeRef }[],
    ctx: WriterContext,
): string {
    if (fields.length === 0) {
        return `${name}`;
    }
    const res: string[] = [];
    for (const f of fields) {
        if (f.type.kind === "dict") {
            res.push(`${name}'${f.name}`);
        } else if (f.type.kind === "simple") {
            if (
                f.type.type === "int" ||
                f.type.type === "uint" ||
                f.type.type === "bool"
            ) {
                res.push(`${name}'${f.name}`);
            } else if (f.type.type === "cell") {
                res.push(`${name}'${f.name}`);
            } else if (f.type.type === "slice") {
                res.push(`${name}'${f.name}`);
            } else if (f.type.type === "builder") {
                res.push(`${name}'${f.name}`);
            } else if (f.type.type === "address") {
                res.push(`${name}'${f.name}`);
            } else if (f.type.type === "fixed-bytes") {
                res.push(`${name}'${f.name}`);
            } else if (f.type.type === "string") {
                res.push(`${name}'${f.name}`);
            } else {
                const t = getType(ctx.ctx, f.type.type);
                if (f.type.optional || t.fields.length === 0) {
                    res.push(`${name}'${f.name}`);
                } else {
                    const loaded = t.fields.map((v) => v.abi);
                    res.push(
                        resolveFuncTypeFromAbiUnpack(
                            `${name}'${f.name}`,
                            loaded,
                            ctx,
                        ),
                    );
                }
            }
        } else {
            throw Error("Unsupported type");
        }
    }
    return `(${res.join(", ")})`;
}
