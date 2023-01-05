import { crc16 } from "./crc16";

export function topologicalSort<T>(src: T[], references: (src: T) => T[]) {
    let result: T[] = [];
    let visited = new Set<T>();
    let visiting = new Set<T>();
    let visit = (src: T) => {
        if (visiting.has(src)) {
            throw Error('Cycle detected');
        }
        if (!visited.has(src)) {
            visiting.add(src);
            for (let r of references(src)) {
                visit(r);
            }
            visiting.delete(src);
            visited.add(src);
            result.push(src);
        }
    }
    for (let s of src) {
        visit(s);
    }
    return result;
}

export function deepFreeze<T>(obj: T) {
    var propNames = Object.getOwnPropertyNames(obj);
    for (let name of propNames) {
        let value = (obj as any)[name];
        if (value && typeof value === "object") {
            deepFreeze(value);
        }
    }
    return Object.freeze(obj);
}

export function getMethodId(name: string) {
    return (crc16(name) & 0xffff) | 0x10000;
}