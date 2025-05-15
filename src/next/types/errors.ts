import * as E from "@/next/types/error-dsl";
import type * as W from "@/next/types/writer";
import type * as V from "@/next/types/via";

export * from "@/next/types/error-dsl";

export type WithLog<T> = W.Writer<E.TcError, T>;

export const ERedefineFn = (name: string, prev: V.Via, next: V.ViaUser): E.TcError => ({
    loc: E.viaToRange(next),
    descr: [
        E.TEText(`There already is a function "${name}" from`),
        E.TEVia(prev),
    ],
});