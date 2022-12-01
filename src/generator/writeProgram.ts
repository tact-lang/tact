import { ASTExpression, ASTStatement } from "../ast/ast";
import { CompilerContext } from "../ast/context";
import { getExpType, getLValuePaths } from "../types/resolveExpressionType";
import { getAllStaticFunctions, getAllTypes, getType } from "../types/resolveTypeDescriptors";
import { FieldDescription, FunctionDescription, TypeDescription } from "../types/TypeDescription";
import { writeStdlib } from "./stdlib/writeStdlib";
import { Writer } from "./Writer";

function resolveFunCType(descriptor: TypeDescription): string {
    if (descriptor.kind === 'primitive') {
        if (descriptor.name === 'Int') {
            return 'int';
        } else if (descriptor.name === 'Bool') {
            return 'int';
        } else if (descriptor.name === 'Slice') {
            return 'slice';
        } else if (descriptor.name === 'Cell') {
            return 'cell';
        } else {
            throw Error('Unknown primitive type: ' + descriptor.name);
        }
    } else if (descriptor.kind === 'struct') {
        return 'tuple';
    } else if (descriptor.kind === 'contract') {
        return 'tuple';
    }

    throw Error('Unknown type: ' + descriptor.kind);
}

function writeExpression(ctx: CompilerContext, f: ASTExpression, stdlib: Set<string>): string {
    if (f.kind === 'boolean') {
        return f.value ? 'true' : 'false';
    } else if (f.kind === 'number') {
        return f.value.toString(10);
    } else if (f.kind === 'id') {
        return f.value;
    } else if (f.kind === 'op_binary') {
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
            throw Error('Unknown binary operator: ' + f.op);
        }
        return '(' + writeExpression(ctx, f.left, stdlib) + ' ' + op + ' ' + writeExpression(ctx, f.right, stdlib) + ')';
    } else if (f.kind === 'op_unary') {
        if (f.op === '!') {
            return '~' + writeExpression(ctx, f.right, stdlib);
        } else if (f.op === '-') {
            return '-' + writeExpression(ctx, f.right, stdlib);
        } else if (f.op === '+') {
            return '+' + writeExpression(ctx, f.right, stdlib);
        } else {
            throw Error('Unknown unary operator: ' + f.op);
        }
    } else if (f.kind === 'op_field') {
        let src = getExpType(ctx, f.src);
        let field = src.fields.find((v) => v.name === f.name)!;
        if (!field) {
            throw Error('Field not found: ' + f.name + ' in ' + src.name);
        }
        stdlib.add('__tact_get');
        return '__tact_get(' + writeExpression(ctx, f.src, stdlib) + ', ' + field.index + ')';
    } else if (f.kind === 'op_static_call') {
        return f.name + '(' + f.args.map((a) => writeExpression(ctx, a, stdlib)).join(', ') + ')';
    } else if (f.kind === 'op_call') {
        let src = getExpType(ctx, f.src);
        let index = src.functions.findIndex((v) => v.name === f.name);
        stdlib.add('__tact_call');
        return '__tact_call(' + writeExpression(ctx, f.src, stdlib) + ', ' + index + ', [' + f.args.map((a) => writeExpression(ctx, a, stdlib)).join(', ') + '])';
    } else if (f.kind === 'op_new') {
        let src = getType(ctx, f.type);
        let expressions = src.fields.map((v) => writeExpression(ctx, f.args.find((v2) => v2.name === v.name)!.exp, stdlib));
        let res = 'tpush(empty_tuple(), ' + expressions[0] + ')';
        for (let i = 1; i < expressions.length; i++) {
            res = 'tpush(' + res + ', ' + expressions[i] + ')';
        }
        return res;
    }
    throw Error('Unknown expression');
}

