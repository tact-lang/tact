import { sha256_sync } from "@ton/crypto";
import { CompilerContext, createContextStore } from "../context";
import { AstNode, isRequire } from "../grammar/ast";
import { traverse } from "../grammar/iterators";
import { evalConstantExpression } from "../constEval";
import { throwInternalCompilerError } from "../errors";
import {
    getAllStaticFunctions,
    getAllTypes,
    getAllStaticConstants,
} from "./resolveDescriptors";

type Exception = { value: string; id: number };

const exceptions = createContextStore<Exception>();

function stringId(src: string): number {
    return sha256_sync(src).readUInt32BE(0);
}

function exceptionId(src: string): number {
    return (stringId(src) % 63000) + 1000;
}

function resolveStringsInAST(ast: AstNode, ctx: CompilerContext) {
    traverse(ast, (node) => {
        if (node.kind === "static_call" && isRequire(node.function)) {
            if (node.args.length !== 2) {
                return;
            }
            const resolved = evalConstantExpression(
                node.args[1]!,
                ctx,
            ) as string;
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

export function resolveErrors(ctx: CompilerContext) {
    // Process all static functions
    for (const f of getAllStaticFunctions(ctx)) {
        ctx = resolveStringsInAST(f.ast, ctx);
    }

    // Process all static constants
    for (const f of getAllStaticConstants(ctx)) {
        ctx = resolveStringsInAST(f.ast, ctx);
    }

    // Process all types
    for (const t of getAllTypes(ctx)) {
        // Process fields
        for (const f of t.fields) {
            ctx = resolveStringsInAST(f.ast, ctx);
        }

        // Process constants
        for (const f of t.constants) {
            ctx = resolveStringsInAST(f.ast, ctx);
        }

        // Process init
        if (t.init) {
            ctx = resolveStringsInAST(t.init.ast, ctx);
        }

        // Process receivers
        for (const f of t.receivers) {
            ctx = resolveStringsInAST(f.ast, ctx);
        }

        // Process functions
        for (const f of t.functions.values()) {
            ctx = resolveStringsInAST(f.ast, ctx);
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
