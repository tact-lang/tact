export class CompilerContext {
    readonly shared: Record<symbol, object | undefined> = {};

    constructor(
        args: { shared: Record<symbol, object | undefined> } = {
            shared: {},
        },
    ) {
        this.shared = args.shared;
        Object.freeze(this.shared);
        Object.freeze(this);
    }

    addShared = <T>(store: symbol, key: string | number, value: T) => {
        let sh: Record<string | number, T> = { ...this.shared[store] } || {};
        sh[key] = value;
        return new CompilerContext({ shared: { ...this.shared, [store]: sh } });
    };
}

export function createContextStore<T>() {
    const symbol = Symbol();
    return {
        get(ctx: CompilerContext, key: string | number): T | null {
            const m = ctx.shared[symbol] as Record<string | number, T> | undefined;
            if (!m || !(key in m)) {
                return null;
            }
            return m[key];
        },
        all(ctx: CompilerContext): Record<string | number, T> {
            const m = ctx.shared[symbol] as Record<string | number, T> | undefined;
            return m || {} as Record<string | number, T>;
        },
        set(ctx: CompilerContext, key: string | number, v: T) {
            return ctx.addShared(symbol, key, v);
        },
    };
}
