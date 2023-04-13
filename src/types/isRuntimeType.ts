import { TypeRef } from "./types";

export function isRuntimeType(src: TypeRef): boolean {
    if (src.kind === 'null') {
        return true;
    }
    return false;
}