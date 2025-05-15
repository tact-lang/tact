/* eslint-disable @typescript-eslint/no-unused-vars */
import type { ResolvedImport, TactImport, TactSource } from "@/next/imports/source";
import { memo } from "@/utils/tricks";
import type * as Ast from "@/next/ast";
import * as W from "@/next/types/writer";
import * as V from "@/next/types/via";
import type * as E from "@/next/types/errors";
import { throwInternal } from "@/error/errors";
import { logDeep } from "@/utils/log-deep.build";
import { Functions } from "@/next/types/functions";
import { TypeDecls } from "@/next/types/type-decls";

export const typecheck = (root: TactSource): E.WithLog<Scope> => {
    const errors: E.TcError[] = [];
    const recur = (source: TactSource): Scope => {
        const result = tcSource(
            // leave only imports of .tact
            onlyTactImports(source.imports)
                .map(importedBy => ({
                    globals: memoedRec(importedBy.source),
                    importedBy,
                })),
            source,
        );
        // `recur` is called only once on every source
        // this ensures errors from every source get counted
        // only once
        errors.push(...result.errors);
        return result.value
    };
    const memoedRec = memo(recur);
    return W.makeLog(memoedRec(root), errors);
};
const onlyTactImports = (imports: readonly ResolvedImport[]): readonly TactImport[] => {
    // typescript narrowing doesn't properly apply to filter,
    // so we need this helper
    const result: TactImport[] = [];
    for (const imp of imports) {
        if (imp.kind === 'tact') {
            result.push(imp);
        }
    }
    return result;
};

type SourceCheckResult = {
    // import that lead to reading this file
    readonly importedBy: TactImport;
    // scopes that were computed from this file
    readonly globals: Scope;
}

const tcSource = (
    // list of import+source pairs for every of file's imports
    imported: readonly SourceCheckResult[],
    // source for current file
    source: TactSource,
): E.WithLog<Scope> => {
    // for each of the imports
    const importGlobals = imported.map(({ globals, importedBy }) => {
        // in each of its definitions
        return updateVias(globals, (via) => {
            // tell that it came from that import
            return V.ViaImport(via, importedBy);
        });
    });

    // get local definitions
    const locals = W.flatMapLog(
        W.traverseLog(
            source.items,
            item => scopeItem(item, source),
        ),
        concatScopes,
    );

    // reduce list of sets of definitions into single set
    const all = W.flatMapLog(
        locals,
        locals => concatScopes([...importGlobals, locals]),
    );

    const typeErr = W.flatMapLog(all, checkTypes);

    return typeErr;
};

type Stmt<T> = (item: T, source: TactSource) => E.WithLog<Scope>;

const scopeItem: Stmt<Ast.ModuleItem> = (item, source) => {
    switch (item.kind) {
        case "function":
            return scopeFunction(item, source);
        case "constant":
            return scopeConstant(item, source);
        case "extension":
            // cannot scope until we know types
            return W.pureLog(emptyScope());
        case "struct_decl":
        case "message_decl":
        case "union_decl":
        case "alias_decl":
        case "contract":
        case "trait":
            return scopeType(item, source);
    }
};

const scopeFunction: Stmt<Ast.Function> = (item, source) => {
    return W.pureLog(defineFunction(
        item.name.text,
        item,
        V.ViaOrigin(item.loc, source),
    ));
};

const scopeConstant: Stmt<Ast.Constant> = (item, source) => {
    // TODO
    return W.pureLog(emptyScope());
};

const scopeType: Stmt<Ast.TypeDecl> = (item, source) => {
    return W.pureLog(defineType(
        item.name.text,
        item,
        V.ViaOrigin(item.loc, source),
    ));
};

// set of definitions (transitively) from a source file
type Scope = {
    // global function definitions
    readonly functions: Functions;
    // global type definitons
    readonly types: TypeDecls;
}

const emptyScope = (): Scope => ({
    functions: Functions.empty(),
    types: TypeDecls.empty(),
});

// sequence multiple definition sets
const concatScopes = (globals: readonly Scope[]): E.WithLog<Scope> => {
    return W.reduceLog(globals, appendScopes, emptyScope());
};

// define global function
const defineFunction = (name: string, value: Ast.Function, via: V.ViaUser): Scope => {
    return {
        ...emptyScope(),
        functions: Functions.create(name, value, via),
    };
};

// define type
const defineType = (name: string, value: Ast.TypeDecl, via: V.ViaUser): Scope => {
    return {
        ...emptyScope(),
        types: TypeDecls.create(name, value, via),
    };
};

// sequence two definition sets: define all the `right` after `left`
const appendScopes = (left: Scope, right: Scope): E.WithLog<Scope> => {
    return W.combineLog({
        functions: Functions.append(left.functions, right.functions),
        types: TypeDecls.append(left.types, right.types),
    });
};

// update all the `via` fields with information about new import
const updateVias = (globals: Scope, cb: (via: V.ViaUser) => V.ViaUser): Scope => {
    return {
        functions: Functions.mapVia(globals.functions, cb),
        types: TypeDecls.mapVia(globals.types, cb),
    };
};
