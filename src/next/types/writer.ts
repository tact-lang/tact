import { throwInternal } from "@/error/errors";
import { entries } from "@/utils/tricks";

export type Writer<C, T> = {
    errors: C[];
    value: T;
}

export const pureLog = <T>(value: T): Writer<never, T> => ({
    errors: [],
    value,
});

export const makeLog = <C, T>(value: T, errors: C[]): Writer<C, T> => ({ value, errors });

export const mapLog = <C, T, U>(x: Writer<C, T>, f: (t: T) => U): Writer<C, U> => {
    return {
        errors: x.errors,
        value: f(x.value),
    };
};

export const flatMapLog = <C, T, U>(x: Writer<C, T>, f: (t: T) => Writer<C, U>): Writer<C, U> => {
    const res = f(x.value);
    return {
        errors: [...x.errors, ...res.errors],
        value: res.value,
    };
};

export const combineLog = <C, O>(children: { [K in keyof O]: Writer<C, O[K]> }): Writer<C, O> => {
    const value = {} as O;
    const errors: C[] = [];
    for (const [k, v] of entries(children)) {
        value[k] = v.value;
        errors.push(...v.errors);
    }
    return { errors, value };
};

export const traverseLog = <C, T, U>(xs: readonly T[], cb: (t: T) => Writer<C, U>): Writer<C, U[]> => {
    const value: U[] = [];
    const errors: C[] = [];
    for (const x of xs) {
        const v = cb(x);
        value.push(v.value);
        errors.push(...v.errors);
    }
    return { errors, value };
};

export const reduceLog = <C, A, T>(
    xs: readonly T[], cb: (a: A, t: T) => Writer<C, A>, init: A,
): Writer<C, A> => {
    let acc: Writer<C, A> = pureLog(init);
    for (const x of xs) {
        acc = flatMapLog(acc, acc => cb(acc, x));
    }
    return acc;
};

export const reduce1Log = <C, T>(
    xs: readonly T[], cb: (a: T, t: T) => Writer<C, T>,
): Writer<C, T> => {
    const [head, ...tail] = xs;
    if (typeof head === 'undefined') {
        return throwInternal("Reducing empty list");
    }
    return reduceLog(tail, cb, head);
};
