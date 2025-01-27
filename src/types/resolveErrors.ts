import { sha256_sync } from "@ton/crypto";
import { CompilerContext, createContextStore } from "../context/context";
import { AstNode } from "../ast/ast";
import { FactoryAst, isRequire } from "../ast/ast-helpers";
import { traverse } from "../ast/iterators";
import { evalConstantExpression } from "../optimizer/constEval";
import { throwInternalCompilerError } from "../error/errors";
import {
    getAllStaticFunctions,
    getAllTypes,
    getAllStaticConstants,
} from "./resolveDescriptors";
import { ensureSimplifiedString } from "../optimizer/interpreter";

type Exception = { value: string; id: number };

const exceptions = createContextStore<Exception>();

function stringId(src: string): number {
    return sha256_sync(src).readUInt32BE(0);
}

function exceptionId(src: string): number {
    return (stringId(src) % 63000) + 1000;
}

function resolveStringsInAST(
    ast: AstNode,
    ctx: CompilerContext,
    astF: FactoryAst,
) {
    traverse(ast, (node) => {
        if (node.kind === "static_call" && isRequire(node.function)) {
            if (node.args.length !== 2) {
                return;
            }
            const resolved = ensureSimplifiedString(
                evalConstantExpression(node.args[1]!, ctx, astF),
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

export function resolveErrors(ctx: CompilerContext, Ast: FactoryAst) {
    // Process all static functions
    for (const f of getAllStaticFunctions(ctx)) {
        ctx = resolveStringsInAST(f.ast, ctx, Ast);
    }

    // Process all static constants
    for (const f of getAllStaticConstants(ctx)) {
        ctx = resolveStringsInAST(f.ast, ctx, Ast);
    }

    // Process all types
    for (const t of getAllTypes(ctx)) {
        // Process fields
        for (const f of t.fields) {
            ctx = resolveStringsInAST(f.ast, ctx, Ast);
        }

        // Process constants
        for (const f of t.constants) {
            ctx = resolveStringsInAST(f.ast, ctx, Ast);
        }

        // Process init
        if (t.init) {
            ctx = resolveStringsInAST(t.init.ast, ctx, Ast);
        }

        // Process receivers
        for (const f of t.receivers) {
            ctx = resolveStringsInAST(f.ast, ctx, Ast);
        }

        // Process functions
        for (const f of t.functions.values()) {
            ctx = resolveStringsInAST(f.ast, ctx, Ast);
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
