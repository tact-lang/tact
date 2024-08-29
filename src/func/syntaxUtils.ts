import JSONbig from "json-bigint";
import { throwInternalCompilerError } from "../errors";
import { dummySrcInfo as tactDummySrcInfo } from "../grammar/grammar";

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

// TODO(jubnzv): Refactor and move to errors.ts when merging with `main`
export function throwUnsupportedNodeError(node: any): never {
    throwInternalCompilerError(
        `Unsupported node: ${JSONbig.stringify(node, null, 2)}`,
        tactDummySrcInfo,
    );
}
