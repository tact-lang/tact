import { WriterContext } from "../Writer";

export function writeStdlib(ctx: WriterContext) {
    ctx.fun('__tact_set', () => {
        ctx.append(`forall X -> tuple __tact_set(tuple x, int i, X v) asm "SETINDEXVARQ";`);
    });
    ctx.fun('__tact_not_null', () => {
        ctx.append(`forall X -> X __tact_not_null(X x) { throw_if(14, null?(x)); return x; }`);
    });
}