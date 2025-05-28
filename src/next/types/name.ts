import { throwInternal } from "@/error/errors";

export const recoverName = (name: string, set: ReadonlySet<string>) => {
    for (let i = 0; i < 100; ++i) {
        const nextName = `${name}${i}`;
        if (!set.has(nextName)) {
            return nextName;
        }
    }
    return throwInternal("Iteration limit reached");
};
