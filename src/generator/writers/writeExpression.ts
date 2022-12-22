import { abi } from "../../abi/abi";
import { ASTExpression, throwError } from "../../grammar/ast";
import { getExpType } from "../../types/resolveExpression";
import { getStaticConstant, getStaticFunction, getType, hasStaticConstant } from "../../types/resolveDescriptors";
import { printTypeRef } from "../../types/types";
import { WriterContext } from "../Writer";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";
import { MapFunctions } from "../../abi/map";
import { GlobalFunctions } from "../../abi/global";
import { getStringId } from "../../types/resolveStrings";
import { id } from "./id";

function isNull(f: ASTExpression) {
    if (f.kind === 'null') {
        return true;
    }
    return false;
}

function tryExtractPath(f: ASTExpression): string[] | null {
    if (f.kind === 'id') {
        return [f.value];
    }
    if (f.kind === 'op_field') {
        let p = tryExtractPath(f.src);
        if (p) {
            return [...p, f.name];
        } else {
            return null;
        }
    }
    return null;
}

export function writeValue(s: bigint | string | boolean | null, ctx: WriterContext): string {
    if (typeof s === 'bigint') {
        return s.toString(10);
    }
    if (typeof s === 'string') {
        let id = getStringId(s, ctx.ctx);
        ctx.used(`__gen_str_${id}`);
        return `__gen_str_${id}()`;
    }
    if (typeof s === 'boolean') {
        return s ? 'true' : 'false';
    }
    if (s === null) {
        return 'null()';
    }
    throw Error('Invalid value');
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
    // String literal
    //

    if (f.kind === 'string') {
        let id = getStringId(f.value, ctx.ctx);
        ctx.used(`__gen_str_${id}`);
        return `__gen_str_${id}()`;
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
        let t = getExpType(ctx.ctx, f);

        // Handle packed type
        if (t.kind === 'ref') {
            let tt = getType(ctx.ctx, t.name);
            if (tt.kind === 'contract' || tt.kind === 'struct') {
                return resolveFuncTypeUnpack(t, id(f.value), ctx);
            }
        }

        // Handle constant
        if (hasStaticConstant(ctx.ctx, f.value)) {
            let c = getStaticConstant(ctx.ctx, f.value);
            return writeValue(c.value, ctx);
        }

        return id(f.value);
    }

    //
    // Binary operations: *, /, +, -, ||, &&, ==, !=, <, <=, >, >=
    // NOTE: We always wrap in parenthesis to avoid operator precedence issues
    //

    if (f.kind === 'op_binary') {

        // Special case for non-integer types and nullable
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

        // Special case for address
        let lt = getExpType(ctx.ctx, f.left);
        let rt = getExpType(ctx.ctx, f.right);
        if (lt.kind === 'ref' && rt.kind === 'ref' && lt.name === 'Address' && rt.name === 'Address') {
            if (f.op === '==') {
                ctx.used(`__tact_address_eq`);
                return (`__tact_address_eq(${writeExpression(f.left, ctx)}, ${writeExpression(f.right, ctx)})`);
            } else if (f.op === '!=') {
                ctx.used(`__tact_address_neq`);
                return (`__tact_address_neq(${writeExpression(f.left, ctx)}, ${writeExpression(f.right, ctx)})`);
            } else {
                throwError('Cannot use ' + f.op + ' on addresses', f.ref);
            }
        }
        if (lt.kind === 'map' && rt.kind === 'map') {
            if (f.op === '==') {
                ctx.used(`__tact_cell_eq`);
                return (`__tact_cell_eq(${writeExpression(f.left, ctx)}, ${writeExpression(f.right, ctx)})`);
            } else if (f.op === '!=') {
                ctx.used(`__tact_cell_eq`);
                return (`__tact_cell_neq(${writeExpression(f.left, ctx)}, ${writeExpression(f.right, ctx)})`);
            } else {
                throwError('Cannot use ' + f.op + ' on maps', f.ref);
            }
        }

        let op: string;
        if (f.op === '*') {
            op = '*';
        } else if (f.op === '/') {
            op = '/';
        } else if (f.op === '%') {
            op = '%';
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
        } else if (f.op === '<<') {
            op = '<<';
        } else if (f.op === '>>') {
            op = '>>';
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
            let t = getExpType(ctx.ctx, f.right);
            if (t.kind === 'ref') {
                let tt = getType(ctx.ctx, t.name);
                if (tt.kind === 'struct') {
                    ctx.used(`__gen_${tt.name}_not_null`);
                    return `__gen_${tt.name}_not_null(${writeExpression(f.right, ctx)})`;
                }
            }

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
        let cst = srcT.constants.find((v) => v.name === f.name)!;
        if (!field && !cst) {
            throwError(`Cannot find field "${f.name}" in struct "${srcT.name}"`, f.ref);
        }

        if (field) {

            // Trying to resolve field as a path
            let path = tryExtractPath(f);
            if (path) {

                // Prepare path
                let convertedPath: string[] = [];
                convertedPath.push(id(path[0]));
                convertedPath.push(...path.slice(1));
                let idd = convertedPath.join(`'`);

                // Special case for structs
                if (field.type.kind === 'ref') {
                    let ft = getType(ctx.ctx, field.type.name);
                    if (ft.kind === 'struct' || ft.kind === 'contract') {
                        return resolveFuncTypeUnpack(field.type, idd, ctx);
                    }
                }

                return idd;
            }

            // Getter instead of direct field access
            ctx.used(`__gen_${srcT.name}_get_${field.name}`);
            return `__gen_${srcT.name}_get_${field.name}(${writeExpression(f.src, ctx)})`;
        } else {
            return writeValue(cst.value, ctx);
        }
    }

    //
    // Static Function Call
    //

    if (f.kind === 'op_static_call') {

        // Check global functions
        if (GlobalFunctions[f.name]) {
            return GlobalFunctions[f.name].generate(ctx,
                f.args.map((v) => getExpType(ctx.ctx, v)),
                f.args,
                f.ref);
        }

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
                return writeValue(v.default, ctx);
            } else {
                throwError(`Missing argument for field "${v.name}" in struct "${src.name}"`, f.ref);
            }
        }, ctx);
        return `(${expressions.join(', ')})`;
    }

    //
    // Object-based function call
    //

    if (f.kind === 'op_call') {

        // Resolve source type
        let src = getExpType(ctx.ctx, f.src);
        if (src === null) {
            throwError(`Cannot call function of non - direct type: ${printTypeRef(src)} `, f.ref);
        }

        // Reference type
        if (src.kind === 'ref') {

            if (src.optional) {
                throwError(`Cannot call function of non - direct type: ${printTypeRef(src)} `, f.ref);
            }

            // Check ABI
            if (src.name === '$ABI') {
                let abf = abi[f.name];
                if (!abf) {
                    throwError(`ABI function "${f.name}" not found`, f.ref);
                }
                return abf.generate(ctx, f.args.map((v) => getExpType(ctx.ctx, v)), f.args, f.ref);
            }

            // Render function call
            let t = getType(ctx.ctx, src.name);
            let ff = t.functions.get(f.name)!;

            // Resolve name
            let name = `__gen_${src.name}_${f.name}`;
            if (ff.ast.kind === 'def_function') {
                ctx.used(name);
            } else {
                name = ff.ast.nativeName;
                if (name.startsWith('__tact')) {
                    ctx.used(name);
                }
            }

            // Render
            if (ff.isMutating) {
                let s = writeExpression(f.src, ctx);
                if (f.args.length === 1) {
                    let t = getExpType(ctx.ctx, f.args[0]);
                    if (t.kind === 'ref') {
                        let tt = getType(ctx.ctx, t.name);
                        if (tt.kind === 'contract' || tt.kind === 'struct') {
                            ctx.used(`__gen_${tt.name}_unpack`);
                            return `${s}~${name}(__gen_${tt.name}_unpack(${writeExpression(f.args[0], ctx)}))`;
                        }
                    }
                }
                return `${s}~${name}(${[...f.args.map((a) => writeExpression(a, ctx))].join(', ')})`;
            } else {
                let s = writeExpression(f.src, ctx);
                return `${name}(${[s, ...f.args.map((a) => writeExpression(a, ctx))].join(', ')})`;
            }
        }

        // Map types
        if (src.kind === 'map') {
            let abf = MapFunctions[f.name];
            if (!abf) {
                throwError(`Map function "${f.name}" not found`, f.ref);
            }
            return abf.generate(ctx, [src, ...f.args.map((v) => getExpType(ctx.ctx, v))], [f.src, ...f.args], f.ref);
        }

        throwError(`Cannot call function of non - direct type: ${printTypeRef(src)} `, f.ref);
    }

    //
    // Init of
    //

    if (f.kind === 'init_of') {
        ctx.used(`__gen_${f.name}_init_child`);
        ctx.used(`__tact_context`);
        return `__gen_${f.name}_init_child(${['__tact_context_sys', ...f.args.map((a) => writeExpression(a, ctx))].join(', ')})`;
    }

    //
    // Unreachable
    //

    throw Error('Unknown expression');
}