/* eslint-disable require-yield */
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import type { TactSource } from "@/next/imports/source";
import { builtinFunctions } from "@/next/types/builtins";
import { decodeConstantDef } from "@/next/types/constant-def";

const errorKind = "function";

export function* decodeConstants(
    imported: readonly Ast.SourceCheckResult[],
    source: TactSource,
    scopeRef: () => Ast.Scope,
): E.WithLog<ReadonlyMap<string, Ast.Decl<Ast.ConstSig>>> {
    const allConstSigs = [
        // imported
        ...imported.flatMap(({ globals, importedBy }) => (
            [...globals.constants]
                .map(([name, s]) => [name, Ast.Decl(s.decl, Ast.ViaImport(importedBy, s.via))] as const)
        )),
        // local
        ...yield* E.mapLog(source.items.constants, function* (c) {
            return [
                c.name.text, 
                Ast.Decl(
                    yield* decodeConstant(c, scopeRef),
                    Ast.ViaOrigin(c.loc, source)
                ),
            ] as const;
        }),
    ];
    // remove builtins
    const filteredSigs = yield* E.filterLog(allConstSigs, function* ([name, { via }]) {
        const isBuiltin = builtinFunctions.has(name);
        if (isBuiltin) {
            yield E.ERedefine(errorKind, name, Ast.ViaBuiltin(), via);
        }
        return !isBuiltin;
    });
    return yield* E.toMap(errorKind, filteredSigs);
}

function* decodeConstant(
    constant: Ast.Constant,
    scopeRef: () => Ast.Scope,
) {
    const { init, loc } = constant;
    if (init.kind === "constant_decl") {
        yield ETopLevelDecl(loc);
        const type = function*() { return Ast.DTypeRecover(); };
        const expr = function*() { return Ast.VNumber(0n, constant.loc); };
        return Ast.ConstSig(expr, type);
    } else {
        const typeParams = Ast.TypeParams([], new Set());
        const [type, expr] = decodeConstantDef(
            typeParams,
            init,
            scopeRef,
            undefined,
        );
        return Ast.ConstSig(expr, type);
    }
}

const ETopLevelDecl = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Top-level constant must have a body`),
    ],
});
