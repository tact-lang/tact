import { CompilerContext } from "../../src/context/context";
import {
    resolveExpression,
    getExpType,
} from "../../src/types/resolveExpression";
import type { StatementContext } from "../../src/types/resolveStatements";
import type { TypeRef } from "../../src/types/types";
import assert from "assert";

import { Expression, NonGenerativeExpressionParams } from "../src/generators";
import { Scope } from "../src/scope";
import { SUPPORTED_STDLIB_TYPES } from "../src/types";
import type { Type } from "../src/types";
import { createProperty, checkProperty } from "../src/util";
import { dummySrcInfoPrintable } from "../../src/grammar/src-info";

function emptyContext(): StatementContext {
    return {
        root: dummySrcInfoPrintable,
        returns: { kind: "void" },
        vars: new Map<string, TypeRef>(),
        requiredFields: [],
        funName: null,
    };
}

function setupContexts(): [CompilerContext, StatementContext] {
    const ctx: CompilerContext = new CompilerContext();
    const sctx = emptyContext();
    return [ctx, sctx];
}

describe("properties", () => {
    it("generates well-typed expressions", () => {
        const results = setupContexts();
        let compilerCtx = results[0];
        const stmtCtx = results[1];
        const globalScope = new Scope("program", undefined);
        for (const type of SUPPORTED_STDLIB_TYPES) {
            const ty: Type = { kind: "stdlib", type };
            // NOTE: This test checks only pure expressions, without introducing new
            // entries to any scopes.
            const exprGen = new Expression(
                globalScope,
                ty,
                NonGenerativeExpressionParams,
            ).generate();
            const property = createProperty(exprGen, (expr) => {
                compilerCtx = resolveExpression(expr, stmtCtx, compilerCtx);
                const resolvedTy = getExpType(compilerCtx, expr);
                if (resolvedTy.kind == "ref") {
                    assert.strictEqual(
                        resolvedTy.name,
                        ty.type,
                        `The resolved type ${resolvedTy.name} does not match the expected type ${ty.type}`,
                    );
                } else {
                    assert.fail(`Unexpected type: ${resolvedTy.kind}`);
                }
            });
            checkProperty(property);
        }
    });
});
