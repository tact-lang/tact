/**
 * Create a promise and functions that change its state
 */
export const deferred = <T>() => {
    let resolve__: undefined | ((value: T) => void);
    let reject__: undefined | ((error: unknown) => void);
    const promise: Promise<T> = new Promise((resolve_, reject_) => {
        resolve__ = resolve_;
        reject__ = reject_;
    });
    const resolve = (value: T) => {
        resolve__?.(value);
    };
    const reject = (error: unknown) => {
        reject__?.(error);
    };
    return { promise, resolve, reject };
};

export type Deferred<T> = ReturnType<typeof deferred<T>>;

/**
 * Create a map with asynchronously computed values
 */
export const deferredMap = <K, V>(keys: K[]) => {
    const defers: Map<K, Deferred<V>> = new Map();
    for (const key of keys) {
        defers.set(key, deferred<V>());
    }
    const find = (key: K): Deferred<V> => {
        const d = defers.get(key);
        if (typeof d === "undefined") {
            throw new Error(
                "Deferred map key was not passed during initialization",
            );
        }
        return d;
    };
    return {
        /**
         * Get a promise for a given key's value
         */
        get: (key: K): Promise<V> => {
            return find(key).promise;
        },
        /**
         * Set a `value` for a given `key`
         */
        set: (key: K, value: V): void => {
            find(key).resolve(value);
        },
    };
};

/**
 * Make a wrapper that doesn't allow computation to be executed more
 * than in `limit` parallel threads
 */
export const semaphore = (limit: number) => {
    const queue: Deferred<void>[] = [];

    /**
     * Execute callback, when parallelism limit allows it
     */
    return async <T>(cb: () => Promise<T>): Promise<T> => {
        try {
            if (limit === 0) {
                // eslint-disable-next-line @typescript-eslint/no-invalid-void-type
                const d = deferred<void>();
                await d.promise;
            }
            --limit;
            return cb();
        } finally {
            ++limit;
            queue.shift()?.resolve();
        }
    };
};
