/* eslint-disable @typescript-eslint/no-unnecessary-condition, @typescript-eslint/no-explicit-any */

// Extend the Set prototype to include isSubsetOf
interface Set<T> {
    isSubsetOf(otherSet: Set<T>): boolean;
}

if (!(Set.prototype as any).isSubsetOf) {
    (Set.prototype as any).isSubsetOf = function <T>(
        this: Set<T>,
        otherSet: Set<T>,
    ): boolean {
        // @ts-expect-error - TS doesn't know that this is a Set
        for (const elem of this) {
            // @ts-expect-error - TS doesn't know that otherSet is a Set
            if (!otherSet.has(elem)) {
                return false;
            }
        }
        return true;
    };
}

/* eslint-enable */

// Add an empty export statement to ensure it's treated as a module
export {};
