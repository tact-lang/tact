import { ASTExpression, throwError } from "../../grammar/ast";
import { getExpType } from "../../types/resolveExpression";
import { getStaticConstant, getStaticFunction, getType, hasStaticConstant } from "../../types/resolveDescriptors";
import { FieldDescription, printTypeRef, TypeDescription } from "../../types/types";
import { WriterContext } from "../Writer";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";
import { MapFunctions } from "../../abi/map";
import { GlobalFunctions } from "../../abi/global";
import { id } from "./id";
import { StructFunctions } from "../../abi/struct";
import { resolveFuncType } from "./resolveFuncType";
import { Address, Cell } from "@ton/core";
import { writeAddress, writeCell, writeString } from "./writeConstant";
import { ops } from "./ops";
import { tryExpressionIntrinsics } from "../intrinsics/tryExpressionIntrinsics";
import { writeCastedExpression } from "./writeFunction";

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
        const p = tryExtractPath(f.src);
        if (p) {
            return [...p, f.name];
        } else {
            return null;
        }
    }
    return null;
}

function writeStructConstructor(type: TypeDescription, args: string[], ctx: WriterContext) {

    // Check for duplicates
    const name = ops.typeContsturctor(type.name, args, ctx);
    const renderKey = '$constructor$' + type.name + '$' + args.join(',');
    if (ctx.isRendered(renderKey)) {
        return name;
    }
    ctx.markRendered(renderKey);

    // Generate constructor
    ctx.fun(name, () => {
        const sig = `(${resolveFuncType(type, ctx)}) ${name}(${args.map((v) => resolveFuncType(type.fields.find((v2) => v2.name === v)!.type, ctx) + ' ' + v).join(', ')})`;
        ctx.signature(sig);
        ctx.flag('inline');
        ctx.context('type:' + type.name);
        ctx.body(() => {
            // Create expressions
            const expressions = type.fields.map((v) => {
                const arg = args.find((v2) => v2 === v.name);
                if (arg) {
                    return arg;
                } else if (v.default !== undefined) {
                    return writeValue(v.default, ctx);
                } else {
                    throw Error(`Missing argument for field "${v.name}" in struct "${type.name}"`); // Must not happen
                }
            }, ctx);

            ctx.append(`return (${expressions.join(', ')});`);
        });
    });
    return name;
}

export function writeValue(s: bigint | string | boolean | Address | Cell | null, ctx: WriterContext): string {
    if (typeof s === 'bigint') {
        return s.toString(10);
    }
    if (typeof s === 'string') {
        const id = writeString(s, ctx);
        ctx.used(id);
        return `${id}()`;
    }
    if (typeof s === 'boolean') {
        return s ? 'true' : 'false';
    }
    if (Address.isAddress(s)) {
        const res = writeAddress(s, ctx);
        ctx.used(res);
        return res + '()';
    }
    if (s instanceof Cell) {
        const res = writeCell(s, ctx);
        ctx.used(res);
        return `${res}()`;
    }
    if (s === null) {
        return 'null()';
    }
    throw Error('Invalid value');
}

