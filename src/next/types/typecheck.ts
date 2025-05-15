/* eslint-disable @typescript-eslint/no-unused-vars */
import type { ResolvedImport, TactImport, TactSource } from "@/next/imports/source";
import { memo } from "@/utils/tricks";
import type * as Ast from "@/next/ast";
import * as W from "@/next/types/writer";
import * as V from "@/next/types/via";
import { throwInternal } from "@/error/errors";
import { logDeep } from "@/utils/log-deep.build";

export const typecheck = (root: TactSource): WithLog<Scope> => {
    const errors: TcError[] = [];
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
    currSource: TactSource,
): WithLog<Scope> => {
    // for each of the imports
    const importGlobals = imported.map(({ globals, importedBy }) => {
        // in each of its definitions
        return updateVias(globals, (via) => {
            // tell that it came from that import
            return V.ViaImport(via, importedBy);
        });
    });
    return W.flatMapLog(
        // append local definitions to the end of the list
        W.traverseLog(
            currSource.items,
            item => scopeItem(item, currSource),
        ),
        // reduce list of sets of definitions into single set
        local => {
            const allScopes = [...importGlobals, ...local];
            // if (currSource.path.includes("5")) {
            //     logDeep(allScopes);
            // }
            return concatScopes(allScopes);
        }
    );
};

type Stmt<T> = (item: T, source: TactSource) => WithLog<Scope>;

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
    // TODO
    return W.pureLog(emptyScope());
};

// set of definitions (transitively) from a source file
type Scope = {
    // global function definitions
    functions: Functions;
}
const emptyScope = (): Scope => ({
    functions: emptyFunctions()
});
// sequence multiple definition sets
const concatScopes = (globals: readonly Scope[]): WithLog<Scope> => {
    return W.reduceLog(globals, appendScopes, emptyScope());
};
// define global function
const defineFunction = (name: string, value: Ast.Function, via: V.ViaUser): Scope => {
    return {
        ...emptyScope(),
        functions: pureFunctions(name, value, via),
    };
};
// sequence two definition sets: define all the `right` after `left`
const appendScopes = (left: Scope, right: Scope): WithLog<Scope> => {
    return W.combineLog({
        functions: appendFunctions(left.functions, right.functions),
    });
};
// update all the `via` fields with information about new import
const updateVias = (globals: Scope, cb: (via: V.ViaUser) => V.ViaUser): Scope => {
    return {
        functions: mapViaFunctions(globals.functions, cb),
    };
};


const Fn = (xs: 1[], x: 1) => 1;
const TVar = (x: string) => 1 as const;
const String = 1;
const Void = 1;
const Int = 1;
const Bool = 1;
const Address = 1;
const Cell = 1;
const Null = 1;
const Slice = 1;

const builtinFunctions = new Map([
    ["dump", Fn([TVar("T")], Void)],
    ["ton", Fn([String], Int)],
    ["require", Fn([Bool, String], Void)],
    ["address", Fn([String], Address)],
    ["cell", Fn([String], Cell)],
    ["dumpStack", Fn([], Void)],
    ["emptyMap", Fn([], Null)],
    // ["sha256", Overload([
    //     Fn([String], Int),
    //     Fn([Slice], Int),
    // ])],
    ["slice", Fn([String], Slice)],
    ["rawSlice", Fn([String], Slice)],
    ["ascii", Fn([String], Int)],
    ["crc32", Fn([String], Int)],
]);
type Functions = undefined | ReadonlyMap<string, {
    // the definition
    readonly value: Ast.Function;
    // where it was defined
    readonly via: V.ViaUser;
}>;
const emptyFunctions = (): Functions => undefined;
const pureFunctions = (name: string, value: Ast.Function, via: V.ViaUser): Functions => {
    // if (name === 'foo') debugger;
    return new Map([[name, { value, via }]]);
};
const mapViaFunctions = (fns: Functions, cb: (via: V.ViaUser) => V.ViaUser): Functions => {
    if (!fns) return;
    return new Map(fns.entries().map(([k, v]) => {
        return [k, { value: v.value, via: cb(v.via) }];
    }));
};
const appendFunctions = (prev: Functions, next: Functions): WithLog<Functions> => {
    if (!prev || !next) return W.pureLog(next);
    const value = new Map(prev.entries());
    const errors: TcError[] = [];
    for (const [name, nextItem] of next) {
        const prevItem = value.get(name);
        // defined in compiler
        if (builtinFunctions.has(name)) {
            errors.push(ERedefineFn(name, V.ViaBuiltin(), nextItem.via));
            continue;
        }
        // not defined yet; define it now
        if (typeof prevItem === 'undefined') {
            value.set(name, nextItem);
            continue;
        }
        // already defined, and it's not a diamond situation
        if (prevItem.via.source !== nextItem.via.source) {
            errors.push(ERedefineFn(name, prevItem.via, nextItem.via));
        }
    }
    return W.makeLog(value, errors);
};


// typechecking errors
type WithLog<T> = W.Writer<TcError, T>;
export const ERedefineFn = (name: string, prev: V.Via, next: V.ViaUser): TcError => ({
    loc: viaToRange(next),
    descr: [
        TEText(`There already is a function "${name}" from`),
        TEVia(prev),
    ],
});


// error DSL
type TcError = {
    // location where IDE should show this error
    readonly loc: Ast.Range;
    // text description
    readonly descr: readonly TELine[];
}
type TELine = TEText | TEVia;
type TEText = {
    readonly kind: 'text';
    readonly text: string;
}
const TEText = (text: string): TEText => ({ kind: 'text', text });
type TEVia = {
    readonly kind: 'via';
    readonly via: V.Via;
}
const TEVia = (via: V.Via): TEVia => ({ kind: 'via', via });
const viaToRange = ({ imports, defLoc: definedAt }: V.ViaUser): Ast.Range => {
    const [head] = imports;
    if (typeof head === 'undefined') {
        return definedAt;
    }
    const { loc } = head;
    if (loc.kind === 'range') {
        return loc;
    }
    return throwInternal("Implicit import shadows something. Duplicates in stdlib?");
};
