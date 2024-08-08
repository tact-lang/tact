import { crc16 } from "./crc16";
import { throwInternalCompilerError } from "../errors";

export function topologicalSort<T>(src: T[], references: (src: T) => T[]) {
    const result: T[] = [];
    const visited: Set<T> = new Set();
    const visiting: Set<T> = new Set();
    const visit = (src: T) => {
        if (visiting.has(src)) {
            throwInternalCompilerError("Cycle detected");
        }
        if (!visited.has(src)) {
            visiting.add(src);
            for (const r of references(src)) {
                visit(r);
            }
            visiting.delete(src);
            visited.add(src);
            result.push(src);
        }
    };
    for (const s of src) {
        visit(s);
    }
    return result;
}

export function getMethodId(name: string) {
    return (crc16(name) & 0xffff) | 0x10000;
}
