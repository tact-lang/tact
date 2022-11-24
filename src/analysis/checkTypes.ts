import { ASTExpression, ASTNode, isExpression } from "../ast/ast";
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
        throw Error('Type already resolved');
    }
    return cache.get(id)!;
}

function resolveType(ctx: CompilerContext, s: ASTExpression) {
    if (s.kind === 'boolean') {
        markResolved(s.id, 'Boolean');
    } else if (s.kind === 'null') {
        throw Error('Unsupported');
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
        
    }
}

export function checkTypes(ctx: CompilerContext) {

    // Depth first search
    visit(ctx, {
        visit: (ctx, s) => { },
        visitEnd: (ctx, s) => {
            if (isExpression(s)) {
                resolveType(ctx, s);
            }
        }
    });
}