/* eslint-disable @typescript-eslint/no-unused-vars */
import * as W from "@/next/types/writer";
import * as V from "@/next/types/via";
import * as E from "@/next/types/errors";
import type * as Ast from "@/next/ast";
import type { Registry } from "@/next/types/registry";

const builtins = new Map([
    ["void", 1],
    ["bounced", 1],
    ["Null", 1],
    ["Maybe", 1],
    ["Int", 1],
    ["Bool", 1],
    ["Builder", 1],
    ["Slice", 1],
    ["Cell", 1],
    ["Address", 1],
    ["String", 1],
    ["StringBuilder", 1],
]);

export type TypeDecls = undefined | ReadonlyMap<string, {
    // the definition
    readonly value: Ast.TypeDecl;
    // where it was defined
    readonly via: V.ViaUser;
}>;

const empty = (): TypeDecls => undefined;

const create = (name: string, value: Ast.TypeDecl, via: V.ViaUser): TypeDecls => {
    return new Map([[name, { value, via }]]);
};

const mapVia = (fns: TypeDecls, cb: (via: V.ViaUser) => V.ViaUser): TypeDecls => {
    if (!fns) return;
    return new Map(fns.entries().map(([k, v]) => {
        return [k, { value: v.value, via: cb(v.via) }];
    }));
};

const append = (prev: TypeDecls, next: TypeDecls): E.WithLog<TypeDecls> => {
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

export const TypeDecls: Registry<string, Ast.TypeDecl, TypeDecls> = {
    empty,
    create,
    mapVia,
    append,
};