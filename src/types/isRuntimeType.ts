import type { TypeRef } from "@/types/types";

export function isRuntimeType(src: TypeRef): boolean {
    if (src.kind === "null") {
        return true;
    }
    if (src.kind === "ref_bounced") {
        return true;
    }
    return false;
}
