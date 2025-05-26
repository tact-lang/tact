/* eslint-disable @typescript-eslint/consistent-type-imports */
/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable require-yield */
// import { logDeep } from "@/utils/log-deep.build";
import * as E from "@/next/types/errors";
import * as Ast from "@/next/ast";
import { memo } from "@/utils/tricks";
import type { ResolvedImport, TactImport, TactSource } from "@/next/imports/source";
import { getDecodeType } from "@/next/types/types";
import { getAllAliases } from "@/next/types/aliases";
import { getAllFunctions } from "@/next/types/functions";
import { getAllConstants } from "@/next/types/constants";
import { getAllExtensions } from "@/next/types/extensions";
import { getTraitSigs } from "@/next/types/traits";

export const typecheck = (root: TactSource): [Ast.Scope, E.TcError[]] => {
    const allErrors: E.TcError[] = [];

    const recur = memo((source: TactSource): Ast.Scope => {
        const [value, errors] = E.runLog(tcSource(
            // leave only imports of .tact
            onlyTactImports(source.imports)
                .map(importedBy => ({
                    globals: recur(importedBy.source),
                    importedBy,
                })),
            source,
        ));
        // `recur` is called only once on every source
        // this ensures errors from every source get counted
        // only once
        allErrors.push(...errors);
        return value;
    });

    return [recur(root), allErrors];
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

function* tcSource(
    // list of import+source pairs for every of file's imports
    imported: readonly Ast.SourceCheckResult[],
    // source for current file
    source: TactSource,
): E.WithLog<Ast.Scope> {
    // kind-level descriptors for types
    const allSigs = yield* getDecodeType(
        imported,
        source,
    );
    // aliases can loop, have to check separately
    const allAliasSigs = yield* getAllAliases(
        allSigs,
        imported,
        source,
    );
    // get descriptors for functions
    const fnSigs = yield* getAllFunctions(
        imported,
        source,
        allSigs,
        allAliasSigs,
    );
    // get descriptors for extensions
    const extSigs = yield* getAllExtensions(
        imported,
        source,
        allSigs,
        allAliasSigs,
    );
    const traitSigs = yield* getTraitSigs(
        imported,
        source,
        allSigs,
        allAliasSigs,
    );
    // NB! we don't only check constants, but also get an
    //     expression checker out of it. constants might have no
    //     type annotation, and are required to check exprs
    const { constSigs, checkExpr } = yield* getAllConstants(
        imported,
        source,
        allSigs,
        allAliasSigs,
        fnSigs,
        extSigs,
        methodSigs,
    );



    // check aliases (no recursion)
    // scope extensions
    // check functions/extension/constant/method body
    // source.items.constants.map(node => checkConstant(node))
    // check type uses (all types should be defined)
    // check kinds (all uses of types are correct)
    // get() opcode
    // message opcode `Expression | undefined`, can only be done after types are checked
    // TODO: constant/function/extension loops

    return {
        fnSigs,
        typeDecls,
        constSigs,
        extSigs,
    };
}