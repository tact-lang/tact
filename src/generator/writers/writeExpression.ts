import { ABIFunctions, MapFunctions } from "../../abi/AbiFunction";
import { ASTExpression, throwError } from "../../ast/ast";
import { getExpType } from "../../types/resolveExpressionType";
import { getStaticFunction, getType } from "../../types/resolveTypeDescriptors";
import { printTypeRef } from "../../types/types";
import { WriterContext } from "../Writer";

function isNull(f: ASTExpression) {
    if (f.kind === 'null') {
        return true;
    }
    return false;
}

export function writeExpression(f: ASTExpression, ctx: WriterContext): string {

    //
    // Boolean
    //

    if (f.kind === 'boolean') {
        return f.value ? 'true' : 'false';
    }

    //
    // Number
    //

    if (f.kind === 'number') {
        return f.value.toString(10);
    }

    //
    // Null
    //

    if (f.kind === 'null') {
        return 'null()';
    }

    //
    // ID Reference
    //

    if (f.kind === 'id') {
        return f.value;
    }

    //
    // Binary operations: *, /, +, -, ||, &&, ==, !=, <, <=, >, >=
    // NOTE: We always wrap in parenthesis to avoid operator precedence issues
    //

    if (f.kind === 'op_binary') {

        // Special case for non-integer types
        if (f.op === '==' || f.op === '!=') {
            if (isNull(f.left) && isNull(f.right)) {
                if (f.op === '==') {
                    return 'true';
                } else {
                    return 'false';
                }
            } else if (isNull(f.left) && !isNull(f.right)) {
                if (f.op === '==') {
                    return `null?(${writeExpression(f.right, ctx)})`;
                } else {
                    return `(~ null?(${writeExpression(f.right, ctx)}))`;
                }
            } else if (!isNull(f.left) && isNull(f.right)) {
                if (f.op === '==') {
                    return `null?(${writeExpression(f.left, ctx)})`;
                } else {
                    return `(~ null?(${writeExpression(f.left, ctx)}))`;
                }
            }
        }

        let op: string;
        if (f.op === '*') {
            op = '*';
        } else if (f.op === '/') {
            op = '/';
        } else if (f.op === '+') {
            op = '+';
        } else if (f.op === '-') {
            op = '-';
        } else if (f.op === '==') {
            op = '==';
        } else if (f.op === '!=') {
            op = '!=';
        } else if (f.op === '<') {
            op = '<';
        } else if (f.op === '<=') {
            op = '<=';
        } else if (f.op === '>') {
            op = '>';
        } else if (f.op === '>=') {
            op = '>=';
        } else if (f.op === '||') {
            op = '|';
        } else if (f.op === '&&') {
            op = '&';
        } else {
            throwError('Unknown binary operator: ' + f.op, f.ref);
        }
        return '(' + writeExpression(f.left, ctx) + ' ' + op + ' ' + writeExpression(f.right, ctx) + ')';
    }

    //
    // Unary operations: !, -, +, !!
    // NOTE: We always wrap in parenthesis to avoid operator precedence issues
    //

    if (f.kind === 'op_unary') {

        // NOTE: Logical not is written as a bitwise not
        if (f.op === '!') {
            return '(~ ' + writeExpression(f.right, ctx) + ')';
        }

        if (f.op === '-') {
            return '(- ' + writeExpression(f.right, ctx) + ')';
        }

        if (f.op === '+') {
            return '(+ ' + writeExpression(f.right, ctx) + ')';
        }

        // NOTE: Assert function that ensures that the value is not null
        if (f.op === '!!') {
            ctx.used('__tact_not_null');
            return '__tact_not_null(' + writeExpression(f.right, ctx) + ')';
        }

        throwError('Unknown unary operator: ' + f.op, f.ref);
    }

    //
    // Field Access
    // NOTE: this branch resolves "a.b", where "a" is an expression and "b" is a field name
    //

    if (f.kind === 'op_field') {

        // Resolve the type of the expression
        let src = getExpType(ctx.ctx, f.src);
        if (src === null || src.kind !== 'ref' || src.optional) {
            throwError(`Cannot access field of non-struct type: ${printTypeRef(src)}`, f.ref);
        }
        let srcT = getType(ctx.ctx, src.name);

        // Resolve field
        let field = srcT.fields.find((v) => v.name === f.name)!;
        if (!field) {
            throwError(`Cannot find field "${f.name}" in struct "${srcT.name}"`, f.ref);
        }

        // Write getter
        return 'at(' + writeExpression(f.src, ctx) + ', ' + field.index + ')';
    }

    //
    // Static Function Call
    //

    if (f.kind === 'op_static_call') {
        let sf = getStaticFunction(ctx.ctx, f.name);
        let n = f.name;
        if (sf.ast.kind === 'def_native_function') {
            n = sf.ast.nativeName;
            if (n.startsWith('__tact')) {
                ctx.used(n);
            }
        } else {
            ctx.used(n);
        }
        return n + '(' + f.args.map((a) => writeExpression(a, ctx)).join(', ') + ')';
    }

    //
    // Struct Constructor
    //

    if (f.kind === 'op_new') {
        let src = getType(ctx.ctx, f.type);
        let expressions = src.fields.map((v) => {
            let arg = f.args.find((v2) => v2.name === v.name);
            if (arg) {
                return writeExpression(arg.exp, ctx);
            } else if (v.default !== undefined) {
                if (v.default === null) {
                    return 'null()';
                } else {
                    return v.default.toString();
                }
            } else {
                throwError(`Missing argument for field "${v.name}" in struct "${src.name}"`, f.ref);
            }
        }, ctx);
        ctx.used('__tact_to_tuple');
        return `__tact_to_tuple([${expressions.join(', ')}])`;
    }

    //
    // Object-based function call
    //

    if (f.kind === 'op_call') {

        // Resolve source type
        let src = getExpType(ctx.ctx, f.src);
        if (src === null) {
            throwError(`Cannot call function of non-direct type: ${printTypeRef(src)}`, f.ref);
        }

        // Reference type
        if (src.kind === 'ref') {

            if (src.optional) {
                throwError(`Cannot call function of non-direct type: ${printTypeRef(src)}`, f.ref);
            }

            // Check ABI
            if (src.name === '$ABI') {
                let abf = ABIFunctions[f.name];
                if (!abf) {
                    throwError(`ABI function "${f.name}" not found`, f.ref);
                }
                return abf.generate(ctx, f.args.map((v) => getExpType(ctx.ctx, v)), f.args.map((a) => writeExpression(a, ctx)), f.ref);
            }

            // Render function call
            ctx.used(`__gen_${src.name}_${f.name}`);
            let s = writeExpression(f.src, ctx);
            return `${s}~__gen_${src.name}_${f.name}(${[...f.args.map((a) => writeExpression(a, ctx))].join(', ')})`;
        }

        // Map types
        if (src.kind === 'map') {
            let abf = MapFunctions[f.name];
            if (!abf) {
                throwError(`Map function "${f.name}" not found`, f.ref);
            }
            return abf.generate(ctx, [src, ...f.args.map((v) => getExpType(ctx.ctx, v))], [writeExpression(f.src, ctx), ...f.args.map((a) => writeExpression(a, ctx))], f.ref);
        }

        throwError(`Cannot call function of non-direct type: ${printTypeRef(src)}`, f.ref);
    }

    //
    // Unreachable
    //

    throw Error('Unknown expression');
}