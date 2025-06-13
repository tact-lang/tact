/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import type { TactSource } from "@/next/imports/source";
import { builtinTypes } from "@/next/types/builtins";
import { decodeAlias } from "@/next/types/alias";
import { decodeContract } from "@/next/types/contract";
import { decodeTrait } from "@/next/types/trait";
import { decodeStruct } from "@/next/types/struct";
import { decodeMessage } from "@/next/types/message";
import { decodeUnion } from "@/next/types/union";

const errorKind = "type";

export function* decodeTypeDecls(
    Lazy: Ast.ThunkBuilder,
    imported: readonly Ast.SourceCheckResult[],
    source: TactSource,
    scopeRef: () => Ast.CSource,
): Ast.Log<ReadonlyMap<string, Ast.Decl<Ast.CTypeDecl>>> {
    const importedSigs = imported.map(
        ({ globals, importedBy }) =>
            new Map(
                globals.typeDecls
                    .entries()
                    .map(([name, s]) => [
                        name,
                        Ast.Decl(s.decl, Ast.ViaImport(importedBy, s.via)),
                    ]),
            ),
    );

    const localSigs = yield* Ast.mapLog(source.items.types, function* (decl) {
        const via = Ast.ViaOrigin(decl.loc, source);
        return new Map([
            [
                decl.name.text,
                Ast.Decl(yield* decodeTypeDecl(Lazy, decl, scopeRef), via),
            ],
        ]);
    });

    const prev: Map<string, Ast.Decl<Ast.CTypeDecl>> = new Map();
    for (const next of [...importedSigs, ...localSigs]) {
        for (const [name, nextItem] of next) {
            const prevItem = prev.get(name);
            // defined in compiler
            if (builtinTypes.has(name)) {
                yield Ast.ERedefine(
                    errorKind,
                    name,
                    Ast.ViaBuiltin(),
                    nextItem.via,
                );
                continue;
            }
            // not defined yet; define it now
            if (typeof prevItem === "undefined") {
                prev.set(name, nextItem);
                continue;
            }
            // already defined, and it's not a diamond situation
            if (prevItem.via.source !== nextItem.via.source) {
                yield Ast.ERedefine(
                    errorKind,
                    name,
                    prevItem.via,
                    nextItem.via,
                );
            }
        }
    }
    return prev;
}

function* decodeTypeDecl(
    Lazy: Ast.ThunkBuilder,
    decl: Ast.TypeDecl,
    scopeRef: () => Ast.CSource,
): Ast.Log<Ast.CTypeDecl> {
    switch (decl.kind) {
        case "alias_decl": {
            return yield* decodeAlias(Lazy, decl, scopeRef);
        }
        case "contract": {
            return yield* decodeContract(Lazy, decl, scopeRef);
        }
        case "trait": {
            return yield* decodeTrait(Lazy, decl, scopeRef);
        }
        case "struct_decl": {
            return yield* decodeStruct(Lazy, decl, scopeRef);
        }
        case "message_decl": {
            return yield* decodeMessage(Lazy, decl, scopeRef);
        }
        case "union_decl": {
            return yield* decodeUnion(Lazy, decl, scopeRef);
        }
    }
}
