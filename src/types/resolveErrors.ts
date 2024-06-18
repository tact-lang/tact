import { sha256_sync } from "@ton/crypto";
import { CompilerContext, createContextStore } from "../context";
import { ASTNode, traverse } from "../grammar/ast";
import { evalConstantExpression } from "../constEval";
import {
    getAllStaticConstants,
    getAllStaticFunctions,
    getAllTypes,
} from "./resolveDescriptors";

const exceptions = createContextStore<{ value: string; id: number }>();

function stringId(src: string): number {
    return sha256_sync(src).readUInt32BE(0);
}

function exceptionId(src: string): number {
    return (stringId(src) % 63000) + 1000;
}

function resolveStringsInAST(ast: ASTNode, ctx: CompilerContext) {
    traverse(ast, (node) => {
        if (node.kind === "op_static_call" && node.name === "require") {
            if (node.args.length !== 2) {
                return;
            }
            const resolved = evalConstantExpression(
                node.args[1],
                ctx,
            ) as string;
            if (!exceptions.get(ctx, resolved)) {
                const id = exceptionId(resolved);
                if (
                    Object.values(exceptions.all(ctx)).find((v) => v.id === id)
                ) {
                    throw new Error(`Duplicate error id: "${resolved}"`);
                }
                ctx = exceptions.set(ctx, resolved, { value: resolved, id });
            }
        }
    });
    return ctx;
}

export function resolveErrors(ctx: CompilerContext) {
    // Process all static functions
    for (const f of Object.values(getAllStaticFunctions(ctx))) {
        ctx = resolveStringsInAST(f.ast, ctx);
    }

    // Process all static constants
    for (const f of Object.values(getAllStaticConstants(ctx))) {
        ctx = resolveStringsInAST(f.ast, ctx);
    }

    // Process all types
    for (const t of Object.values(getAllTypes(ctx))) {
        // Process fields
        for (const f of Object.values(t.fields)) {
            ctx = resolveStringsInAST(f.ast, ctx);
        }

        // Process constants
        for (const f of Object.values(t.constants)) {
            ctx = resolveStringsInAST(f.ast, ctx);
        }

        // Process init
        if (t.init) {
            ctx = resolveStringsInAST(t.init.ast, ctx);
        }

        // Process receivers
        for (const f of Object.values(t.receivers)) {
            ctx = resolveStringsInAST(f.ast, ctx);
        }

        // Process functions
        for (const f of t.functions.values()) {
            ctx = resolveStringsInAST(f.ast, ctx);
        }
    }

    return ctx;
}

export function getAllErrors(ctx: CompilerContext) {
    return Object.values(exceptions.all(ctx));
}

export function getErrorId(value: string, ctx: CompilerContext) {
    const ex = exceptions.get(ctx, value);
    if (!ex) {
        throw new Error(`Error not found: ${value}`);
    }
    return ex.id;
}
