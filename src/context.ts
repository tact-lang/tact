type Key = string | number;
export type Store<T> = Map<Key, T>;

// eslint-disable-next-line @typescript-eslint/no-explicit-any
type Stores = Map<symbol, Store<any> | undefined>;

export class CompilerContext {
    readonly stores: Stores = new Map();

    constructor(
        args: { stores: Stores } = {
            stores: new Map(),
        },
    ) {
        this.stores = args.stores;
        Object.freeze(this.stores);
        Object.freeze(this);
    }

    updateStore = <T>(storeDispatch: symbol, key: Key, value: T) => {
        const store: Store<T> = new Map(this.stores.get(storeDispatch) ?? []);
        store.set(key, value);
        const updatedStores = new Map(this.stores);
        updatedStores.set(storeDispatch, store);
        return new CompilerContext({ stores: updatedStores });
    };
}

export function createContextStore<T>() {
    const symbol = Symbol();
    return {
        get(ctx: CompilerContext, key: Key): T | null {
            return ctx.stores.get(symbol)?.get(key) ?? null;
        },
        all(ctx: CompilerContext): Store<T> {
            return ctx.stores.get(symbol) ?? new Map();
        },
        set(ctx: CompilerContext, key: Key, v: T): CompilerContext {
            return ctx.updateStore(symbol, key, v);
        },
    };
}
