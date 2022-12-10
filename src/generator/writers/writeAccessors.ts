import { getType } from "../../types/resolveDescriptors";
import { TypeDescription } from "../../types/types";
import { WriterContext } from "../Writer";
import { resolveFuncTensor, tensorToString } from "./resolveFuncTensor";

export function writeAccessors(type: TypeDescription, ctx: WriterContext) {
    let sourceTensor = resolveFuncTensor(type.fields, ctx, `v'`);

    for (let f of type.fields) {
        ctx.fun(`__gen_${type.name}_get_${f.name}`, () => {
            ctx.append(`_ __gen_${type.name}_get_${f.name}(${tensorToString(sourceTensor, 'full').join(', ')}) inline {`);
            ctx.inIndent(() => {
                if (f.type.kind === 'ref') {
                    let tt = getType(ctx.ctx, f.type.name);
                    if (tt.kind === 'struct' || tt.kind === 'contract') {
                        ctx.append(`return (${tensorToString(resolveFuncTensor(tt.fields, ctx, `v'${f.name}'`), 'names').join(', ')});`);
                        return;
                    }
                }
                ctx.append(`return v'${f.name};`);
            });
            ctx.append(`}`);
        });;
    }

    ctx.fun(`__gen_${type.name}_unpack`, () => {
        ctx.append(`(${tensorToString(sourceTensor, 'types').join(', ')}) __gen_${type.name}_unpack(${tensorToString(sourceTensor, 'full').join(', ')}) asm "NOP";`);
    });;
}