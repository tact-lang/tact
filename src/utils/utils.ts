import { crc16 } from "./crc16";

export function topologicalSort<T>(src: T[], references: (src: T) => T[]) {
    const result: T[] = [];
    const visited = new Set<T>();
    const visiting = new Set<T>();
    const visit = (src: T) => {
        if (visiting.has(src)) {
            throw Error("Cycle detected");
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

export function deepFreeze<T>(obj: T) {
    const propNames = Object.getOwnPropertyNames(obj);
    for (const name of propNames) {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const value = (obj as any)[name];
        if (value && typeof value === "object") {
            deepFreeze(value);
        }
    }
    return Object.freeze(obj);
}

export function getMethodId(name: string) {
    return (crc16(name) & 0xffff) | 0x10000;
}
