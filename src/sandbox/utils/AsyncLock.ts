type Waiter = { promise: Promise<void>; resolve: () => void };

function createWaiter(): Waiter {
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const w: Waiter = { promise: undefined, resolve: undefined } as any;
    w.promise = new Promise((res) => {
        w.resolve = res;
    });
    return w;
}

export class AsyncLock {
    #waiters: Waiter[] = [];

    async acquire() {
        const waiters = this.#waiters.map((w) => w.promise);
        this.#waiters.push(createWaiter());
        if (waiters.length > 0) {
            await Promise.all(waiters);
        }
    }

    // eslint-disable-next-line @typescript-eslint/require-await
    async release() {
        const waiter = this.#waiters.shift();
        if (waiter !== undefined) {
            waiter.resolve();
        } else {
            throw new Error("The lock is not locked");
        }
    }

    async with<T>(fn: () => Promise<T>) {
        await this.acquire();
        try {
            return await fn();
        } finally {
            await this.release();
        }
    }
}
