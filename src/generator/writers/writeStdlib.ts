import { WriterContext } from "../Writer";

export function writeStdlib(ctx: WriterContext) {
    ctx.fun('__tact_set', () => {
        ctx.append(`forall X -> tuple __tact_set(tuple x, X v, int i) asm "SETINDEXVARQ";`);
    });
    ctx.fun('__tact_not_null', () => {
        ctx.append(`forall X -> X __tact_not_null(X x) { throw_if(14, null?(x)); return x; }`);
    });
    ctx.fun('__tact_load_address', () => {
        ctx.append(`(slice, [int, int]) __tact_load_address(slice cs) {`);
        ctx.inIndent(() => {
            ctx.append(`slice raw = cs~load_msg_addr();`);
            ctx.append(`var (r1, r2) = parse_std_addr(raw);`);
            ctx.append(`return (cs, [r1, r2]);`);
        });
        ctx.append(`}`);
    });
    ctx.fun('__tact_store_address', () => {
        ctx.append(`builder __tact_store_address(builder b, [int, int] address) {`);
        ctx.inIndent(() => {
            ctx.append(`b = b.store_uint(2, 2);`) // Is std address
            ctx.append(`b = b.store_uint(0, 1);`) // Non-unicast
            ctx.append(`b = b.store_int(pair_first(address), 8);`) // Workchain (0 or -1)
            ctx.append(`b = b.store_uint(pair_second(address), 256);`) // Address hash
            ctx.append(`return b;`);
        });
        ctx.append(`}`);
    });
    ctx.fun('__tact_compute_contract_address', () => {
        ctx.append('[int, int] __tact_compute_contract_address(int chain, cell code, cell data) {')
        ctx.inIndent(() => {
            ctx.append(`var b = begin_cell();`);
            ctx.append(`b = b.store_uint(0, 2);`);
            ctx.append(`b = b.store_uint(3, 2);`);
            ctx.append(`b = b.store_uint(0, 1);`);
            ctx.append(`b = b.store_ref(code);`);
            ctx.append(`b = b.store_ref(data);`);
            ctx.append(`var hash = cell_hash(b.end_cell());`);
            ctx.append(`return [chain, hash];`);
        });
        ctx.append('}');
    });
    ctx.fun('__tact_to_tuple', () => {
        ctx.append(`forall X -> tuple __tact_to_tuple(X x) impure asm "NOP";`);
    });
}