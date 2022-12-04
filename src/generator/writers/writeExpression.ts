import { ABIFunctions } from "../../abi/AbiFunction";
import { ASTExpression, throwError } from "../../ast/ast";
import { CompilerContext } from "../../ast/context";
import { getExpType } from "../../types/resolveExpressionType";
import { getAllStaticFunctions, getStaticFunction, getType } from "../../types/resolveTypeDescriptors";
import { printTypeRef } from "../../types/types";
import { WriterContext } from "../Writer";

export function writeExpression(ctx: CompilerContext, f: ASTExpression, wctx: WriterContext): string {

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
        return '(' + writeExpression(ctx, f.left, wctx) + ' ' + op + ' ' + writeExpression(ctx, f.right, wctx) + ')';
    }

    //
    // Unary operations: !, -, +, !!
    // NOTE: We always wrap in parenthesis to avoid operator precedence issues
    //

    if (f.kind === 'op_unary') {

        // NOTE: Logical not is written as a bitwise not
        if (f.op === '!') {
            return '(~ ' + writeExpression(ctx, f.right, wctx) + ')';
        }

        if (f.op === '-') {
            return '(- ' + writeExpression(ctx, f.right, wctx) + ')';
        }

        if (f.op === '+') {
            return '(+ ' + writeExpression(ctx, f.right, wctx) + ')';
        }

        // NOTE: Assert function that ensures that the value is not null
        if (f.op === '!!') {
            wctx.useLib('__tact_not_null');
            return '__tact_not_null(' + writeExpression(ctx, f.right, wctx) + ')';
        }

        throwError('Unknown unary operator: ' + f.op, f.ref);
    }

    //
    // Field Access
    // NOTE: this branch resolves "a.b", where "a" is an expression and "b" is a field name
    //

    if (f.kind === 'op_field') {

        // Resolve the type of the expression
        let src = getExpType(ctx, f.src);
        if (src === null || src.kind !== 'direct') {
            throwError(`Cannot access field of non-struct type: ${printTypeRef(src)}`, f.ref);
        }
        let srcT = getType(ctx, src.name);

        // Resolve field
        let field = srcT.fields.find((v) => v.name === f.name)!;
        if (!field) {
            throwError(`Cannot find field "${f.name}" in struct "${srcT.name}"`, f.ref);
        }

        // Write getter
        return 'at(' + writeExpression(ctx, f.src, wctx) + ', ' + field.index + ')';
    }

    //
    // Static Function Call
    //

    if (f.kind === 'op_static_call') {
        let sf = getStaticFunction(ctx, f.name);
        let n = f.name;
        if (sf.ast.kind === 'def_native_function') {
            n = sf.ast.nativeName;
        }
        return n + '(' + f.args.map((a) => writeExpression(ctx, a, wctx)).join(', ') + ')';
    }

    //
    // Struct Constructor
    //

    if (f.kind === 'op_new') {
        let src = getType(ctx, f.type);
        let expressions = src.fields.map((v) => writeExpression(ctx, f.args.find((v2) => v2.name === v.name)!.exp, wctx));
        let res = 'tpush(empty_tuple(), ' + expressions[0] + ')';
        for (let i = 1; i < expressions.length; i++) {
            res = 'tpush(' + res + ', ' + expressions[i] + ')';
        }
        return res;
    }

    //
    // Object-based function call
    //

    if (f.kind === 'op_call') {

        // Resolve source type
        let src = getExpType(ctx, f.src);
        if (src === null || src.kind !== 'direct') {
            throwError(`Cannot call function of non-direct type: ${printTypeRef(src)}`, f.ref);
        }

        // Check ABI
        if (src.name === '$ABI') {
            let abf = ABIFunctions[f.name];
            if (!abf) {
                throwError(`ABI function "${f.name}" not found`, f.ref);
            }
            return abf.generate(ctx, f.args.map((v) => getExpType(ctx, v)), f.args.map((a) => writeExpression(ctx, a, wctx)), f.ref, wctx);
        }

        // Render function call
        return '__gen_' + src.name + '_' + writeExpression(ctx, f.src, wctx) + '(' + f.args.map((a) => writeExpression(ctx, a, wctx)).join(', ') + ');';
    }

    //
    // Unreachable
    //

    throw Error('Unknown expression');
}