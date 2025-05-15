/* eslint-disable @typescript-eslint/no-unused-vars */
import * as W from "@/next/types/writer";
import * as V from "@/next/types/via";
import * as E from "@/next/types/errors";
import type * as Ast from "@/next/ast";
import type { Registry } from "@/next/types/registry";

// FIXME
const Fn = (xs: 1[], x: 1) => 1;
const TVar = (x: string) => 1 as const;
const String = 1;
const Void = 1;
const Int = 1;
const Bool = 1;
const Address = 1;
const Cell = 1;
const Null = 1;
const Slice = 1;

const builtins = new Map([
    ["dump", Fn([TVar("T")], Void)],
    ["ton", Fn([String], Int)],
    ["require", Fn([Bool, String], Void)],
    ["address", Fn([String], Address)],
    ["cell", Fn([String], Cell)],
    ["dumpStack", Fn([], Void)],
    ["emptyMap", Fn([], Null)],
    // ["sha256", Overload([
    //     Fn([String], Int),
    //     Fn([Slice], Int),
    // ])],
    ["slice", Fn([String], Slice)],
    ["rawSlice", Fn([String], Slice)],
    ["ascii", Fn([String], Int)],
    ["crc32", Fn([String], Int)],
]);

export type Functions = undefined | ReadonlyMap<string, {
    // the definition
    readonly value: Ast.Function;
    // where it was defined
    readonly via: V.ViaUser;
}>;

const empty = (): Functions => undefined;

const create = (name: string, value: Ast.Function, via: V.ViaUser): Functions => {
    return new Map([[name, { value, via }]]);
};

const mapVia = (fns: Functions, cb: (via: V.ViaUser) => V.ViaUser): Functions => {
    if (!fns) return;
    return new Map(fns.entries().map(([k, v]) => {
        return [k, { value: v.value, via: cb(v.via) }];
    }));
};

const append = (prev: Functions, next: Functions): E.WithLog<Functions> => {
    if (!prev || !next) return W.pureLog(next);
    const value = new Map(prev.entries());
    const errors: E.TcError[] = [];
    for (const [name, nextItem] of next) {
        const prevItem = value.get(name);
        // defined in compiler
        if (builtins.has(name)) {
            errors.push(E.ERedefineFn(name, V.ViaBuiltin(), nextItem.via));
            continue;
        }
        // not defined yet; define it now
        if (typeof prevItem === 'undefined') {
            value.set(name, nextItem);
            continue;
        }
        // already defined, and it's not a diamond situation
        if (prevItem.via.source !== nextItem.via.source) {
            errors.push(E.ERedefineFn(name, prevItem.via, nextItem.via));
        }
    }
    return W.makeLog(value, errors);
};

export const Functions: Registry<string, Ast.Function, Functions> = {
    empty,
    create,
    mapVia,
    append,
};