export function writeExpression(f: ASTExpression, ctx: WriterContext): string {

    //
    // Try intrinsics
    //

    const intrinsic = tryExpressionIntrinsics(f, ctx);
    if (intrinsic) {
        return intrinsic;
    }

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
        const id = writeString(f.value, ctx);
        ctx.used(id);
        return `${id}()`;
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
        const t = getExpType(ctx.ctx, f);

        // Handle packed type
        if (t.kind === 'ref') {
            const tt = getType(ctx.ctx, t.name);
            if (tt.kind === 'contract' || tt.kind === 'struct') {
                return resolveFuncTypeUnpack(t, id(f.value), ctx);
            }
        }

        if (t.kind === 'ref_bounced') {
            const tt = getType(ctx.ctx, t.name);
            if (tt.kind === 'struct') {
                return resolveFuncTypeUnpack(t, id(f.value), ctx, false, true);
            }
        }

        // Handle constant
        if (hasStaticConstant(ctx.ctx, f.value)) {
            const c = getStaticConstant(ctx.ctx, f.value);
            return writeValue(c.value!, ctx);
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
        const lt = getExpType(ctx.ctx, f.left);
        const rt = getExpType(ctx.ctx, f.right);

        // Case for addresses equality
        if (
            lt.kind === 'ref' &&
            rt.kind === 'ref' &&
            lt.name === 'Address' &&
            rt.name === 'Address'
        ) {
            let prefix = '';
            if (f.op == '!=') {
                prefix = '~ ';
            }
            if (lt.optional && rt.optional) {
                ctx.used(`__tact_slice_eq_bits_nullable`);
                return `( ${prefix}__tact_slice_eq_bits_nullable(${writeExpression(f.left, ctx)}, ${writeExpression(f.right, ctx)}) )`;
            }
            if (lt.optional && !rt.optional) {
                ctx.used(`__tact_slice_eq_bits_nullable_one`);
                return `( ${prefix}__tact_slice_eq_bits_nullable_one(${writeExpression(f.left, ctx)}, ${writeExpression(f.right, ctx)}) )`;
            }
            if (!lt.optional && rt.optional) {
                ctx.used(`__tact_slice_eq_bits_nullable_one`);
                return `( ${prefix}__tact_slice_eq_bits_nullable_one(${writeExpression(f.right, ctx)}, ${writeExpression(f.left, ctx)}) )`;
            }
            ctx.used(`__tact_slice_eq_bits`);
            return `( ${prefix}__tact_slice_eq_bits(${writeExpression(f.right, ctx)}, ${writeExpression(f.left, ctx)}) )`;
        }

        // Case for cells eqality
        if (
            lt.kind === 'ref' &&
            rt.kind === 'ref' &&
            lt.name === 'Cell' &&
            rt.name === 'Cell'
        ) {
            const op = f.op === '==' ? 'eq' : 'neq';
            if (lt.optional && rt.optional) {
                ctx.used(`__tact_cell_${op}_nullable`);
                return `__tact_cell_${op}_nullable(${writeExpression(f.left, ctx)}, ${writeExpression(f.right, ctx)})`;
            }
            if (lt.optional && !rt.optional) {
                ctx.used(`__tact_cell_${op}_nullable_one`);
                return `__tact_cell_${op}_nullable_one(${writeExpression(f.left, ctx)}, ${writeExpression(f.right, ctx)})`;
            }
            if (!lt.optional && rt.optional) {
                ctx.used(`__tact_cell_${op}_nullable_one`);
                return `__tact_cell_${op}_nullable_one(${writeExpression(f.right, ctx)}, ${writeExpression(f.left, ctx)})`;
            }
            ctx.used(`__tact_cell_${op}`);
            return `__tact_cell_${op}(${writeExpression(f.right, ctx)}, ${writeExpression(f.left, ctx)})`;
        }

        // Case for slices and strings equality
        if (
            lt.kind === 'ref' &&
            rt.kind === 'ref' &&
            lt.name === rt.name &&
            (lt.name === 'Slice' || lt.name === 'String')
        ) {
            const op = f.op === '==' ? 'eq' : 'neq';
            if (lt.optional && rt.optional) {
                ctx.used(`__tact_slice_${op}_nullable`);
                return `__tact_slice_${op}_nullable(${writeExpression(f.left, ctx)}, ${writeExpression(f.right, ctx)})`;
            }
            if (lt.optional && !rt.optional) {
                ctx.used(`__tact_slice_${op}_nullable_one`);
                return `__tact_slice_${op}_nullable_one(${writeExpression(f.left, ctx)}, ${writeExpression(f.right, ctx)})`;
            }
            if (!lt.optional && rt.optional) {
                ctx.used(`__tact_slice_${op}_nullable_one`);
                return `__tact_slice_${op}_nullable_one(${writeExpression(f.right, ctx)}, ${writeExpression(f.left, ctx)})`;
            }
            ctx.used(`__tact_slice_${op}`);
            return `__tact_slice_${op}(${writeExpression(f.right, ctx)}, ${writeExpression(f.left, ctx)})`;
        }

        // Case for maps eqality
        if (lt.kind === 'map' && rt.kind === 'map') {
            const op = f.op === '==' ? 'eq' : 'neq';
            ctx.used(`__tact_cell_${op}_nullable`);
            return `__tact_cell_${op}_nullable(${writeExpression(f.left, ctx)}, ${writeExpression(f.right, ctx)})`;
        }

        // Check for int or boolean types
        if (lt.kind !== 'ref'
            || rt.kind !== 'ref'
            || (lt.name !== 'Int' && lt.name !== 'Bool')
            || (rt.name !== 'Int' && rt.name !== 'Bool')
        ) {
            const file = f.ref.file;
            const loc_info = f.ref.interval.getLineAndColumn();
            throw Error(`(Internal Compiler Error) Invalid types for binary operation: ${file}:${loc_info.lineNum}:${loc_info.colNum}`); // Should be unreachable
        }

        // Case for ints equality
        if (f.op === '==' || f.op === '!=') {
            const op = f.op === '==' ? 'eq' : 'neq';
            if (lt.optional && rt.optional) {
                ctx.used(`__tact_int_${op}_nullable`);
                return `__tact_int_${op}_nullable(${writeExpression(f.left, ctx)}, ${writeExpression(f.right, ctx)})`;
            }
            if (lt.optional && !rt.optional) {
                ctx.used(`__tact_int_${op}_nullable_one`);
                return `__tact_int_${op}_nullable_one(${writeExpression(f.left, ctx)}, ${writeExpression(f.right, ctx)})`;
            }
            if (!lt.optional && rt.optional) {
                ctx.used(`__tact_int_${op}_nullable_one`);
                return `__tact_int_${op}_nullable_one(${writeExpression(f.right, ctx)}, ${writeExpression(f.left, ctx)})`;
            }
            if (f.op === '==') {
                return `(${writeExpression(f.left, ctx)} == ${writeExpression(f.right, ctx)})`;
            } else {
                return `(${writeExpression(f.left, ctx)} != ${writeExpression(f.right, ctx)})`;
            }
        }

        // Case for "&&" operator
        if (f.op === '&&') {
            return `( (${writeExpression(f.left, ctx)}) ? (${writeExpression(f.right, ctx)}) : (false) )`;
        }

        // Case for "||" operator
        if (f.op === '||') {
            return `( (${writeExpression(f.left, ctx)}) ? (true) : (${writeExpression(f.right, ctx)}) )`;
        }

        // Other ops
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
        } else if (f.op === '<') {
            op = '<';
        } else if (f.op === '<=') {
            op = '<=';
        } else if (f.op === '>') {
            op = '>';
        } else if (f.op === '>=') {
            op = '>=';
        } else if (f.op === '<<') {
            op = '<<';
        } else if (f.op === '>>') {
            op = '>>';
        } else if (f.op === '&') {
            op = '&';
        } else if (f.op === '|') {
            op = '|';
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
            const t = getExpType(ctx.ctx, f.right);
            if (t.kind === 'ref') {
                const tt = getType(ctx.ctx, t.name);
                if (tt.kind === 'struct') {
                    return `${ops.typeNotNull(tt.name, ctx)}(${writeExpression(f.right, ctx)})`;
                }
            }

            ctx.used('__tact_not_null');
            return `${ctx.used('__tact_not_null')}(${writeExpression(f.right, ctx)})`;
        }

        throwError('Unknown unary operator: ' + f.op, f.ref);
    }

    //
    // Field Access
    // NOTE: this branch resolves "a.b", where "a" is an expression and "b" is a field name
    //

    if (f.kind === 'op_field') {

        // Resolve the type of the expression
        const src = getExpType(ctx.ctx, f.src);
        if (src === null || ((src.kind !== 'ref' || src.optional) && (src.kind !== 'ref_bounced'))) {
            throwError(`Cannot access field of non-struct type: ${printTypeRef(src)}`, f.ref);
        }
        const srcT = getType(ctx.ctx, src.name);

        // Resolve field
        let fields: FieldDescription[];

        fields = srcT.fields;
        if (src.kind === 'ref_bounced') {
            fields = fields.slice(0, srcT.partialFieldCount);
        }

        const field = fields.find((v) => v.name === f.name)!;
        const cst = srcT.constants.find((v) => v.name === f.name)!;
        if (!field && !cst) {
            throwError(`Cannot find field "${f.name}" in struct "${srcT.name}"`, f.ref);
        }

        if (field) {

            // Trying to resolve field as a path
            const path = tryExtractPath(f);
            if (path) {

                // Prepare path
                const convertedPath: string[] = [];
                convertedPath.push(id(path[0]));
                convertedPath.push(...path.slice(1));
                const idd = convertedPath.join(`'`);

                // Special case for structs
                if (field.type.kind === 'ref') {
                    const ft = getType(ctx.ctx, field.type.name);
                    if (ft.kind === 'struct' || ft.kind === 'contract') {
                        return resolveFuncTypeUnpack(field.type, idd, ctx);
                    }
                }

                return idd;
            }

            // Getter instead of direct field access
            return `${ops.typeField(srcT.name, field.name, ctx)}(${writeExpression(f.src, ctx)})`;
        } else {
            return writeValue(cst.value!, ctx);
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

        const sf = getStaticFunction(ctx.ctx, f.name);
        let n = ops.global(f.name);
        if (sf.ast.kind === 'def_native_function') {
            n = sf.ast.nativeName;
            if (n.startsWith('__tact')) {
                ctx.used(n);
            }
        } else {
            ctx.used(n);
        }
        return n + '(' + f.args.map((a, i) => writeCastedExpression(a, sf.args[i].type, ctx)).join(', ') + ')';
    }

    //
    // Struct Constructor
    //

    if (f.kind === 'op_new') {
        const src = getType(ctx.ctx, f.type);

        // Write a constructor
        const id = writeStructConstructor(src, f.args.map((v) => v.name), ctx);
        ctx.used(id);

        // Write an expression
        const expressions = f.args.map((v) => writeCastedExpression(v.exp, src.fields.find((v2) => v2.name === v.name)!.type, ctx), ctx);
        return `${id}(${expressions.join(', ')})`;
    }

    //
    // Object-based function call
    //

    if (f.kind === 'op_call') {

        // Resolve source type
        const src = getExpType(ctx.ctx, f.src);
        if (src === null) {
            throwError(`Cannot call function of non - direct type: ${printTypeRef(src)} `, f.ref);
        }

        // Reference type
        if (src.kind === 'ref') {

            if (src.optional) {
                throwError(`Cannot call function of non - direct type: ${printTypeRef(src)} `, f.ref);
            }

            // Render function call
            const t = getType(ctx.ctx, src.name);

            // Check struct ABI
            if (t.kind === 'struct') {
                const abi = StructFunctions[f.name];
                if (abi) {
                    return abi.generate(ctx, [src, ...f.args.map((v) => getExpType(ctx.ctx, v))], [f.src, ...f.args], f.ref);
                }
            }

            // Resolve function
            const ff = t.functions.get(f.name)!;
            let name = ops.extension(src.name, f.name);
            if (ff.ast.kind === 'def_function') {
                ctx.used(name);
            } else {
                name = ff.ast.nativeName;
                if (name.startsWith('__tact')) {
                    ctx.used(name);
                }
            }

            // Render arguments
            let renderedArguments = f.args.map((a, i) => writeCastedExpression(a, ff.args[i].type, ctx));

            // Hack to replace a single struct argument to a tensor wrapper since otherwise 
            // func would convert (int) type to just int and break mutating functions
            if (ff.isMutating) {
                if (f.args.length === 1) {
                    const t = getExpType(ctx.ctx, f.args[0]);
                    if (t.kind === 'ref') {
                        const tt = getType(ctx.ctx, t.name);
                        if ((tt.kind === 'contract' || tt.kind === 'struct') && (ff.args[0].type.kind === 'ref') && (!ff.args[0].type.optional)) {
                            renderedArguments = [`${ops.typeTensorCast(tt.name, ctx)}(${renderedArguments[0]})`];
                        }
                    }
                }
            }

            // Render
            const s = writeExpression(f.src, ctx);
            if (ff.isMutating) {
                return `${s}~${name}(${renderedArguments.join(', ')})`;
            } else {
                return `${name}(${[s, ...renderedArguments].join(', ')})`;
            }
        }

        // Map types
        if (src.kind === 'map') {
            const abf = MapFunctions[f.name];
            if (!abf) {
                throwError(`Map function "${f.name}" not found`, f.ref);
            }
            return abf.generate(ctx, [src, ...f.args.map((v) => getExpType(ctx.ctx, v))], [f.src, ...f.args], f.ref);
        }

        if (src.kind === 'ref_bounced') {
            throw Error("Unimplemented");
        }

        throwError(`Cannot call function of non - direct type: ${printTypeRef(src)} `, f.ref);
    }

    //
    // Init of
    //

    if (f.kind === 'init_of') {
        const type = getType(ctx.ctx, f.name);
        return `${ops.contractInitChild(f.name, ctx)}(${['__tact_context_sys', ...f.args.map((a, i) => writeCastedExpression(a, type.init!.args[i].type, ctx))].join(', ')})`;
    }

    //
    // Ternary operator
    //

    if (f.kind === 'conditional') {
        return `(${writeExpression(f.condition, ctx)} ? ${writeExpression(f.thenBranch, ctx)} : ${writeExpression(f.elseBranch, ctx)})`;
    }

    //
    // Unreachable
    //

    throw Error('Unknown expression');
}