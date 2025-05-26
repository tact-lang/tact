import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import type { TactImport, TactSource } from "@/next/imports/source";
import { decodeFnType } from "@/next/types/util";

export function* getTraitSigs(
    imported: readonly Ast.SourceCheckResult[],
    source: TactSource,
    sigs: ReadonlyMap<string, Ast.DeclSig>,
    aliases: Map<string, Ast.TraitSig>,
) {
    const allTraitsSigs = [
        // imported
        ...imported.flatMap(({ globals, importedBy }) => (
            [...globals.typeDecls]
                .flatMap(([name, s]) => {
                    if (s.kind !== 'trait') {
                        return [];
                    }
                    return [[name, toSigDecoded(s, importedBy)] as const];
                })
        )),
        // local
        ...yield* E.mapLog(source.items.functions, function* (fn) {
            const { name, type, inline, body, loc } = fn;
            const via = Ast.ViaOrigin(loc, source);
            const fnType = yield* decodeFnType(type, via, sigs, aliases);
            return [name.text, Ast.FnSig(fnType, via)] as const;
        }),
    ];
}

const toSigDecoded = (fn: Ast.TraitSig, importedBy: TactImport): Ast.FnSig => {
    const via = Ast.ViaImport(importedBy, fn.via);
    return Ast.FnSig(fn.type, via);
};
