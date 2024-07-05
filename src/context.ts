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
        let sh: Record<string, T> = {};
        if (this.shared[store]) {
            sh = { ...this.shared[store] };
        }
        sh[key] = value;
        return new CompilerContext({ shared: { ...this.shared, [store]: sh } });
    };
}

export function createContextStore<T>() {
    const symbol = Symbol();
    return {
        get(ctx: CompilerContext, key: string | number) {
            if (!ctx.shared[symbol]) {
                return null;
            }
            const m = ctx.shared[symbol] as Record<string | number, T>;
            if (m[key]) {
                return m[key];
            } else {
                return null;
            }
        },
        all(ctx: CompilerContext): Record<string | number, T> {
            if (!ctx.shared[symbol]) {
                return {} as Record<string | number, T>;
            }
            const m = ctx.shared[symbol] as Record<string | number, T>;
            return m;
        },
        set(ctx: CompilerContext, key: string | number, v: T) {
            return ctx.addShared(symbol, key, v);
        },
    };
}
