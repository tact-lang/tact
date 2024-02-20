import { contractErrors } from "../../abi/errors";
import { enabledMasterchain } from "../../config/features";
import { WriterContext } from "../Writer";

export function writeStdlib(ctx: WriterContext) {

    //
    // stdlib extension functions
    //

    ctx.skip('__tact_set');
    ctx.skip('__tact_nop');
    ctx.skip('__tact_str_to_slice');
    ctx.skip('__tact_slice_to_str');
    ctx.skip('__tact_address_to_slice');

    //
    // Addresses
    //

    ctx.fun('__tact_verify_address', () => {
        ctx.signature(`slice __tact_verify_address(slice address)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                throw_unless(${contractErrors.invalidAddress.id}, address.slice_bits() == 267);
                var h = address.preload_uint(11);
            `);

            if (enabledMasterchain(ctx.ctx)) {
                ctx.write(`
                    throw_unless(${contractErrors.invalidAddress.id}, (h == 1024) | (h == 1279));
                `);
            } else {
                ctx.write(`
                    throw_if(${contractErrors.masterchainNotEnabled.id}, h == 1279);
                    throw_unless(${contractErrors.invalidAddress.id}, h == 1024);
                `);
            }
            ctx.write(`
                return address;
            `);
        })
    });

    ctx.fun('__tact_load_address', () => {
        ctx.signature(`(slice, slice) __tact_load_address(slice cs)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                slice raw = cs~load_msg_addr();
                return (cs, ${ctx.used(`__tact_verify_address`)}(raw));
            `);
        });
    });

    ctx.fun('__tact_load_address_opt', () => {
        ctx.signature(`(slice, slice) __tact_load_address_opt(slice cs)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                slice raw = cs~load_msg_addr();
                if (raw.preload_uint(2) != 0) {
                    return (cs, ${ctx.used(`__tact_verify_address`)}(raw));
                } else {
                    return (cs, null());
                }
            `);
        });
    });

    ctx.fun('__tact_store_address', () => {
        ctx.signature(`builder __tact_store_address(builder b, slice address)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return b.store_slice(${ctx.used(`__tact_verify_address`)}(address));
            `);
        });
    });

    ctx.fun('__tact_store_address_opt', () => {
        ctx.signature(`builder __tact_store_address_opt(builder b, slice address)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                if (null?(address)) {
                    b = b.store_uint(0, 2);
                    return b;
                } else {
                    return ${ctx.used(`__tact_store_address`)}(b, address);
                }
            `);
        });
    });

    ctx.fun('__tact_create_address', () => {
        ctx.signature(`slice __tact_create_address(int chain, int hash)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var b = begin_cell();
                b = b.store_uint(2, 2);
                b = b.store_uint(0, 1);
                b = b.store_int(chain, 8);
                b = b.store_uint(hash, 256);
                var addr = b.end_cell().begin_parse();
                return ${ctx.used(`__tact_verify_address`)}(addr);
        `);
        });
    });

    ctx.fun('__tact_compute_contract_address', () => {
        ctx.signature(`slice __tact_compute_contract_address(int chain, cell code, cell data)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var b = begin_cell();
                b = b.store_uint(0, 2);
                b = b.store_uint(3, 2);
                b = b.store_uint(0, 1);
                b = b.store_ref(code);
                b = b.store_ref(data);
                var hash = cell_hash(b.end_cell());
                return ${ctx.used(`__tact_create_address`)}(chain, hash);
            `);
        });
    });

    ctx.fun(`__tact_my_balance`, () => {
        ctx.signature(`int __tact_my_balance()`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return pair_first(get_balance());
            `);
        });
    });

    ctx.fun('__tact_not_null', () => {
        ctx.signature(`forall X -> X __tact_not_null(X x)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`throw_if(${contractErrors.null.id}, null?(x)); return x;`);
        });

    });

    ctx.fun('__tact_dict_delete', () => {
        ctx.signature(`(cell, int) __tact_dict_delete(cell dict, int key_len, slice index)`);
        ctx.context('stdlib');
        ctx.asm(`asm(index dict key_len) "DICTDEL"`);
    });

    ctx.fun('__tact_dict_set_ref', () => {
        ctx.signature(`((cell), ()) __tact_dict_set_ref(cell dict, int key_len, slice index, cell value)`);
        ctx.context('stdlib');
        ctx.asm(`asm(value index dict key_len) "DICTSETREF"`);
    });

    ctx.fun('__tact_dict_get', () => {
        ctx.signature(`(slice, int) __tact_dict_get(cell dict, int key_len, slice index)`);
        ctx.context('stdlib');
        ctx.asm(`asm(index dict key_len) "DICTGET" "NULLSWAPIFNOT"`);
    });

    ctx.fun('__tact_dict_get_ref', () => {
        ctx.signature(`(cell, int) __tact_dict_get_ref(cell dict, int key_len, slice index)`);
        ctx.context('stdlib');
        ctx.asm(`asm(index dict key_len) "DICTGETREF" "NULLSWAPIFNOT"`);
    });

    ctx.fun('__tact_debug', () => {
        ctx.signature(`forall X -> () __tact_debug(X value)`);
        ctx.flag('impure');
        ctx.context('stdlib');
        ctx.asm(`asm "s0 DUMP" "DROP"`);
    });

    ctx.fun('__tact_debug_str', () => {
        ctx.signature(`() __tact_debug_str(slice value)`);
        ctx.flag('impure');
        ctx.context('stdlib');
        ctx.asm(`asm "STRDUMP" "DROP"`);
    });

    ctx.fun('__tact_debug_bool', () => {
        ctx.signature(`() __tact_debug_bool(int value)`);
        ctx.flag('impure');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                if (value) {
                    ${ctx.used('__tact_debug_str')}("true");
                } else {
                    ${ctx.used('__tact_debug_str')}("false");
                }
            `);
        });
    });

    ctx.fun('__tact_context_get', () => {
        ctx.signature(`(int, slice, int, slice) __tact_context_get()`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`return __tact_context;`);
        });
    });

    ctx.fun('__tact_context_get_sender', () => {
        ctx.signature(`slice __tact_context_get_sender()`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`return __tact_context_sender;`);
        });
    });

    ctx.fun('__tact_prepare_random', () => {
        ctx.signature(`() __tact_prepare_random()`);
        ctx.flag('impure');
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                if (null?(__tact_randomized)) {
                    randomize_lt();
                    __tact_randomized = true;
                }
            `);
        });
    });

    ctx.fun('__tact_store_bool', () => {
        ctx.signature(`builder __tact_store_bool(builder b, int v)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return b.store_int(v, 1);
            `);
        });
    });

    ctx.fun('__tact_to_tuple', () => {
        ctx.signature(`forall X -> tuple __tact_to_tuple(X x)`);
        ctx.context('stdlib');
        ctx.asm(`asm "NOP"`);
    });

    ctx.fun('__tact_from_tuple', () => {
        ctx.signature(`forall X -> X __tact_from_tuple(tuple x)`);
        ctx.context('stdlib');
        ctx.asm(`asm "NOP"`);
    });

    //
    // Dict Int -> Int
    //

    ctx.fun('__tact_dict_set_int_int', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_int_int(cell d, int kl, int k, int v, int vl)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                if (null?(v)) {
                    var (r, ok) = idict_delete?(d, kl, k);
                    return (r, ());
                } else {
                    return (idict_set_builder(d, kl, k, begin_cell().store_int(v, vl)), ());
                }
            `);
        });
    });

    ctx.fun('__tact_dict_get_int_int', () => {
        ctx.signature(`int __tact_dict_get_int_int(cell d, int kl, int k, int vl)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var (r, ok) = idict_get?(d, kl, k);
                if (ok) {
                    return r~load_int(vl);
                } else {
                    return null();
                }
            `);
        });
    });

    //
    // Dict Int -> Int
    //

    ctx.fun('__tact_dict_set_int_uint', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_int_uint(cell d, int kl, int k, int v, int vl)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                if (null?(v)) {
                    var (r, ok) = idict_delete?(d, kl, k);
                    return (r, ());
                } else {
                    return (idict_set_builder(d, kl, k, begin_cell().store_uint(v, vl)), ());
                }
            `);
        });
    });

    ctx.fun('__tact_dict_get_int_uint', () => {
        ctx.signature(`int __tact_dict_get_int_uint(cell d, int kl, int k, int vl)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var (r, ok) = idict_get?(d, kl, k);
                if (ok) {
                    return r~load_uint(vl);
                } else {
                    return null();
                }
            `);
        });
    });

    //
    // Dict Uint -> Int
    //

    ctx.fun('__tact_dict_set_uint_int', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_uint_int(cell d, int kl, int k, int v, int vl)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                if (null?(v)) {
                    var (r, ok) = udict_delete?(d, kl, k);
                    return (r, ());
                } else {
                    return (udict_set_builder(d, kl, k, begin_cell().store_int(v, vl)), ());
                }
            `);
        });
    });

    ctx.fun('__tact_dict_get_uint_int', () => {
        ctx.signature(`int __tact_dict_get_uint_int(cell d, int kl, int k, int vl)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var (r, ok) = udict_get?(d, kl, k);
                if (ok) {
                    return r~load_int(vl);
                } else {
                    return null();
                }
            `);
        });
    });

    //
    // Dict Uint -> Uint
    //

    ctx.fun('__tact_dict_set_uint_uint', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_uint_uint(cell d, int kl, int k, int v, int vl)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                if (null?(v)) {
                    var (r, ok) = udict_delete?(d, kl, k);
                    return (r, ());
                } else {
                    return (udict_set_builder(d, kl, k, begin_cell().store_uint(v, vl)), ());
                }
            `);
        });
    });

    ctx.fun('__tact_dict_get_uint_uint', () => {
        ctx.signature(`int __tact_dict_get_uint_uint(cell d, int kl, int k, int vl)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var (r, ok) = udict_get?(d, kl, k);
                if (ok) {
                    return r~load_uint(vl);
                } else {
                    return null();
                }
            `);
        });
    });

    //
    // Dict Int -> Cell
    //

    ctx.fun('__tact_dict_set_int_cell', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_int_cell(cell d, int kl, int k, cell v)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                if (null?(v)) {
                    var (r, ok) = idict_delete?(d, kl, k);
                    return (r, ());
                } else {
                    return (idict_set_ref(d, kl, k, v), ());
                }
            `);
        });
    });

    ctx.fun('__tact_dict_get_int_cell', () => {
        ctx.signature(`cell __tact_dict_get_int_cell(cell d, int kl, int k)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var (r, ok) = idict_get_ref?(d, kl, k);
                if (ok) {
                    return r;
                } else {
                    return null();
                }
            `);
        });
    });


    //
    // Dict Uint -> Cell
    //

    ctx.fun('__tact_dict_set_uint_cell', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_uint_cell(cell d, int kl, int k, cell v)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                if (null?(v)) {
                    var (r, ok) = udict_delete?(d, kl, k);
                    return (r, ());
                } else {
                    return (udict_set_ref(d, kl, k, v), ());
                }
            `);
        });
    });

    ctx.fun('__tact_dict_get_uint_cell', () => {
        ctx.signature(`cell __tact_dict_get_uint_cell(cell d, int kl, int k)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var (r, ok) = udict_get_ref?(d, kl, k);
                if (ok) {
                    return r;
                } else {
                    return null();
                }
            `);
        });
    });

    //
    // Dict Int -> Slice
    //

    ctx.fun('__tact_dict_set_int_slice', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_int_slice(cell d, int kl, int k, slice v)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                if (null?(v)) {
                    var (r, ok) = idict_delete?(d, kl, k);
                    return (r, ());
                } else {
                    return (idict_set(d, kl, k, v), ());
                }
            `);
        });
    });

    ctx.fun('__tact_dict_get_int_slice', () => {
        ctx.signature(`slice __tact_dict_get_int_slice(cell d, int kl, int k)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var (r, ok) = idict_get?(d, kl, k);
                if (ok) {
                    return r;
                } else {
                    return null();
                }
            `);
        });
    });

    //
    // Dict Uint -> Slice
    //

    ctx.fun('__tact_dict_set_uint_slice', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_uint_slice(cell d, int kl, int k, slice v)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                if (null?(v)) {
                    var (r, ok) = udict_delete?(d, kl, k);
                    return (r, ());
                } else {
                    return (udict_set(d, kl, k, v), ());
                }
            `);
        });
    });

    ctx.fun('__tact_dict_get_uint_slice', () => {
        ctx.signature(`slice __tact_dict_get_uint_slice(cell d, int kl, int k)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var (r, ok) = udict_get?(d, kl, k);
                if (ok) {
                    return r;
                } else {
                    return null();
                }
            `);
        });
    });

    //
    // Dict Slice -> Int
    //

    ctx.fun('__tact_dict_set_slice_int', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_slice_int(cell d, int kl, slice k, int v, int vl)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                if (null?(v)) {
                    var (r, ok) = ${ctx.used(`__tact_dict_delete`)}(d, kl, k);
                    return (r, ());
                } else {
                    return (dict_set_builder(d, kl, k, begin_cell().store_int(v, vl)), ());
                }
            `);
        });
    });

    ctx.fun('__tact_dict_get_slice_int', () => {
        ctx.signature(`int __tact_dict_get_slice_int(cell d, int kl, slice k, int vl)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var (r, ok) = ${ctx.used(`__tact_dict_get`)}(d, kl, k);
                if (ok) {
                    return r~load_int(vl);
                } else {
                    return null();
                }
            `);
        });
    });

    //
    // Dict Slice -> UInt
    //

    ctx.fun('__tact_dict_set_slice_uint', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_slice_uint(cell d, int kl, slice k, int v, int vl)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                if (null?(v)) {
                    var (r, ok) = ${ctx.used(`__tact_dict_delete`)}(d, kl, k);
                    return (r, ());
                } else {
                    return (dict_set_builder(d, kl, k, begin_cell().store_uint(v, vl)), ());
                }
            `);
        });
    });

    ctx.fun('__tact_dict_get_slice_uint', () => {
        ctx.signature(`int __tact_dict_get_slice_uint(cell d, int kl, slice k, int vl)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var (r, ok) = ${ctx.used(`__tact_dict_get`)}(d, kl, k);
                if (ok) {
                    return r~load_uint(vl);
                } else {
                    return null();
                }
            `);
        });
    });

    //
    // Dict Slice -> Cell
    //

    ctx.fun('__tact_dict_set_slice_cell', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_slice_cell(cell d, int kl, slice k, cell v)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                if (null?(v)) {
                    var (r, ok) = ${ctx.used(`__tact_dict_delete`)}(d, kl, k);
                    return (r, ());
                } else {
                    return ${ctx.used(`__tact_dict_set_ref`)}(d, kl, k, v);
                }
            `);
        });
    });

    ctx.fun(`__tact_dict_get_slice_cell`, () => {
        ctx.signature(`cell __tact_dict_get_slice_cell(cell d, int kl, slice k)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var (r, ok) = ${ctx.used(`__tact_dict_get_ref`)}(d, kl, k);
                if (ok) {
                    return r;
                } else {
                    return null();
                }
            `);
        });
    });

    //
    // Dict Slice -> Slice
    //

    ctx.fun('__tact_dict_set_slice_slice', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_slice_slice(cell d, int kl, slice k, slice v)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                if (null?(v)) {
                    var (r, ok) = ${ctx.used(`__tact_dict_delete`)}(d, kl, k);
                    return (r, ());
                } else {
                    return (dict_set_builder(d, kl, k, begin_cell().store_slice(v)), ());
                }
            `);
        });
    });

    ctx.fun(`__tact_dict_get_slice_slice`, () => {
        ctx.signature(`slice __tact_dict_get_slice_slice(cell d, int kl, slice k)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var (r, ok) = ${ctx.used(`__tact_dict_get`)}(d, kl, k);
                if (ok) {
                    return r;
                } else {
                    return null();
                }
            `);
        });
    });

    //
    // Address
    // 

    ctx.fun(`__tact_slice_eq_bits`, () => {
        ctx.signature(`int __tact_slice_eq_bits(slice a, slice b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return equal_slice_bits(a, b);
            `)
        });
    });

    ctx.fun(`__tact_slice_eq_bits_nullable_one`, () => {
        ctx.signature(`int __tact_slice_eq_bits_nullable_one(slice a, slice b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return (null?(a)) ? (false) : (equal_slice_bits(a, b));
            `)
        });
    });

    ctx.fun(`__tact_slice_eq_bits_nullable`, () => {
        ctx.signature(`int __tact_slice_eq_bits_nullable(slice a, slice b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var a_is_null = null?(a);
                var b_is_null = null?(b);
                return ( a_is_null & b_is_null ) ? ( true ) : ( ( ( ~ a_is_null ) & ( ~ b_is_null ) ) ? ( equal_slice_bits(a, b) ) : ( false ) );
            `)
        });
    });

    //
    // Int Eq
    //

    ctx.fun(`__tact_int_eq_nullable_one`, () => {
        ctx.signature(`int __tact_int_eq_nullable_one(int a, int b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return (null?(a)) ? (false) : (a == b);
            `);
        });
    });

    ctx.fun(`__tact_int_neq_nullable_one`, () => {
        ctx.signature(`int __tact_int_neq_nullable_one(int a, int b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return (null?(a)) ? (true) : (a != b);
            `);
        });
    });

    ctx.fun(`__tact_int_eq_nullable`, () => {
        ctx.signature(`int __tact_int_eq_nullable(int a, int b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var a_is_null = null?(a);
                var b_is_null = null?(b);
                return ( a_is_null & b_is_null ) ? ( true ) : ( ( ( ~ a_is_null ) & ( ~ b_is_null ) ) ? ( a == b ) : ( false ) );
            `);
        });
    });

    ctx.fun(`__tact_int_neq_nullable`, () => {
        ctx.signature(`int __tact_int_neq_nullable(int a, int b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var a_is_null = null?(a);
                var b_is_null = null?(b);
                return ( a_is_null & b_is_null ) ? ( false ) : ( ( ( ~ a_is_null ) & ( ~ b_is_null ) ) ? ( a != b ) : ( true ) );
            `);
        });
    });

    //
    // Cell Eq
    // 

    ctx.fun(`__tact_cell_eq`, () => {
        ctx.signature(`int __tact_cell_eq(cell a, cell b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return (a.cell_hash() ==  b.cell_hash());
            `);
        });
    });

    ctx.fun(`__tact_cell_neq`, () => {
        ctx.signature(`int __tact_cell_neq(cell a, cell b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return (a.cell_hash() !=  b.cell_hash());
            `);
        });
    });

    ctx.fun(`__tact_cell_eq_nullable_one`, () => {
        ctx.signature(`int __tact_cell_eq_nullable_one(cell a, cell b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return (null?(a)) ? (false) : (a.cell_hash() == b.cell_hash());
            `);
        });
    });

    ctx.fun(`__tact_cell_neq_nullable_one`, () => {
        ctx.signature(`int __tact_cell_neq_nullable_one(cell a, cell b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return (null?(a)) ? (true) : (a.cell_hash() != b.cell_hash());
            `);
        });
    });

    ctx.fun(`__tact_cell_eq_nullable`, () => {
        ctx.signature(`int __tact_cell_eq_nullable(cell a, cell b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var a_is_null = null?(a);
                var b_is_null = null?(b);
                return ( a_is_null & b_is_null ) ? ( true ) : ( ( ( ~ a_is_null ) & ( ~ b_is_null ) ) ? ( a.cell_hash() == b.cell_hash() ) : ( false ) );
            `);
        });
    });

    ctx.fun(`__tact_cell_neq_nullable`, () => {
        ctx.signature(`int __tact_cell_neq_nullable(cell a, cell b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var a_is_null = null?(a);
                var b_is_null = null?(b);
                return ( a_is_null & b_is_null ) ? ( false ) : ( ( ( ~ a_is_null ) & ( ~ b_is_null ) ) ? ( a.cell_hash() != b.cell_hash() ) : ( true ) );
            `);
        });
    });

    //
    // Slice Eq
    //

    ctx.fun(`__tact_slice_eq`, () => {
        ctx.signature(`int __tact_slice_eq(slice a, slice b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return (a.slice_hash() ==  b.slice_hash());
            `);
        });
    });

    ctx.fun(`__tact_slice_neq`, () => {
        ctx.signature(`int __tact_slice_neq(slice a, slice b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return (a.slice_hash() !=  b.slice_hash());
            `);
        });
    });

    ctx.fun(`__tact_slice_eq_nullable_one`, () => {
        ctx.signature(`int __tact_slice_eq_nullable_one(slice a, slice b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return (null?(a)) ? (false) : (a.slice_hash() == b.slice_hash());
            `);
        });
    });

    ctx.fun(`__tact_slice_neq_nullable_one`, () => {
        ctx.signature(`int __tact_slice_neq_nullable_one(slice a, slice b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return (null?(a)) ? (true) : (a.slice_hash() != b.slice_hash());
            `);
        });
    });

    ctx.fun(`__tact_slice_eq_nullable`, () => {
        ctx.signature(`int __tact_slice_eq_nullable(slice a, slice b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var a_is_null = null?(a);
                var b_is_null = null?(b);
                return ( a_is_null & b_is_null ) ? ( true ) : ( ( ( ~ a_is_null ) & ( ~ b_is_null ) ) ? ( a.slice_hash() == b.slice_hash() ) : ( false ) );
            `);
        });
    });

    ctx.fun(`__tact_slice_neq_nullable`, () => {
        ctx.signature(`int __tact_slice_neq_nullable(slice a, slice b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var a_is_null = null?(a);
                var b_is_null = null?(b);
                return ( a_is_null & b_is_null ) ? ( false ) : ( ( ( ~ a_is_null ) & ( ~ b_is_null ) ) ? ( a.slice_hash() != b.slice_hash() ) : ( true ) );
            `);
        });
    });

    //
    // Sys Dict
    //

    ctx.fun(`__tact_dict_set_code`, () => {
        ctx.signature(`cell __tact_dict_set_code(cell dict, int id, cell code)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return udict_set_ref(dict, 16, id, code);
            `);
        });
    });

    ctx.fun(`__tact_dict_get_code`, () => {
        ctx.signature(`cell __tact_dict_get_code(cell dict, int id)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var (data, ok) = udict_get_ref?(dict, 16, id);
                throw_unless(${contractErrors.codeNotFound.id}, ok);
                return data;
            `);
        });
    });

    //
    // Tuples
    //

    ctx.fun(`__tact_tuple_create_0`, () => {
        ctx.signature(`tuple __tact_tuple_create_0()`);
        ctx.context('stdlib');
        ctx.asm(`asm "NIL"`);
    });
    ctx.fun(`__tact_tuple_destroy_0`, () => {
        ctx.signature(`() __tact_tuple_destroy_0()`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.append(`return ();`)
        })
    });

    for (let i = 1; i < 64; i++) {
        ctx.fun(`__tact_tuple_create_${i}`, () => {
            const args: string[] = [];
            for (let j = 0; j < i; j++) {
                args.push(`X${j}`);
            }
            ctx.signature(`forall ${args.join(', ')} -> tuple __tact_tuple_create_${i}((${args.join(', ')}) v)`);
            ctx.context('stdlib');
            ctx.asm(`asm "${i} TUPLE"`);
        });
        ctx.fun(`__tact_tuple_destroy_${i}`, () => {
            const args: string[] = [];
            for (let j = 0; j < i; j++) {
                args.push(`X${j}`);
            }
            ctx.signature(`forall ${args.join(', ')} -> (${args.join(', ')}) __tact_tuple_destroy_${i}(tuple v)`);
            ctx.context('stdlib');
            ctx.asm(`asm "${i} UNTUPLE"`);
        });
    }

    //
    // Strings
    //

    ctx.fun(`__tact_string_builder_start_comment`, () => {
        ctx.signature(`tuple __tact_string_builder_start_comment()`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return ${ctx.used('__tact_string_builder_start')}(begin_cell().store_uint(0, 32));
            `);
        });
    });

    ctx.fun(`__tact_string_builder_start_tail_string`, () => {
        ctx.signature(`tuple __tact_string_builder_start_tail_string()`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return ${ctx.used('__tact_string_builder_start')}(begin_cell().store_uint(0, 8));
            `);
        });
    });

    ctx.fun(`__tact_string_builder_start_string`, () => {
        ctx.signature(`tuple __tact_string_builder_start_string()`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return ${ctx.used('__tact_string_builder_start')}(begin_cell());
            `);
        });

    });

    ctx.fun(`__tact_string_builder_start`, () => {
        ctx.signature(`tuple __tact_string_builder_start(builder b)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return tpush(tpush(empty_tuple(), b), null());
            `);
        });
    });

    ctx.fun(`__tact_string_builder_end`, () => {
        ctx.signature(`cell __tact_string_builder_end(tuple builders)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                (builder b, tuple tail) = uncons(builders);
                cell c = b.end_cell();
                while(~ null?(tail)) {
                    (b, tail) = uncons(tail);
                    c = b.store_ref(c).end_cell();
                }
                return c;
            `);
        });
    });

    ctx.fun(`__tact_string_builder_end_slice`, () => {
        ctx.signature(`slice __tact_string_builder_end_slice(tuple builders)`);
        ctx.flag('inline');
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                return ${ctx.used('__tact_string_builder_end')}(builders).begin_parse();
            `);
        });
    });

    ctx.fun(`__tact_string_builder_append`, () => {
        ctx.signature(`((tuple), ()) __tact_string_builder_append(tuple builders, slice sc)`);
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                int sliceRefs = slice_refs(sc);
                int sliceBits = slice_bits(sc);

                while((sliceBits > 0) | (sliceRefs > 0)) {

                    ;; Load the current builder
                    (builder b, tuple tail) = uncons(builders);
                    int remBytes = 127 - (builder_bits(b) / 8);
                    int exBytes = sliceBits / 8;

                    ;; Append bits
                    int amount = min(remBytes, exBytes);
                    if (amount > 0) {
                        slice read = sc~load_bits(amount * 8);
                        b = b.store_slice(read);
                    }

                    ;; Update builders
                    builders = cons(b, tail);

                    ;; Check if we need to add a new cell and continue
                    if (exBytes - amount > 0) {
                        var bb = begin_cell();
                        builders = cons(bb, builders);
                        sliceBits = (exBytes - amount) * 8;
                    } elseif (sliceRefs > 0) {
                        sc = sc~load_ref().begin_parse();
                        sliceRefs = slice_refs(sc);
                        sliceBits = slice_bits(sc);
                    } else {
                        sliceBits = 0;
                        sliceRefs = 0;
                    }
                }

                return ((builders), ());
            `);
        });
    });

    ctx.fun(`__tact_int_to_string`, () => {
        ctx.signature(`slice __tact_int_to_string(int src)`);
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                var b = begin_cell();
                if (src < 0) {
                    b = b.store_uint(45, 8);
                    src = - src;
                }

                if (src < ${(10n ** 30n).toString(10)}) {
                    int len = 0;
                    int value = 0;
                    int mult = 1;
                    do {
                        (src, int res) = src.divmod(10);
                        value = value + (res + 48) * mult;
                        mult = mult * 256;
                        len = len + 1;
                    } until (src == 0);

                    b = b.store_uint(value, len * 8);
                } else {
                    tuple t = empty_tuple();
                    int len = 0;
                    do {
                        int digit = src % 10;
                        t~tpush(digit);
                        len = len + 1;
                        src = src / 10;
                    } until (src == 0);

                    int c = len - 1;
                    repeat(len) {
                        int v = t.at(c);
                        b = b.store_uint(v + 48, 8);
                        c = c - 1;
                    }
                }
                return b.end_cell().begin_parse();
            `);
        });
    });

    ctx.fun(`__tact_float_to_string`, () => {
        ctx.signature(`slice __tact_float_to_string(int src, int digits)`);
        ctx.context('stdlib');
        ctx.body(() => {
            ctx.write(`
                throw_if(${contractErrors.invalidArgument.id}, (digits <= 0) | (digits > 77));
                builder b = begin_cell();

                if (src < 0) {
                    b = b.store_uint(45, 8);
                    src = - src;
                }

                ;; Process rem part
                int skip = true;
                int len = 0;
                int rem = 0;
                tuple t = empty_tuple();
                repeat(digits) {
                    (src, rem) = src.divmod(10);
                    if ( ~ ( skip & ( rem == 0 ) ) ) {
                        skip = false;
                        t~tpush(rem + 48);
                        len = len + 1;
                    }
                }

                ;; Process dot
                if (~ skip) {
                    t~tpush(46);
                    len = len + 1;
                }

                ;; Main
                do {
                    (src, rem) = src.divmod(10);
                    t~tpush(rem + 48);
                    len = len + 1;
                } until (src == 0);

                ;; Assemble
                int c = len - 1;
                repeat(len) {
                    int v = t.at(c);
                    b = b.store_uint(v, 8);
                    c = c - 1;
                }

                ;; Result
                return b.end_cell().begin_parse();
            `);
        });
    });
}