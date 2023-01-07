import { WriterContext } from "../Writer";


function used(name: string, ctx: WriterContext) {
    let c = ctx.currentContext();
    if (c) {
        ctx.used(name);
    }
    return name;
}

export const ops = {
    writer: (type: string, ctx: WriterContext) => used(`__gen_write_${type}`, ctx),
    writerCell: (type: string, ctx: WriterContext) => used(`__gen_writecell_${type}`, ctx),
    writerCellOpt: (type: string, ctx: WriterContext) => used(`__gen_writecellopt_${type}`, ctx)
};