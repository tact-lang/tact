import { throwInternal } from "@/error/errors";
import type { Loc } from "@/next/ast";
import type * as V from "@/next/types/via";

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

export type TcError = {
    // location where IDE should show this error
    readonly loc: Loc;
    // text description
    readonly descr: readonly TELine[];
}

export type TELine = TEText | TEVia | TECode;

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

export type TECode = {
    readonly kind: 'code';
    readonly loc: Loc;
}

export const TECode = (loc: Loc): TECode => ({ kind: 'code', loc });

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
