import { sha256, sha256_sync } from "ton-crypto";
import { CompilerContext, createContextStore } from "../context";
import { ASTNode, ASTString, traverse } from "../grammar/ast";
import { getAllStaticFunctions, getAllTypes } from "./resolveDescriptors";

let store = createContextStore<{ value: string, id: number }>();

function stringId(src: ASTString): number {
    return sha256_sync(src.value).readUint32BE(0);
}

function resolveStringsInAST(ast: ASTNode, ctx: CompilerContext) {
    traverse(ast, (node) => {
        if (node.kind === 'string') {
            if (!store.get(ctx, node.value)) {
                let id = stringId(node);
                if (Object.values(store.all(ctx)).find((v) => v.id === id)) {
                    throw new Error(`Duplicate string id: ${node.value}`);
                }
                ctx = store.set(ctx, node.value, { value: node.value, id });
            }
        }
    })
    return ctx;
}

export function resolveStrings(ctx: CompilerContext) {

    // Process all static functions
    for (let f of Object.values(getAllStaticFunctions(ctx))) {
        ctx = resolveStringsInAST(f.ast, ctx);
    }

    // Process all types
    for (let t of Object.values(getAllTypes(ctx))) {

        // Process init
        if (t.init) {
            ctx = resolveStringsInAST(t.init.ast, ctx);
        }

        // Process receivers
        for (const f of Object.values(t.receivers)) {
            ctx = resolveStringsInAST(f.ast, ctx);
        }

        // Process functions
        for (let f of t.functions.values()) {
            ctx = resolveStringsInAST(f.ast, ctx);
        }
    }

    return ctx;
}

export function getAllStrings(ctx: CompilerContext) {
    return Object.values(store.all(ctx));
}

export function getStringId(value: string, ctx: CompilerContext) {
    let ex = store.get(ctx, value);
    if (!ex) {
        throw new Error(`String not found: ${value}`);
    }
    return ex.id;
}