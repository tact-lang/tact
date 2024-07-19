/**
 * Provides deep copy that works for AST nodes.
 */
export function deepCopy<T>(obj: T): T {
    if (obj === null || typeof obj !== "object") {
        return obj;
    }
    if (Array.isArray(obj)) {
        return obj.map((item) => deepCopy(item)) as unknown as T;
    }
    const copy = {} as T;
    for (const key in obj) {
        if (Object.prototype.hasOwnProperty.call(obj, key)) {
            (copy as any)[key] = deepCopy((obj as any)[key]);
        }
    }
    return copy;
}
