import { ASTExpression, throwError } from "../grammar/ast";
import { printTypeRef, TypeRef } from "./types";

function reduceInt(ast: ASTExpression): bigint {
    if (ast.kind === 'number') {
        return ast.value;
    } else if (ast.kind === 'op_binary') {
        let l = reduceInt(ast.left);
        let r = reduceInt(ast.right);
        if (ast.op === '+') {
            return l + r;
        } else if (ast.op === '-') {
            return l - r;
        } else if (ast.op === '*') {
            return l * r;
        } else if (ast.op === '/') {
            return l / r;
        } else if (ast.op === '%') {
            return l % r;
        }
    } else if (ast.kind === 'op_unary') {
        if (ast.op === '-') {
            return -reduceInt(ast.right);
        } else if (ast.op === '+') {
            return reduceInt(ast.right);
        }
    }
    throwError('Cannot reduce expression to integer', ast.ref);
}

function reduceBool(ast: ASTExpression): boolean {
    if (ast.kind === 'boolean') {
        return ast.value;
    }
    if (ast.kind === 'op_unary') {
        if (ast.op === '!') {
            return !reduceBool(ast.right);
        }
    }
    if (ast.kind === 'op_binary') {
        if (ast.op === '&&') {
            return reduceBool(ast.left) && reduceBool(ast.right);
        } else if (ast.op === '||') {
            return reduceBool(ast.left) || reduceBool(ast.right);
        }
        // TODO: More cases
    }

    throwError('Cannot reduce expression to boolean', ast.ref);
}

function reduceString(ast: ASTExpression): string {
    if (ast.kind === 'string') {
        return ast.value;
    }
    throwError('Cannot reduce expression to string', ast.ref);
}

export function resolveConstantValue(type: TypeRef, ast: ASTExpression) {

    if (type.kind !== 'ref') {
        throwError(`Expected constant value, got ${printTypeRef(type)}`, ast.ref);
    }

    // Handle optional
    if (type.optional) {
        if (ast.kind === 'null') {
            return null;
        }
    }

    // Handle int
    if (type.name === 'Int') {
        return reduceInt(ast);
    }

    // Handle bool
    if (type.name === 'Bool') {
        return reduceBool(ast);
    }

    // Handle string
    if (type.name === 'String') {
        return reduceString(ast);
    }

    throwError(`Expected constant value, got ${printTypeRef(type)}`, ast.ref);
}