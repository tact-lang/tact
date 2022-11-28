import { ASTArgument, ASTExpression, isExpression } from "../ast/ast";
import { CompilerContext } from "../ast/context";
import { visit } from "../ast/visitor";

let cache = new Map<number, string>();

function markResolved(id: number, type: string) {
    if (cache.has(id)) {
        throw Error('Type already resolved');
    }
    cache.set(id, type);
}

function getType(id: number) {
    if (!cache.has(id)) {
        throw Error('Type not resolved');
    }
    return cache.get(id)!;
}

function resolveType(ctx: CompilerContext, s: ASTExpression | ASTArgument) {
    if (s.kind === 'boolean') {
        markResolved(s.id, 'Boolean');
    } else if (s.kind === 'op_binary') {
        let left = getType(s.left.id);
        let right = getType(s.right.id);
        if (left !== right) {
            throw Error(`Type mismatch: ${left} and ${right}`);
        }
        markResolved(s.id, left);
    } else if (s.kind === 'op_unary') {
        let right = getType(s.right.id);
        markResolved(s.id, right);
    } else if (s.kind === 'id') {
        let v = ctx.variables[s.value];
        if (!v) {
            throw Error(`Variable not found: ${s.value}`);
        }
        let vt = getType(v.node.id);
        markResolved(s.id, vt);
    } else if (s.kind === 'number') {
        markResolved(s.id, 'Int');
    } else if (s.kind === 'op_field') {
        let src = getType(s.src.id);
        let t = ctx.astTypes[src];
        if (t.kind === 'primitive') {
            markResolved(s.id, t.name);
        } else if (t.kind === 'def_struct') {
            markResolved(s.id, t.name);
        } else if (t.kind === 'def_contract') {
            markResolved(s.id, t.name);
        }
        // if (src !== 'String') {
        //     throw Error(`Unsupported type: ${src}`);
        // }
        // markResolved(s.id, 'String');
    } else if (s.kind === 'def_argument') {
        markResolved(s.id, s.type);
    }
}

export function checkTypes(ctx: CompilerContext) {

    // Depth first search
    visit(ctx, {
        visit: (ctx, s) => {
            if (s.kind === 'def_contract') {
                markResolved(s.id, s.name);
            }
        },
        visitEnd: (ctx, s) => {
            if (s.kind === 'def_argument') {
                resolveType(ctx, s);
            }
            if (isExpression(s)) {
                resolveType(ctx, s);
            }
        }
    });
}