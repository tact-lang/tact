/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { builtinTypes } from "@/next/types/builtins";
import type { TactSource } from "@/next/imports/source";
import { decodeAlias } from "@/next/types/alias";
import { decodeContract } from "@/next/types/contract";

const errorKind = 'type';

export function* decodeTypeDecls(
    imported: readonly Ast.SourceCheckResult[],
    source: TactSource,
    scopeRef: () => Ast.Scope,
): E.WithLog<ReadonlyMap<string, Ast.Decl<Ast.TypeDeclSig>>> {
    const importedSigs = imported.map(({ globals, importedBy }) => (
        new Map(
            globals.typeDecls.entries()
                .map(([name, s]) => [name, Ast.Decl(s.decl, Ast.ViaImport(importedBy, s.via))])
        )
    ));

    const localSigs = yield* E.mapLog(
        source.items.types,
        function* (decl) {
            const via = Ast.ViaOrigin(decl.loc, source);
            return new Map([[
                decl.name.text,
                Ast.Decl(
                    yield* decodeTypeDecl(decl, source, scopeRef),
                    via,
                ),
            ]]);
        },
    );

    const prev: Map<string, Ast.Decl<Ast.TypeDeclSig>> = new Map();
    for (const next of [...importedSigs, ...localSigs]) {
        for (const [name, nextItem] of next) {
            const prevItem = prev.get(name);
            // defined in compiler
            if (builtinTypes.has(name)) {
                yield E.ERedefine(errorKind, name, Ast.ViaBuiltin(), nextItem.via);
                continue;
            }
            // not defined yet; define it now
            if (typeof prevItem === 'undefined') {
                prev.set(name, nextItem);
                continue;
            }
            // already defined, and it's not a diamond situation
            if (prevItem.via.source !== nextItem.via.source) {
                yield E.ERedefine(errorKind, name, prevItem.via, nextItem.via);
            }
        }
    }
    return prev;
}

function* decodeTypeDecl(
    decl: Ast.TypeDecl,
    source: TactSource,
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.TypeDeclSig> {
    switch (decl.kind) {
        case "alias_decl": {
            return yield* decodeAlias(decl, scopeRef);
        }
        case "contract": {
            return yield* decodeContract(decl, scopeRef);
        }
        case "trait": {
            throw new Error();
            // return Ast.DeclSig('contract', 0, via);
        }
        case "message_decl": {
            throw new Error();
            // return Ast.DeclSig('usual', 0, via);
        }
        case "struct_decl": {
            throw new Error();
            // return Ast.DeclSig('usual', decl.typeParams.length, via);
        }
        case "union_decl": {
            throw new Error();
            // return Ast.DeclSig('usual', decl.typeParams.length, via);
        }
    }
}
