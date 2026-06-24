import { entries } from '@/utils/tricks';
import { type Slice, Builder } from '@ton/core'

export type Path = string[]

export class TlbError extends Error {
    constructor(
        public error: unknown,
        public context: Path
    ) {
        super();
    }
}

/**
 * TL-B type
 */
export interface Tlb<T> {
    /**
     * Store `value` into `builder` in context `path`
     */
    store: (value: T, builder: Builder, path: Path) => void;
    /**
     * Load value from `slice` in context `path`
     */
    load: (slice: Slice, path: Path) => T;
}

export type GetTlb<T> = T extends Tlb<infer U> ? U : never

/**
 * Internal wrapper for primitive types
 * Catches errors if load/store failed
 */
export const _primitive = <T>(child: Tlb<T>): Tlb<T> => ({
    store: (t, b, p) => {
        try {
            child.store(t, b, p)
        } catch (e) {
            throw new TlbError(e, p);
        }
    },
    load: (s, p) => {
        try {
            return child.load(s, p);
        } catch (e) {
            throw new TlbError(e, p);
        }
    },
});

/**
 * Non-stored value
 * Always returns `value` when loaded
 * Doesn't have any binary representation
 */
export const pure = <T>(value: T): Tlb<T> => ({
    store: (_t, _b) => {},
    load: (_s) => value,
});

/**
 * Ref to another type
 * Equivalent to `^child` in TL-B
 */
export const ref = <T>(child: Tlb<T>): Tlb<T> => ({
    store: (t, b, p) => {
        const b2 = new Builder();
        const refId = `refs[${b.refs}]`;
        const path = [...p, refId];
        child.store(t, b2, path);
        try {
            b.storeRef(b2.endCell());
        } catch (e) {
            throw new TlbError(e, path);
        }
    },
    load: (s, p) => {
        const refId = `refs[${s.offsetRefs}]`;
        const path = [...p, refId];
        try {
            return child.load(s.loadRef().asSlice(), path);
        } catch (e) {
            throw new TlbError(e, path);
        }
    },
});

/**
 * Sequence of types
 * Equivalent to space-separated list in TL-B:
 * `foo:T bar:U`
 */
export const object = <T extends object>(
    children: { [K in keyof T]: Tlb<T[K]> }
): Tlb<T> => {
    const fields = entries(children);
    return {
        store: (t, b, p) => {
            for (const [k, child] of fields) {
                child.store(t[k], b, [...p, String(k)]);
            }
        },
        load: (s, p) => {
            const result = {} as T;
            for (const [k, child] of fields) {
                result[k] = child.load(s, [...p, String(k)]);
            }
            return result;
        },
    };
};

/**
 * Exact value of type `child`
 * Equivalent to `#1234` in TL-B
 */
export const literal = <const T>(child: Tlb<T>) =>
    <U extends T>(value: U): Tlb<U> => ({
    store: (t, b, p) => {
        if (t !== value) {
            throw new TlbError(new Error('Invalid value'), p);
        }
        child.store(value, b, p);
    },
    load: (s, p) => {
        const readValue = child.load(s, p);
        if (value !== readValue) {
            throw new TlbError(new Error('Invalid value'), p);
        }
        return value;
    },
});