/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import type { TactSource } from "@/next/imports/source";
import { builtinFunctions } from "@/next/types/builtins";
import { decodeFnType } from "@/next/types/type-fn";
import { decodeBody } from "@/next/types/body";

const errorKind = "function";

export function* decodeFunctions(
    Lazy: Ast.ThunkBuilder,
    imported: readonly Ast.SourceCheckResult[],
    source: TactSource,
    scopeRef: () => Ast.Scope,
): E.WithLog<ReadonlyMap<string, Ast.Decl<Ast.FnSig>>> {
    const allFnSigs = [
        // imported
        ...imported.flatMap(({ globals, importedBy }) => (
            [...globals.functions]
                .map(([name, fn]) => [
                    name,
                    Ast.Decl(fn.decl, Ast.ViaImport(importedBy, fn.via)),
                ] as const)
        )),
        // local
        ...yield* E.mapLog(source.items.functions, function* (fn) {
            return [
                fn.name.text, 
                Ast.Decl(
                    yield* decodeFunction(Lazy, fn, scopeRef),
                    Ast.ViaOrigin(fn.loc, source)
                )
            ] as const;
        }),
    ];

    // remove duplicates and builtins
    const filteredSigs: Map<string, Ast.Decl<Ast.FnSig>> = new Map();
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

function* decodeFunction(
    Lazy: Ast.ThunkBuilder,
    fn: Ast.Function,
    scopeRef: () => Ast.Scope,
) {
    const { type, inline, body, loc } = fn;
    const fnType = yield* decodeFnType(Lazy, type, scopeRef);
    return Ast.FnSig(
        fnType,
        inline,
        yield* decodeBody(Lazy, body, fnType, loc, scopeRef),
    );
}
