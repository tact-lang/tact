import { throwInternal } from "@/error/errors";
import type { DecodedType } from "@/next/ast/dtype";
import type { Loc } from "@/next/ast/common";
import type * as V from "@/next/ast/via";

export type WithLog<T> = Generator<TcError, T>

export function runLog<T, R>(gen: Generator<T, R, unknown>): readonly [R, readonly T[]] {
    const yields: T[] = [];
    for (;;) {
        const result = gen.next();
        if (result.done) {
            return [result.value, yields];
        } else {
            yields.push(result.value);
        }
    }
}

export function* mapLog<T, U>(xs: readonly T[], f: (x: T) => WithLog<U>): WithLog<U[]> {
    const result: U[] = [];
    for (const x of xs) {
        result.push(yield* f(x));
    }
    return result;
}

export function* reduceLog<T, U>(xs: readonly T[], init: U, f: (acc: U, x: T) => WithLog<U>): WithLog<U> {
    let acc = init;
    for (const x of xs) {
        acc = yield* f(acc, x);
    }
    return acc;
}

export function* filterLog<T>(xs: readonly T[], f: (x: T) => WithLog<boolean>): WithLog<T[]> {
    const result: T[] = [];
    for (const x of xs) {
        const res = yield* f(x);
        if (res) {
            result.push(x);
        }
    }
    return result;
}

export function* toMap<V extends { via: V.ViaUser }>(
    kind: string,
    xs: readonly (readonly [string, V])[],
): WithLog<Map<string, V>> {
    const result: Map<string, V> = new Map();
    for (const [key, next] of xs) {
        const prev = result.get(key);
        if (prev) {
            yield ERedefine(kind, key, next.via, prev.via);
        } else {
            result.set(key, next);
        }
    }
    return result;
}

export type TcError = {
    // location where IDE should show this error
    readonly loc: Loc;
    // text description
    readonly descr: readonly TELine[];
}

export type TELine = TEText | TEVia | TEViaMember | TECode | TEMismatch;

export type TEText = {
    readonly kind: 'text';
    readonly text: string;
}
export const TEText = (text: string): TEText => ({ kind: 'text', text });

export type TEVia = {
    readonly kind: 'via';
    readonly via: V.Via;
}
export const TEVia = (via: V.Via): TEVia => ({ kind: 'via', via });

export type TEViaMember = {
    readonly kind: 'via-member';
    readonly via: V.ViaMember;
}
export const TEViaMember = (via: V.ViaMember): TEViaMember => ({ kind: 'via-member', via });

export type TECode = {
    readonly kind: 'code';
    readonly loc: Loc;
}
export const TECode = (loc: Loc): TECode => ({ kind: 'code', loc });

export type TEMismatch = {
    readonly kind: 'mismatch';
    readonly tree: MatchTree;
}
export const TEMismatch = (tree: MatchTree): TEMismatch => ({ kind: 'mismatch', tree });

export type MatchTree = {
    readonly expected: DecodedType;
    readonly got: DecodedType;
    readonly children: readonly MatchTree[];
}
export const MatchTree = (
    expected: DecodedType,
    got: DecodedType,
    children: readonly MatchTree[],
): MatchTree => ({ expected, got, children });

export const viaToRange = ({ imports, defLoc: definedAt }: V.ViaUser): Loc => {
    const [head] = imports;
    if (typeof head === 'undefined') {
        return definedAt;
    }
    const { loc } = head;
    if (loc.kind === 'range') {
        return loc;
    }
    return throwInternal("Implicit import shadows something. Duplicates in stdlib?");
};

export const ERedefine = (kind: string, name: string, prev: V.Via, next: V.ViaUser): TcError => ({
    loc: viaToRange(next),
    descr: [
        TEText(`There already is a ${kind} "${name}" from`),
        TEVia(prev),
    ],
});

export const ERedefineMember = (
    name: string,
    prev: V.ViaMember,
    next: V.ViaMember,
): TcError => ({
    loc: next.defLoc,
    descr: [
        TEText(`"${name}" is inherited twice`),
        TEText(`First defined at`),
        TEViaMember(prev),
        TEText(`Redefined at`),
        TEViaMember(next),
    ],
});