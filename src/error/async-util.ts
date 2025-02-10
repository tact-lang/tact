/**
 * .catch(), but works both with sync and async functions
 */
export const catchUncolored = <T>(
    cb: () => T,
    onError: (e: unknown) => T,
): T => {
    try {
        const result = cb();
        if (result instanceof Promise) {
            return result.catch(async (e) => onError(e)) as T;
        } else {
            return result;
        }
    } catch (e) {
        return onError(e);
    }
};

/**
 * .then(), but works both with sync and async functions
 */
export const thenUncolored = <T, U>(
    t: T,
    f: (t: T) => U,
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
): T extends Promise<any> ? Promise<U> : U => {
    if (t instanceof Promise) {
        // eslint-disable-next-line @typescript-eslint/require-await,  @typescript-eslint/no-explicit-any -- this is absolutely intended
        return t.then(async (t) => f(t)) as any;
    } else {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        return f(t) as any;
    }
};
