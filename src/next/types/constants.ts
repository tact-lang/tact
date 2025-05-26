import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { dealiasType } from "@/next/types/aliases";
import type { TactImport, TactSource } from "@/next/imports/source";
import { builtinFunctions } from "@/next/types/builtins";
import { checkExpr } from "@/next/types/expression";

const errorKind = "function";

export function* getAllConstants(
    imported: readonly Ast.SourceCheckResult[],
    source: TactSource,
    sigs: ReadonlyMap<string, Ast.DeclSig>,
    aliases: ReadonlyMap<string, Ast.AliasSig | Ast.BadSig>,
    fnSigs: ReadonlyMap<string, Ast.FnSig>,
    extSigs: ReadonlyMap<string, readonly Ast.ExtSig[]>,
): E.WithLog<ReadonlyMap<string, Ast.ConstSig>> {
    const allConstSigs = [
        // imported
        ...imported.flatMap(({ globals, importedBy }) => (
            [...globals.constSigs]
                .map(([name, s]) => [name, toSigDecoded(s, importedBy)] as const)
        )),
        // local
        ...yield* E.mapLog(source.items.constants, function* (constant) {
            const { name, init, loc } = constant;
            const via = Ast.ViaOrigin(loc, source);
            const initType = yield* decodeInit(init, loc, sigs, aliases);
            return [name.text, Ast.ConstSig(initType, via)] as const;
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

function* decodeInit(
    init: Ast.ConstantInit,
    loc: Ast.Loc,
    sigs: ReadonlyMap<string, Ast.DeclSig>,
    aliases: ReadonlyMap<string, Ast.AliasSig | Ast.BadSig>,
): E.WithLog<Ast.DecodedType> {
    if (init.kind === "constant_decl") {
        yield ETopLevelDecl(loc);
        return Ast.DTypeRecover();
    }
    const { type, initializer } = init;

    const typeParams = Ast.TypeParams([], new Set());
    const ascribedType = type
        ? yield* dealiasType(sigs, aliases, typeParams, type)
        : undefined;

    const computedType = yield* checkExpr(
        initializer,
        
    );
    
    return ascribedType;
}

const toSigDecoded = (fn: Ast.ConstSig, importedBy: TactImport): Ast.ConstSig => {
    const via = Ast.ViaImport(importedBy, fn.via);
    return Ast.ConstSig(fn.type, via);
};

const ETopLevelDecl = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Top-level constant must have a body`),
    ],
});
