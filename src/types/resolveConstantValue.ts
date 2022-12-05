import { ASTExpression, ASTTypeRef, throwError } from "../ast/ast";
import { printTypeRef, TypeRef } from "./types";

function resolveTypeRef(src: ASTTypeRef): TypeRef {
    if (src.optional) {
        return {
            kind: 'optional',
            inner: {
                kind: 'direct',
                name: src.name
            }
        };
    } else {
        return {
            kind: 'direct',
            name: src.name
        }
    }
}

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

export function resolveConstantValue(type: ASTTypeRef, ast: ASTExpression) {

    // Handle optional
    if (type.optional) {
        if (ast.kind === 'null') {
            return null;
        }
    }



    // Handle non-optionals
    if (type.name === 'Int') {
        return reduceInt(ast);
    }

    if (ast.kind === 'boolean') {
        if (type.name === 'Bool') {
            return ast.value;
        } else {
            throwError(`Expected Bool, got ${printTypeRef(resolveTypeRef(type))}`, ast.ref);
        }
    }

    throwError(`Expected constant value, got ${ast.kind}`, ast.ref);
}