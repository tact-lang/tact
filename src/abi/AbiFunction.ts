import { ASTRef, throwError } from "../grammar/ast";
import { CompilerContext } from "../context";
import { WriterContext } from "../generator/Writer";
import { getType } from "../types/resolveDescriptors";
import { TypeRef } from "../types/types";

export type AbiFunction = {
    name: string;
    resolve: (ctx: CompilerContext, args: TypeRef[], ref: ASTRef) => TypeRef;
    generate: (ctx: WriterContext, args: TypeRef[], resolved: string[], ref: ASTRef) => string;
}

export const ABIFunctions: { [key: string]: AbiFunction } = {
    dump: {
        name: 'dump',
        resolve: (ctx, args, ref) => {
            if (args.length !== 1) {
                throwError('dump expects 1 argument', ref);
            }
            return { kind: 'void' };
        },
        generate: (ctx, args, resolved, ref) => {
            return `${resolved[0]}~dump()`;
        }
    },
    pack_cell: {
        name: 'pack_cell',
        resolve: (ctx, args, ref) => {
            if (args.length !== 1) {
                throwError('pack_cell expects 1 argument', ref);
            }
            if (args[0].kind === 'null' || args[0].kind !== 'ref' || args[0].optional) {
                throwError('pack_cell expects a direct type', ref);
            }
            let tp = getType(ctx, args[0].name);
            if (tp.kind !== 'struct') {
                throwError('pack_cell expects a struct type', ref);
            }
            return { kind: 'ref', name: 'Cell', optional: false };
        },
        generate: (ctx, args, resolved, ref) => {
            if (args.length !== 1) {
                throwError('pack_cell expects 1 argument', ref);
            }
            if (args[0].kind === 'null' || args[0].kind !== 'ref' || args[0].optional) {
                throwError('pack_cell expects a direct type', ref);
            }
            let tp = getType(ctx.ctx, args[0].name);
            if (tp.kind !== 'struct') {
                throwError('pack_cell expects a struct type', ref);
            }
            ctx.used(`__gen_writecell_${args[0].name}`);
            return `__gen_writecell_${args[0].name}(${resolved.join(', ')})`;
        }
    },
    pack_slice: {
        name: 'pack_slice',
        resolve: (ctx, args, ref) => {
            if (args.length !== 1) {
                throwError('pack_slice expects 1 argument', ref);
            }
            if (args[0].kind === 'null' || args[0].kind !== 'ref' || args[0].optional) {
                throwError('pack_slice expects a direct type', ref);
            }
            let tp = getType(ctx, args[0].name);
            if (tp.kind !== 'struct') {
                throwError('pack_slice expects a struct type', ref);
            }
            return { kind: 'ref', name: 'Slice', optional: false };
        },
        generate: (ctx, args, resolved, ref) => {
            if (args.length !== 1) {
                throwError('pack_slice expects 1 argument', ref);
            }
            if (args[0].kind === 'null' || args[0].kind !== 'ref' || args[0].optional) {
                throwError('pack_slice expects a direct type', ref);
            }
            let tp = getType(ctx.ctx, args[0].name);
            if (tp.kind !== 'struct') {
                throwError('pack_slice expects a struct type', ref);
            }
            ctx.used(`__gen_writeslice_${args[0].name}`);
            return `__gen_writeslice_${args[0].name}(${resolved.join(', ')})`;
        }
    }
};