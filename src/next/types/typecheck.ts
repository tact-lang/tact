/* eslint-disable @typescript-eslint/consistent-type-imports */
/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable require-yield */
// import { logDeep } from "@/utils/log-deep.build";
import * as Ast from "@/next/ast";
import { memo } from "@/utils/tricks";
import type {
    ResolvedImport,
    TactImport,
    TactSource,
} from "@/next/imports/source";
import { decodeTypeDecls } from "@/next/types/typedecl";
import { decodeFunctions } from "@/next/types/functions";
import { decodeConstants } from "@/next/types/constants";
import { decodeExtensions } from "@/next/types/extensions";

export const typecheck = (root: TactSource): [Ast.CSource, Ast.TcError[]] => {
    const allErrors: Ast.TcError[] = [];

    const recur = memo((source: TactSource): Ast.CSource => {
        const [value, errors] = Ast.runLog(
            tcSource(
                // leave only imports of .tact
                onlyTactImports(source.imports).map((importedBy) => ({
                    globals: recur(importedBy.source),
                    importedBy,
                })),
                source,
            ),
        );
        // `recur` is called only once on every source
        // this ensures errors from every source get counted
        // only once
        allErrors.push(...errors);
        return value;
    });

    return [recur(root), allErrors];
};

const onlyTactImports = (
    imports: readonly ResolvedImport[],
): readonly TactImport[] => {
    // typescript narrowing doesn't properly apply to filter,
    // so we need this helper
    const result: TactImport[] = [];
    for (const imp of imports) {
        if (imp.kind === "tact") {
            result.push(imp);
        }
    }
    return result;
};

function* tcSource(
    // list of import+source pairs for every of file's imports
    imported: readonly Ast.SourceCheckResult[],
    // source for current file
    source: TactSource,
): Ast.Log<Ast.CSource> {
    const Lazy = Ast.thunkBuilder;
    const scopeRef = () => scope;
    const scope: Ast.CSource = {
        typeDecls: yield* decodeTypeDecls(Lazy, imported, source, scopeRef),
        functions: yield* decodeFunctions(Lazy, imported, source, scopeRef),
        constants: yield* decodeConstants(Lazy, imported, source, scopeRef),
        extensions: decodeExtensions(Lazy, imported, source, scopeRef),
    };
    return scope;
}