function writeStatement(ctx: CompilerContext, f: ASTStatement, w: Writer, stdlib: Set<string>) {
    if (f.kind === 'statement_return') {
        w.append('return ' + writeExpression(ctx, f.expression, stdlib) + ';');
        return;
    } else if (f.kind === 'statement_let') {
        w.append(resolveFunCType(getType(ctx, f.type)) + ' ' + f.name + ' = ' + writeExpression(ctx, f.expression, stdlib) + ';');
        return;
    } else if (f.kind === 'statement_assign') {

        // Local variable case
        if (f.path.length === 1) {
            w.append(f.path[0] + ' = ' + writeExpression(ctx, f.expression, stdlib) + ';');
            return;
        }

        // Depth = 2
        if (f.path.length === 2) {
            let valueExpr = writeExpression(ctx, f.expression, stdlib);
            let lvalueTypes = getLValuePaths(ctx, f);
            let srcExpr = f.path[1];
            let targetIndex = lvalueTypes[0].fields.findIndex((v) => v.name === srcExpr);
            stdlib.add('__tact_set');
            valueExpr = '__tact_set(' + f.path[0] + ', ' + targetIndex + ', ' + valueExpr + ')';
            w.append(f.path[0] + ' = ' + valueExpr + ';');
            return;
        }

        throw Error('Too deep assignment');
    }
    throw Error('Unknown statement kind: ' + f.kind);
}

function writeFunction(ctx: CompilerContext, f: FunctionDescription, w: Writer, stdlib: Set<string>) {

    // Do not write native functions
    if (f.ast.kind === 'def_native_function') {
        return;
    }
    const fd = f.ast;

    // Write function header
    w.append((f.returns ? resolveFunCType(f.returns) : '()') + ' ' + f.name + '(' + f.args.map((a) => resolveFunCType(a.type) + ' ' + a.name).join(', ') + ') {');
    w.inIndent(() => {
        for (let s of fd.statements) {
            writeStatement(ctx, s, w, stdlib);
        }
    });
    w.append("}");
    w.append();
}

function resolveFieldSize(src: FieldDescription): { bits: number, refs: number } {
    if (src.type.kind === 'primitive') {
        if (src.type.name === 'Int') {
            return { bits: 257, refs: 0 };
        } else if (src.type.name === 'Bool') {
            return { bits: 1, refs: 0 };
        }
    } else if (src.type.kind === 'contract' || src.type.kind === 'struct') {
        return { bits: 0, refs: 1 };
    }
    throw Error('Unknown field type: ' + src.type.kind);
}

function writeFields(ctx: CompilerContext, fields: FieldDescription[], bits: number, refs: number, w: Writer, stdlib: Set<string>) {
    while (fields.length > 0) {
        let f = fields.shift()!;
        let d = resolveFieldSize(f);
        if (d.bits > bits || d.refs > refs) {
            w.append('.store_ref(begin_cell()');
            w.inIndent(() => {
                writeFields(ctx, [f, ...fields], 1023, 3, w, stdlib);
            });
            w.append('.end_cell())');
        } else {
            bits -= d.bits;
            refs -= d.refs;
            if (f.type.kind === 'primitive') {
                if (f.type.name === 'Int') {
                    w.append('.store_int(257, __tact_get(v, ' + f.index + '))');
                } else {
                    throw Error('Unknown primitive type: ' + f.type.name);
                }
            } else {
                // throw Error('Unknown field type: ' + f.type.kind);
            }
        }
    }
}

function writeSerializer(ctx: CompilerContext, type: TypeDescription, w: Writer, stdlib: Set<string>) {
    w.append('builder write_' + type.name + '(builder build, ' + resolveFunCType(type) + ' v) {');
    w.inIndent(() => {
        w.append('return build');
        w.inIndent(() => {
            writeFields(ctx, [...type.fields], 1023, 3, w, stdlib);
        });
        w.append(';');
    });
    w.append("}");
}

export function writeProgram(ctx: CompilerContext) {
    const writer = new Writer();
    const stdlibs = new Set<string>();

    // Serializators
    let types = getAllTypes(ctx);
    for (let k in types) {
        let t = types[k];
        if (t.kind === 'primitive') {
            continue;
        }
        writeSerializer(ctx, t, writer, stdlibs);
    }

    // Static functions
    let sf = getAllStaticFunctions(ctx);
    for (let k in sf) {
        let f = sf[k];
        writeFunction(ctx, f, writer, stdlibs);
    }

    // Types
    // TODO: Implement

    // Entry Points
    writer.append('() recv_internal(cell in_msg_cell, slice in_msg) impure {');
    writer.inIndent(() => {

    });
    writer.append('}');

    let res = writeStdlib(Array.from(stdlibs)) + '\n' + writer.end();
    return res;
}