import { sha256_sync } from "@ton/crypto";
import { CompilerContext, createContextStore } from "../context";
import { AstNode, isRequire } from "../grammar/ast";
import { traverse } from "../grammar/iterators";
import { evalConstantExpression } from "../constEval";
import {
    getAllStaticConstants,
    getAllStaticFunctions,
    getAllTypes,
} from "./resolveDescriptors";

const exceptions = createContextStore<Set<{ value: string; id: number }>>();
const exceptionIds = createContextStore<{ value: string; id: number }>();

function stringId(src: string): number {
    return sha256_sync(src).readUInt32BE(0);
}

export function exceptionId(src: string): number {
    return (stringId(src) % 63000) + 1000;
}

function resolveStringsInAST(ast: AstNode, ctx: CompilerContext, name: string) {
    traverse(ast, (node) => {
        if (node.kind === "static_call" && isRequire(node.function)) {
            if (node.args.length !== 2) {
                return;
            }

            const resolved = evalConstantExpression(
                node.args[1]!,
                ctx,
            ) as string;
            const id = exceptionId(resolved);

            if (
                !exceptionIds.get(ctx, resolved) &&
                Object.values(exceptionIds.all(ctx)).find((v) => v.id === id)
            ) {
                throw new Error(`Duplicate error id: "${resolved}"`);
            }
            ctx = exceptionIds.set(ctx, resolved, { value: resolved, id });

            ctx = exceptions.set(
                ctx,
                name,
                new Set([
                    ...(exceptions.get(ctx, name) ?? []),
                    { value: resolved, id },
                ]),
            );
        } else if (node.kind === "static_call") {
            const functionExceptions = exceptions.get(ctx, node.function.text);
            if (functionExceptions) {
                ctx = exceptions.set(
                    ctx,
                    name,
                    new Set([
                        ...(exceptions.get(ctx, name) ?? []),
                        ...functionExceptions,
                    ]),
                );
            }
        }
    });
    return ctx;
}

export function resolveErrors(ctx: CompilerContext) {
    // Process all static functions
    for (const f of Object.values(getAllStaticFunctions(ctx))) {
        ctx = resolveStringsInAST(f.ast, ctx, f.name);
    }

    // Process all static constants
    for (const f of Object.values(getAllStaticConstants(ctx))) {
        ctx = resolveStringsInAST(f.ast, ctx, f.name);
    }

    // Process all types
    for (const t of Object.values(getAllTypes(ctx))) {
        // Process fields
        for (const f of Object.values(t.fields)) {
            ctx = resolveStringsInAST(f.ast, ctx, t.name);
        }

        // Process constants
        for (const f of Object.values(t.constants)) {
            ctx = resolveStringsInAST(f.ast, ctx, t.name);
        }

        // Process init
        if (t.init) {
            ctx = resolveStringsInAST(t.init.ast, ctx, t.name);
        }

        // Process receivers
        for (const f of Object.values(t.receivers)) {
            ctx = resolveStringsInAST(f.ast, ctx, t.name);
        }

        // Process functions
        for (const f of t.functions.values()) {
            ctx = resolveStringsInAST(f.ast, ctx, t.name);
        }
    }

    return ctx;
}

export function getErrors(ctx: CompilerContext, name: string) {
    return exceptions.get(ctx, name) ?? new Set();
}

export function getErrorId(value: string, ctx: CompilerContext) {
    const ex = exceptionIds.get(ctx, value);
    if (!ex) {
        throw new Error(`Error not found: ${value}`);
    }
    return ex.id;
}
