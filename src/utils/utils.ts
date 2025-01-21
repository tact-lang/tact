import { throwInternalCompilerError } from "@/error/errors";

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
