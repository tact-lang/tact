import * as E from "@/next/types/errors";
import * as Ast from "@/next/ast";

export function* concatReg<V extends { via: Ast.ViaUser }>(
    builtins: Map<string, unknown>,
    kind: string,
    all: ReadonlyMap<string, V>[]
): E.WithLog<ReadonlyMap<string, V>> {
    const prev: Map<string, V> = new Map();
    for (const next of all) {
        for (const [name, nextItem] of next) {
            const prevItem = prev.get(name);
            // defined in compiler
            if (builtins.has(name)) {
                yield E.ERedefine(kind, name, Ast.ViaBuiltin(), nextItem.via);
                continue;
            }
            // not defined yet; define it now
            if (typeof prevItem === 'undefined') {
                prev.set(name, nextItem);
                continue;
            }
            // already defined, and it's not a diamond situation
            if (prevItem.via.source !== nextItem.via.source) {
                yield E.ERedefine(kind, name, prevItem.via, nextItem.via);
            }
        }
    }
    return prev;
}