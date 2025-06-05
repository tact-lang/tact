/* eslint-disable require-yield */
import * as Ast from "@/next/ast";
import type { TactSource } from "@/next/imports/source";
import { builtinFunctions } from "@/next/types/builtins";
import { decodeConstantDef } from "@/next/types/constant-def";
import { emptyTypeParams } from "@/next/types/type-params";

const errorKind = "function";

export function* decodeConstants(
    Lazy: Ast.ThunkBuilder,
    imported: readonly Ast.SourceCheckResult[],
    source: TactSource,
    scopeRef: () => Ast.CSource,
): Ast.WithLog<ReadonlyMap<string, Ast.Decl<Ast.CConstant>>> {
    const allConstSigs = [
        // imported
        ...imported.flatMap(({ globals, importedBy }) =>
            [...globals.constants].map(
                ([name, s]) =>
                    [
                        name,
                        Ast.Decl(s.decl, Ast.ViaImport(importedBy, s.via)),
                    ] as const,
            ),
        ),
        // local
        ...(yield* Ast.mapLog(source.items.constants, function* (c) {
            return [
                c.name.text,
                Ast.Decl(
                    yield* decodeConstant(Lazy, c, scopeRef),
                    Ast.ViaOrigin(c.loc, source),
                ),
            ] as const;
        })),
    ];
    // remove builtins
    const filteredSigs = yield* Ast.filterLog(
        allConstSigs,
        function* ([name, { via }]) {
            const isBuiltin = builtinFunctions.has(name);
            if (isBuiltin) {
                yield Ast.ERedefine(errorKind, name, Ast.ViaBuiltin(), via);
            }
            return !isBuiltin;
        },
    );
    return yield* Ast.toMap(errorKind, filteredSigs);
}

function* decodeConstant(
    Lazy: Ast.ThunkBuilder,
    constant: Ast.Constant,
    scopeRef: () => Ast.CSource,
) {
    const { init, loc } = constant;
    if (init.kind === "constant_decl") {
        yield ETopLevelDecl(loc);
        const type = Lazy({
            loc: constant.loc,
            context: [
                Ast.TEText("defining constant"),
                Ast.TECode(constant.loc),
            ],
            recover: Ast.CTypeRecover(),
            callback: function* () {
                return Ast.CTypeRecover();
            },
        });
        const expr = Lazy({
            loc: constant.loc,
            context: [
                Ast.TEText("defining constant"),
                Ast.TECode(constant.loc),
            ],
            recover: Ast.VNumber(0n, constant.loc),
            callback: function* () {
                return Ast.VNumber(0n, constant.loc);
            },
        });
        return Ast.CConstant(expr, type);
    } else {
        const [type, expr] = decodeConstantDef(
            Lazy,
            loc,
            emptyTypeParams,
            init,
            scopeRef,
            undefined,
        );
        return Ast.CConstant(expr, type);
    }
}

const ETopLevelDecl = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Top-level constant must have a body`)],
});
