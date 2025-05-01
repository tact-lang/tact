import { entries, makeVisitor, memo } from "@/utils/tricks";
import type { Range } from "@/next/ast";
import type { Logger, SourceLogger } from "@/error/logger-util";
import type { TactImport, TactSource } from "@/next/imports/source";
import type * as Ast from "@/next/ast";
import { mapValues } from "@/utils/array";

const TcErrors = <M, R>(l: SourceLogger<M, R>) => ({
    // FIXME
    foo: () => (loc: Range) => {
        return l.at(loc).error(l.text`Bar`);
    },
    
    attrNotAllowed: (name: string) => (loc: Range) => {
        return l.at(loc).error(l.text`Attribute ${name} not allowed here`);
    },
    duplicateParam: () => (loc: Range) => {
        return l.at(loc).error(l.text`Duplicate parameter`);
    },
    duplicateDecl: () => (loc: Range) => {
        return l.at(loc).error(l.text`Duplicate declaration`);
    },
    duplicateImport: () => (loc: Range) => {
        return l.at(loc).error(l.text`Duplicate import`);
    },
    selfImport: () => (loc: Range) => {
        return l.at(loc).error(l.text`Cannot self-import`);
    },
    mutatesWithoutExtends: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`Only a method can be mutating. Did you forget "extends"?`,
            );
    },
    shadowsImported: (name: string, prevPath: string, prevRange: Range) => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Declaration of "${name}" shadows previous declaration "${l.locatedId(name, prevPath, prevRange)}"`);
    },
});

type TcErrors<M, R> = ReturnType<typeof TcErrors<M, R>>;

type SourceScope = Map<string, TactSource>

export const scope = (
    log: Logger<string, void>,
    root: TactSource,
) => {
    const rec = (source: TactSource): SourceScope => {
        const logger = log.source(source.path, source.code, (logger) => logger);
        const err = TcErrors(logger);
        // map with all the currently available functions in current source
        const functions: Map<string, {
            // source where function was originally defined
            readonly source: TactSource;
            // place where we complain about duplicate definition
            readonly place: TactImport | Ast.Id;
        }> = new Map();
        // for every import of current source
        for (const imp of source.imports) {
            if (imp.kind !== 'tact') {
                continue;
            }
            // get definitions along with the original source
            const s = memoedRec(imp.source);
            for (const [name, originalSource] of s) {
                const prev = functions.get(name);
                // prev.source -- original source of top import
                // prev.place.loc -- place to complain (second arg)
                // originalSource -- original source of bottom import
                // imp.loc -- place to complain (first arg)
                if (typeof prev === 'undefined') {
                    functions.set(name, {
                        source: originalSource,
                        place: imp,
                    });
                } else if (prev.source !== originalSource) {
                    err.shadowsImported(
                        name,
                        source.path,
                        prev.place.loc,
                    )(imp.loc);
                }
            }
        }
        for (const item of source.items) {
            if (item.kind === 'function') {
                const { text, loc } = item.name;
                const prev = functions.get(text);
                if (typeof prev === 'undefined') {
                    functions.set(text, {
                        source,
                        place: item.name,
                    });
                } else {
                    err.shadowsImported(
                        text,
                        source.path,
                        prev.place.loc,
                    )(loc);
                }
            }
        }
        return mapValues(functions, ({ source }) => source);
    };
    const memoedRec = memo(rec);
    memoedRec(root);
};

// const addId = (set: Set<string>, id: Ast.Id | Ast.TypeId, err: (loc: Range) => void) => {
//     if (set.has(id.text)) {
//         err(id.loc);
//     } else {
//         set.add(id.text);
//     }
// };

// type SourceScope = {
//     readonly functions: Map<string, Ast.Id>;
//     readonly constants: Set<string>;
//     readonly types: Set<string>;
//     readonly traits: Map<string, LocalScope>;
//     readonly contracts: Map<string, LocalScope>;
// }

// const mergeSourceScope = (scopes: SourceScope[]): SourceScope => {
//     const functions: Set<string> = new Set();
//     const constants: Set<string> = new Set();
//     const types: Set<string> = new Set();
//     const traits: Map<string, LocalScope> = new Map();
//     const contracts: Map<string, LocalScope> = new Map();
//     for (const scope of scopes) {
//         for (const fn of scope.functions) {
//             addId(functions, fn, () => {});
//         }
//     }
//     return {
//         functions,
//         constants,
//         types,
//         traits,
//         contracts,
//     };
// };

// type LocalScope = {
//     readonly constants: Set<string>;
//     readonly fields: Set<string>;
//     readonly methods: Set<string>;
// }

// const scopeAll = (root: TactSource) => {
//     const rec = (source: TactSource) => {
//         const scope = scopeSource(source);
//         const scopes: SourceScope[] = [];
//         for (const imp of source.imports) {
//             if (imp.kind === 'tact') {
//                 scopes.push(rec(imp.source));
//             }
//         }
//         return mergeSourceScope([scope, ]);
//     };
//     rec(root);
// };

// const scopeSource = (source: TactSource): SourceScope => {
//     const functions: Set<string> = new Set();
//     const constants: Set<string> = new Set();
//     const types: Set<string> = new Set();
//     const traits: Map<string, LocalScope> = new Map();
//     const contracts: Map<string, LocalScope> = new Map();

//     for (const item of source.items) {
//         switch (item.kind) {
//             case "function":
//                 addId(functions, item.name, () => {});
//                 continue;
//             case "extension":
//                 // ????
//                 continue;
//             case "constant":
//                 addId(constants, item.name, () => {});
//                 continue;
//             case "struct_decl":
//             case "message_decl":
//             case "union_decl":
//             case "alias_decl":
//                 addId(types, item.name, () => {});
//                 continue;
//             case "trait": {
//                 if (traits.has(item.name.text)) {
//                     // duplicate
//                 } else {
//                     traits.set(item.name.text, scopeLocal(item.declarations));
//                 }
//                 continue;
//             }
//             case "contract": {
//                 if (contracts.has(item.name.text)) {
//                     // duplicate
//                 } else {
//                     contracts.set(item.name.text, scopeLocal(item.declarations));
//                 }
//                 continue;
//             }
//         }
//     }

//     return {
//         functions,
//         constants,
//         types,
//         traits,
//         contracts,
//     };
// };

// export const scopeLocal = (declarations: readonly Ast.LocalItem[]): LocalScope => {
//     const constants: Set<string> = new Set();
//     const fields: Set<string> = new Set();
//     const methods: Set<string> = new Set();
//     for (const decl of declarations) {
//         switch (decl.kind) {
//             case "field_decl": {
//                 addId(fields, decl.name, () => {});
//                 continue;
//             }
//             case "method": {
//                 addId(methods, decl.fun.name, () => {});
//                 continue;
//             }
//             case "receiver": {
//                 // ???
//                 continue;
//             }
//             case "field_const": {
//                 addId(constants, decl.body.name, () => {});
//                 continue;
//             }
//         }
//     }
//     return {
//         constants,
//         fields,
//         methods,
//     };
// };

// export const typecheck = (log: Logger<string, void>, source: TactSource) => {
//     const logger = log.source(source.path, source.code, (logger) => logger);
//     const err = TcErrors(logger);

//     // get list of all imported tact sources
//     const sources: Set<TactSource> = new Set();
//     for (const imp of source.imports) {
//         if (imp.kind === "tact") {
//             sources.add(imp.source);
//         }
//     }

//     // combine all items from current source and imported sources
//     const importedItems = [...sources].flatMap((source) => source.items);

//     // check imported function shadowing
//     const importedFunctionNames: Set<string> = new Set();
//     for (const item of importedItems) {
//         if (item.kind === "function") {
//             const name = item.name.text;
//             if (importedFunctionNames.has(name)) {
//                 err.functionShadowsImported()(item.name.loc);
//             } else {
//                 importedFunctionNames.add(name);
//             }
//         }
//     }

//     for (const item of source.items) {
//         switch (item.kind) {
//             case "function": {
//                 const {
//                     body,
//                     name,
//                     params,
//                     returnType,
//                     typeParams
//                 } = item;
//             }
//             case "extension":
//             case "constant_def":
//             case "struct_decl":
//             case "message_decl":
//             case "union_decl":
//             case "alias_decl":
//             case "contract":
//             case "trait":
//         }
//     }

//     // Duplicate function definition
//     // (imports* AsmFunctionDef name) . size > 1

//     // Duplicate parameter
//     // asm fun f(x: Int, x: Foo) {}
//     // (Source AsmFunctionDef params name) . size > 1

//     // Type is not defined
//     // asm fun f(x: Nonexist) {}
//     // AsmFunctionDef (params type | retType) Type/TypeCons:
//     //   .name !in (imports* TypeDecl name | .typeParams)

//     // `F` expects 1 argument. Passed 2 arguments.
//     // struct F<T> {} asm fun f(x: F<Int, Int>) {}
//     // AsmFunctionDef (params type | retType) Type/TypeCons typeArgs length
//     //   != imports* TypeDecl typeParams length

//     // `F` type parameter is shadowing globally defined type
//     // struct F<T> {} asm fun f<F>(x: F) {}
//     // AsmFunctionDef typeParams name
//     //   in imports* TypeDecl name

//     // TypeDecl = StructDecl | MessageDecl | UnionDecl | AliasDecl | Contract | Trait

//     // Duplicate type parameter
//     // (Source AsmFunctionDef typeParams name) . size > 1

//     // Shuffle must be a permutation of all function parameters
//     // asm(c c) extends fun f(self: Builder, c: Cell?) {}
//     // AsmFunctionDef: (.shuffle args text).sort() = (.params name text).sort()

//     // extends fun попадают в скоуп self
//     // trait A { abstract fun f(): Int; }
//     // contract B {}
//     // override extends asm fun f(self: B): Int {}
// };
