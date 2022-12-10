import { getType } from "../../types/resolveDescriptors";
import { TypeRef } from "../../types/types";
import { WriterContext } from "../Writer";
import { resolveFuncType } from "./resolveFuncType";

export type TensorDef = { name: string, type: string }[];

function resolveTensor(prefix: string, args: { name: string, type: TypeRef }[], ctx: WriterContext): TensorDef {
    let res: TensorDef = [];
    for (let arg of args) {
        if (arg.type.kind === 'ref') {
            let t = getType(ctx.ctx, arg.type.name);
            if (t.kind === 'primitive') {
                res.push({ name: prefix + arg.name, type: resolveFuncType(t, ctx) });
            } else if (t.kind === 'contract' || t.kind === 'struct') {
                let resolved = resolveTensor(`${prefix}${arg.name}'`, t.fields.map((t) => ({ name: t.name, type: t.type })), ctx);
                res = [...res, ...resolved];
            }
        } else if (arg.type.kind === 'map') {
            res.push({ name: prefix + arg.name, type: resolveFuncType(arg.type, ctx) });
        } else {
            throw Error('Unknown type: ' + arg.type.kind + ' in ' + arg.name + '');
        }
    }
    return res;
}

export function resolveFuncTensor(args: { name: string, type: TypeRef }[], ctx: WriterContext, prefix: string = '') {
    return resolveTensor(prefix, args, ctx);
}

export function tensorToString(tensor: TensorDef, mode: 'full' | 'types' | 'names') {
    if (mode === 'types') {
        return tensor.map((t) => `${t.type}`);
    } else if (mode === 'names') {
        return tensor.map((t) => `${t.name}`);
    } else {
        return tensor.map((t) => `${t.type} ${t.name}`);
    }
}