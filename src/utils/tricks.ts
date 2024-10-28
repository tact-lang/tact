/* eslint-disable @typescript-eslint/no-explicit-any */
type Extend<T extends any[], H> = H extends infer A ? [...T, A] : never;
type Flat<TS extends any[], R extends any[] = []> = TS extends [
    infer H,
    ...infer T,
]
    ? Flat<T, Extend<R, H>>
    : R;

declare const NoSuchCase: unique symbol;
interface NoSuchCaseBug<L> extends Array<never> {
    [NoSuchCase]: L;
}
type On<I extends any[], O> = {
    on: <const DI extends any[]>(
        ...key: I extends Flat<DI> ? DI : NoSuchCaseBug<DI>
    ) => <const DO>(
        handler: (...args: Extract<I, Flat<DI>>) => DO,
    ) => MV<Exclude<I, Flat<DI>>, O | DO>;
};

declare const CasesAreNotExhaustive: unique symbol;
interface NonExhaustiveBug<L> {
    [CasesAreNotExhaustive]: L;
}
type End<I extends any[], O> = [I] extends [never]
    ? EndInternal<I, O>
    : {
          otherwise: <const DO>(handle: (...input: I) => DO) => O | DO;
          end: NonExhaustiveBug<I>;
      };
type MV<I extends any[], O> = End<I, O> & On<I, O>;

type OnInternal<I extends any[], O> = {
    on: <const DI extends any[]>(
        ...key: DI
    ) => <const DO>(
        handler: (...args: Extract<I, Flat<DI>>) => DO,
    ) => MVInternal<Exclude<I, Flat<DI>>, O | DO>;
};
type EndInternal<I extends any[], O> = {
    otherwise: <const DO>(handle: (...input: I) => DO) => O | DO;
    end: () => O;
};
type MVInternal<I extends any[], O> = EndInternal<I, O> & OnInternal<I, O>;

const deepMatch = (a: unknown, b: unknown): boolean => {
    if (
        a === b &&
        ["number", "string", "boolean", "bigint"].includes(typeof a) &&
        typeof a === typeof b
    ) {
        return true;
    }
    if (a === null || b === null) {
        return a === b;
    }
    if (typeof a === "object" && typeof b === "object") {
        if (Array.isArray(a) && Array.isArray(b) && a.length === b.length) {
            return a.every((a, i) => deepMatch(a, b[i]));
        } else {
            return Object.entries(b).every(([k, b]) =>
                deepMatch(k in a ? (a as any)[k] : undefined, b),
            );
        }
    }
    return false;
};

export const match = <const I extends any[]>(
    ...args: I
): MV<Flat<I>, never> => {
    const rec = <I extends any[], O>(end: () => O): MVInternal<I, O> => ({
        end,
        otherwise: (handler) => handler(...(args as unknown as I)),
        on:
            <const DI extends any[]>(...match: DI) =>
            <const DO>(handler: (...args: Extract<I, Flat<DI>>) => DO) =>
                rec<Exclude<I, Flat<DI>>, O | DO>(() =>
                    deepMatch(args, match)
                        ? handler(
                              ...(args as unknown as Extract<I, Flat<DI, []>>),
                          )
                        : end(),
                ),
    });
    return rec<Flat<I>, never>(() => {
        throw new Error("Not exhaustive");
    }) as MV<Flat<I>, never>;
};
