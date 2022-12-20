import { CompilerContext, createContextStore } from "../context";
import { ASTNode, traverse } from "../grammar/ast";
import { getAllStaticFunctions, getAllTypes } from "./resolveDescriptors";

let store = createContextStore<{ value: string, id: number }>();

function resolveStringsInAST(ast: ASTNode, ctx: CompilerContext) {
    traverse(ast, (node) => {
        if (node.kind === 'string') {
            if (!store.get(ctx, node.value)) {
                ctx = store.set(ctx, node.value, { value: node.value, id: node.id });
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
        for (let f of Object.values(t.functions)) {
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