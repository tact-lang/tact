import type { CompilerContext } from "@/context/context";
import { createContextStore } from "@/context/context";
import type { AstNode } from "@/ast/ast";
import type { FactoryAst } from "@/ast/ast-helpers";
import { isRequire } from "@/ast/ast-helpers";
import { traverse } from "@/ast/iterators";
import { evalConstantExpression } from "@/optimizer/constEval";
import {
    TactConstEvalError,
    throwCompilationError,
    throwInternalCompilerError,
} from "@/error/errors";
import {
    getAllStaticFunctions,
    getAllTypes,
    getAllStaticConstants,
} from "@/types/resolveDescriptors";
import type { AstUtil } from "@/ast/util";
import { getAstUtil } from "@/ast/util";
import { sha256, highest32ofSha256 } from "@/utils/sha256";
import { ensureString } from "@/optimizer/interpreter";
import type * as Ast from "@/ast/ast";

type Exception = { value: string; id: number };

const exceptions = createContextStore<Exception>();

function stringId(src: string): number {
    return Number(highest32ofSha256(sha256(src)));
}

function exceptionId(src: string): number {
    return (stringId(src) % 63000) + 1000;
}

function resolveStringsInAST(
    ast: AstNode,
    ctx: CompilerContext,
    util: AstUtil,
) {
    traverse(ast, (node) => {
        if (node.kind === "static_call" && isRequire(node.function)) {
            if (node.args.length !== 2) {
                return;
            }
            const resolved = ensureString(
                evaluateRequireErrorString(node.args[1]!, ctx, util),
            ).value;
            if (!exceptions.get(ctx, resolved)) {
                const id = exceptionId(resolved);
                if (
                    Array.from(exceptions.all(ctx).values()).find(
                        (v) => v.id === id,
                    )
                ) {
                    throwInternalCompilerError(
                        `Duplicate error id: "${resolved}"`,
                    );
                }
                ctx = exceptions.set(ctx, resolved, { value: resolved, id });
            }
        }
    });
    return ctx;
}

export function evaluateRequireErrorString(
    expr: Ast.Expression,
    ctx: CompilerContext,
    util: AstUtil,
) {
    try {
        return evalConstantExpression(expr, ctx, util);
    } catch (e) {
        if (e instanceof TactConstEvalError) {
            throwCompilationError(
                `The second parameter of "require()" must be evaluated at compile time`,
                expr.loc,
            );
        }
        throw e;
    }
}

export function resolveErrors(ctx: CompilerContext, Ast: FactoryAst) {
    const util = getAstUtil(Ast);

    // Process all static functions
    for (const f of getAllStaticFunctions(ctx)) {
        ctx = resolveStringsInAST(f.ast, ctx, util);
    }

    // Process all static constants
    for (const f of getAllStaticConstants(ctx)) {
        ctx = resolveStringsInAST(f.ast, ctx, util);
    }

    // Process all types
    for (const t of getAllTypes(ctx)) {
        // Process fields
        for (const f of t.fields) {
            ctx = resolveStringsInAST(f.ast, ctx, util);
        }

        // Process constants
        for (const f of t.constants) {
            ctx = resolveStringsInAST(f.ast, ctx, util);
        }

        // Process init
        if (t.init) {
            ctx = resolveStringsInAST(t.init.ast, ctx, util);
        }

        // Process receivers
        for (const f of t.receivers) {
            ctx = resolveStringsInAST(f.ast, ctx, util);
        }

        // Process functions
        for (const f of t.functions.values()) {
            ctx = resolveStringsInAST(f.ast, ctx, util);
        }
    }

    return ctx;
}

export function getAllErrors(ctx: CompilerContext): Exception[] {
    return Array.from(exceptions.all(ctx).values());
}

export function getErrorId(value: string, ctx: CompilerContext) {
    const ex = exceptions.get(ctx, value);
    if (!ex) {
        throwInternalCompilerError(`Error not found: ${value}`);
    }
    return ex.id;
}
