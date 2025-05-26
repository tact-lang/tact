import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import type { TactImport, TactSource } from "@/next/imports/source";
import { builtinFunctions } from "@/next/types/builtins";
import { decodeFnType } from "@/next/types/util";

const errorKind = "function";

export function* getAllFunctions(
    imported: readonly Ast.SourceCheckResult[],
    source: TactSource,
    sigs: ReadonlyMap<string, Ast.DeclSig>,
    aliases: Map<string, Ast.AliasSig | Ast.BadSig>,
): E.WithLog<ReadonlyMap<string, Ast.FnSig>> {
    const allFnSigs = [
        // imported
        ...imported.flatMap(({ globals, importedBy }) => (
            [...globals.fnSigs]
                .map(([name, s]) => [name, toSigDecoded(s, importedBy)] as const)
        )),
        // local
        ...yield* E.mapLog(source.items.functions, function* (fn) {
            const { name, type, inline, body, loc } = fn;
            const via = Ast.ViaOrigin(loc, source);
            const fnType = yield* decodeFnType(type, via, sigs, aliases);
            return [name.text, Ast.FnSig(fnType, via)] as const;
        }),
    ];

    // remove duplicates and builtins
    const filteredSigs: Map<string, Ast.FnSig> = new Map();
    for (const [name, sig] of allFnSigs) {
        const isBuiltin = builtinFunctions.has(name);
        if (isBuiltin) {
            yield E.ERedefine(errorKind, name, Ast.ViaBuiltin(), sig.via);
            continue;
        }
        const prev = filteredSigs.get(name);
        if (!prev) {
            filteredSigs.set(name, sig);
            continue;
        }
        if (prev.via.source !== sig.via.source) {
            yield E.ERedefine(errorKind, name, sig.via, prev.via);
        }
    }
    return filteredSigs;
}

const toSigDecoded = (fn: Ast.FnSig, importedBy: TactImport): Ast.FnSig => {
    const via = Ast.ViaImport(importedBy, fn.via);
    return Ast.FnSig(fn.type, via);
};
