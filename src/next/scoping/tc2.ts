import { entries, memo } from "@/utils/tricks";
import type { Logger, SourceLogger } from "@/error/logger-util";
import type { TactImport, TactSource } from "@/next/imports/source";
import type * as Ast from "@/next/ast";
import { mapValues } from "@/utils/array";
import type { Range } from "@/next/ast";

const TcErrors = <M, R>(l: SourceLogger<M, R>) => ({
    shadowsImported: (name: string, prevPath: string, prevRange: Range) => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Declaration of "${name}" shadows previous declaration "${l.locatedId(name, prevPath, prevRange)}"`);
    },
});

type TcErrors<M, R> = ReturnType<typeof TcErrors<M, R>>;

type Handler<T> = (children: [T, TactImport][], source: TactSource) => T

const combine = <O>(handlers: { [K in keyof O]: Handler<O[K]> }): Handler<O> => {
    return (children, source) => {
        const result = {} as O;
        for (const [key, handler] of entries(handlers)) {
            result[key] = handler(
                children.map(([o, imp]) => [o[key], imp] as const),
                source,
            );
        }
        return result;
    };
};

const foldSources = <T>(root: TactSource, onSource: Handler<T>): T => {
    const rec = (source: TactSource): T => {
        const children: [T, TactImport][] = [];
        for (const imp of source.imports) {
            if (imp.kind === 'tact') {
                children.push([memoedRec(imp.source), imp]);
            }
        }
        return onSource(children, source);
    };
    const memoedRec = memo(rec);
    return memoedRec(root);
};

const getFunctions = (source: TactSource) => {
    const ids: Ast.Id[] = [];
    for (const item of source.items) {
        if (item.kind === 'function') {
            ids.push(item.name);
        }
    }
    return ids;
};

const getConstants = (source: TactSource) => {
    const ids: Ast.Id[] = [];
    for (const item of source.items) {
        if (item.kind === 'constant') {
            ids.push(item.name);
        }
    }
    return ids;
};

const getTypes = (source: TactSource) => {
    const ids: Ast.TypeId[] = [];
    for (const item of source.items) {
        switch (item.kind) {
            case "function":
            case "extension":
            case "constant":
                continue;
            case "struct_decl":
            case "message_decl":
            case "union_decl":
            case "alias_decl":
            case "contract":
            case "trait":
                ids.push(item.name);
        }
    }
    return ids;
};

// const getExtensions = (source: TactSource) => {
//     const ids: Ast.Id[] = [];
//     for (const item of source.items) {
//         if (item.kind === 'extension') {
//             ids.push(item.method.fun.name);
//         }
//     }
//     return ids;
// };

export type ResolvedSource = {
    readonly path: string;
    readonly code: string;
    readonly imports: readonly ResolvedSource[];
    readonly functions: ReadonlyMap<string, Ast.Function>;
    readonly extensions: ReadonlyMap<string, Ast.Extension>;
    readonly constants: ReadonlyMap<string, Ast.Constant>;
    readonly types: ReadonlyMap<string, Ast.TypeDecl>;
};

const scopeIds = (
    log: Logger<string, void>, 
    getIds: (source: TactSource) => { text: string, loc: Ast.Range }[]
): Handler<Map<string, TactSource>> => (children, source) => {
    const err = log.source(source.path, source.code, (logger) => TcErrors(logger));
    const ids: Map<string, { readonly source: TactSource; readonly loc: Range; }> = new Map();
    const addId = (name: string, nextSource: TactSource, loc: Range) => {
        const prev = ids.get(name);
        if (typeof prev === 'undefined') {
            ids.set(name, { source: nextSource, loc });
        } else if (prev.source !== nextSource) {
            err.shadowsImported(name, source.path, prev.loc)(loc);
        }
    };
    for (const [sources, imp] of children) {
        for (const [name, source] of sources) {
            addId(name, source, imp.loc);
        }
    }
    for (const { text: name, loc } of getIds(source)) {
        addId(name, source, loc);
    }
    return mapValues(ids, ({ source }) => source);
};

export const scope = (
    log: Logger<string, void>,
    root: TactSource,
) => {
    return foldSources(root, combine({
        functions: scopeIds(log, getFunctions),
        constants: scopeIds(log, getConstants),
        types: scopeIds(log, getTypes),
    }));
};
