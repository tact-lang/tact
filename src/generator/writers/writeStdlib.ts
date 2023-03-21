import { contractErrors } from "../../abi/errors";
import { enabledMaterchain } from "../../config/features";
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
        ctx.write(`
            slice __tact_verify_address(slice address) inline {
                throw_unless(${contractErrors.invalidAddress.id}, address.slice_bits() == 267);
                var h = address.preload_uint(11);
                throw_unless(${contractErrors.invalidAddress.id}, (h == 1024) | (h == 1279));
                ${!enabledMaterchain(ctx.ctx) ? `throw_unless(${contractErrors.masterchainNotEnabled.id}, h == 1024);` : ''}
                return address;
            }
        `);
    });

    ctx.fun('__tact_load_address', () => {
        ctx.signature(`(slice, slice) __tact_load_address(slice cs)`);
        ctx.write(`
            (slice, slice) __tact_load_address(slice cs) inline {
                slice raw = cs~load_msg_addr();
                return (cs, ${ctx.used(`__tact_verify_address`)}(raw));
            }
        `);
    });

    ctx.fun('__tact_load_address_opt', () => {
        ctx.signature(`(slice, slice) __tact_load_address_opt(slice cs)`);
        ctx.write(`
            (slice, slice) __tact_load_address_opt(slice cs) inline {
                slice raw = cs~load_msg_addr();
                if (raw.preload_uint(2) != 0) {
                    return (cs, ${ctx.used(`__tact_verify_address`)}(raw));
                } else {
                    return (cs, null());
                }
            }
        `);
    });

    ctx.fun('__tact_store_address', () => {
        ctx.signature(`builder __tact_store_address(builder b, slice address)`);
        ctx.write(`
            builder __tact_store_address(builder b, slice address) inline {
                return b.store_slice(${ctx.used(`__tact_verify_address`)}(address));
            }
        `);
    });

    ctx.fun('__tact_store_address_opt', () => {
        ctx.signature(`builder __tact_store_address_opt(builder b, slice address)`);
        ctx.write(`
            builder __tact_store_address_opt(builder b, slice address) inline {
                if (null?(address)) {
                    b = b.store_uint(0, 2);
                    return b;
                } else {
                    return ${ctx.used(`__tact_store_address`)}(b, address);
                }
            }
        `);
    });

    ctx.fun('__tact_create_address', () => {
        ctx.signature(`slice __tact_create_address(int chain, int hash)`);
        ctx.write(`
            slice __tact_create_address(int chain, int hash) inline {
                var b = begin_cell();
                b = b.store_uint(2, 2);
                b = b.store_uint(0, 1);
                b = b.store_int(chain, 8);
                b = b.store_uint(hash, 256);
                var addr = b.end_cell().begin_parse();
                return ${ctx.used(`__tact_verify_address`)}(addr);
            }
        `);
    });

    ctx.fun('__tact_compute_contract_address', () => {
        ctx.signature(`slice __tact_compute_contract_address(int chain, cell code, cell data)`);
        ctx.write(`
            slice __tact_compute_contract_address(int chain, cell code, cell data) inline {
                var b = begin_cell();
                b = b.store_uint(0, 2);
                b = b.store_uint(3, 2);
                b = b.store_uint(0, 1);
                b = b.store_ref(code);
                b = b.store_ref(data);
                var hash = cell_hash(b.end_cell());
                return ${ctx.used(`__tact_create_address`)}(chain, hash);
            }
        `);
    });

    ctx.fun(`__tact_my_balance`, () => {
        ctx.signature(`int __tact_my_balance()`);
        ctx.write(`
            int __tact_my_balance() inline {
                return pair_first(get_balance());
            }
        `);
    });

    ctx.fun('__tact_not_null', () => {
        ctx.signature(`forall X -> X __tact_not_null(X x)`);
        ctx.write(`forall X -> X __tact_not_null(X x) inline { throw_if(${contractErrors.null.id}, null?(x)); return x; }`);
    });

    ctx.fun('__tact_dict_delete', () => {
        ctx.signature(`(cell, int) __tact_dict_delete(cell dict, int key_len, slice index)`);
        ctx.write(`(cell, int) __tact_dict_delete(cell dict, int key_len, slice index) asm(index dict key_len) "DICTDEL";`)
    });

    ctx.fun('__tact_dict_set_ref', () => {
        ctx.signature(`((cell), ()) __tact_dict_set_ref(cell dict, int key_len, slice index, cell value)`);
        ctx.write(`((cell), ()) __tact_dict_set_ref(cell dict, int key_len, slice index, cell value) asm(value index dict key_len) "DICTSETREF";`)
    });

    ctx.fun('__tact_dict_get', () => {
        ctx.signature(`(slice, int) __tact_dict_get(cell dict, int key_len, slice index)`);
        ctx.write(`(slice, int) __tact_dict_get(cell dict, int key_len, slice index) asm(index dict key_len) "DICTGET" "NULLSWAPIFNOT";`);
    });

    ctx.fun('__tact_dict_get_ref', () => {
        ctx.signature(`(cell, int) __tact_dict_get_ref(cell dict, int key_len, slice index)`);
        ctx.write(`(cell, int) __tact_dict_get_ref(cell dict, int key_len, slice index) asm(index dict key_len) "DICTGETREF" "NULLSWAPIFNOT";`);
    });

    ctx.fun('__tact_debug', () => {
        ctx.signature(`forall X -> () __tact_debug(X value)`);
        ctx.write(`forall X -> () __tact_debug(X value) impure asm "s0 DUMP" "DROP";`);
    });

    ctx.fun('__tact_debug_str', () => {
        ctx.signature(`() __tact_debug_str(slice value)`);
        ctx.write(`() __tact_debug_str(slice value) impure asm "STRDUMP" "DROP";`);
    });

    ctx.fun('__tact_debug_bool', () => {
        ctx.signature(`() __tact_debug_bool(int value)`);
        ctx.write(`
            () __tact_debug_bool(int value) impure inline_ref  {
                if (value) {
                    ${ctx.used('__tact_debug_str')}("true");
                } else {
                    ${ctx.used('__tact_debug_str')}("false");
                }
            }
        `);
    });

    ctx.fun('__tact_context_get', () => {
        ctx.signature(`(int, slice, int, slice) __tact_context_get()`);
        ctx.write(`(int, slice, int, slice) __tact_context_get() inline { return __tact_context; }`);
    });

    ctx.fun('__tact_context_get_sender', () => {
        ctx.signature(`slice __tact_context_get_sender()`);
        ctx.write(`slice __tact_context_get_sender() inline { return __tact_context_sender; }`);
    });

    ctx.fun('__tact_prepare_random', () => {
        ctx.signature(`() __tact_prepare_random()`);
        ctx.write(`
            () __tact_prepare_random() impure inline {
                if (null?(__tact_randomized)) {
                    randomize_lt();
                    __tact_randomized = true;
                }
            }
        `);
    });

    ctx.fun('__tact_store_bool', () => {
        ctx.signature(`builder __tact_store_bool(builder b, int v)`);
        ctx.write(`
            builder __tact_store_bool(builder b, int v) inline {
                b = b.store_int(v, 1);
                return b;
            }
        `);
    });

    ctx.fun('__tact_to_tuple', () => {
        ctx.signature(`forall X -> tuple __tact_to_tuple(X x)`);
        ctx.write(`forall X -> tuple __tact_to_tuple(X x) impure asm "NOP";`);
    });

    ctx.fun('__tact_from_tuple', () => {
        ctx.signature(`forall X -> X __tact_from_tuple(tuple x)`);
        ctx.write(`forall X -> X __tact_from_tuple(tuple x) impure asm "NOP";`);
    });

    //
    // Dict Int -> Int
    //

    ctx.fun('__tact_dict_set_int_int', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_int_int(cell d, int kl, int k, int v, int vl)`);
        ctx.write(`
            (cell, ()) __tact_dict_set_int_int(cell d, int kl, int k, int v, int vl) inline {
                if (null?(v)) {
                    var (r, ok) = idict_delete?(d, kl, k);
                    return (r, ());
                } else {
                    return (idict_set_builder(d, kl, k, begin_cell().store_int(v, vl)), ());
                }
            }
        `);
    });

    ctx.fun('__tact_dict_get_int_int', () => {
        ctx.signature(`int __tact_dict_get_int_int(cell d, int kl, int k, int vl)`);
        ctx.write(`
            int __tact_dict_get_int_int(cell d, int kl, int k, int vl) inline {
                var (r, ok) = idict_get?(d, kl, k);
                if (ok) {
                    return r~load_int(vl);
                } else {
                    return null();
                }
            }
        `);
    });

    //
    // Dict Int -> Cell
    //

    ctx.fun('__tact_dict_set_int_cell', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_int_cell(cell d, int kl, int k, cell v)`);
        ctx.write(`
            (cell, ()) __tact_dict_set_int_cell(cell d, int kl, int k, cell v) inline {
                if (null?(v)) {
                    var (r, ok) = idict_delete?(d, kl, k);
                    return (r, ());
                } else {
                    return (idict_set_ref(d, kl, k, v), ());
                }
            }
        `);
    });

    ctx.fun('__tact_dict_get_int_cell', () => {
        ctx.signature(`cell __tact_dict_get_int_cell(cell d, int kl, int k)`);
        ctx.write(`
            cell __tact_dict_get_int_cell(cell d, int kl, int k) {
                var (r, ok) = idict_get_ref?(d, kl, k);
                if (ok) {
                    return r;
                } else {
                    return null();
                }
            }
        `);
    });

    //
    // Dict Int -> Slice
    //

    ctx.fun('__tact_dict_set_int_slice', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_int_slice(cell d, int kl, int k, slice v)`);
        ctx.write(`
            (cell, ()) __tact_dict_set_int_slice(cell d, int kl, int k, slice v) inline {
                if (null?(v)) {
                    var (r, ok) = idict_delete?(d, kl, k);
                    return (r, ());
                } else {
                    return (idict_set(d, kl, k, v), ());
                }
            }
        `);
    });

    ctx.fun('__tact_dict_get_int_slice', () => {
        ctx.signature(`slice __tact_dict_get_int_slice(cell d, int kl, int k)`);
        ctx.write(`
            slice __tact_dict_get_int_slice(cell d, int kl, int k) inline {
                var (r, ok) = idict_get?(d, kl, k);
                if (ok) {
                    return r;
                } else {
                    return null();
                }
            }
        `);
    });

    //
    // Dict Slice -> Int
    //

    ctx.fun('__tact_dict_set_slice_int', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_slice_int(cell d, int kl, slice k, int v, int vl)`);
        ctx.write(`
            (cell, ()) __tact_dict_set_slice_int(cell d, int kl, slice k, int v, int vl) {
                if (null?(v)) {
                    var (r, ok) = ${ctx.used(`__tact_dict_delete`)}(d, kl, k);
                    return (r, ());
                } else {
                    return (dict_set_builder(d, kl, k, begin_cell().store_int(v, vl)), ());
                }
            }
        `);
    });

    ctx.fun('__tact_dict_get_slice_int', () => {
        ctx.signature(`int __tact_dict_get_slice_int(cell d, int kl, slice k, int vl)`);
        ctx.write(`
            int __tact_dict_get_slice_int(cell d, int kl, slice k, int vl) inline {
                var (r, ok) = ${ctx.used(`__tact_dict_get`)}(d, kl, k);
                if (ok) {
                    return r~load_int(vl);
                } else {
                    return null();
                }
            }
        `);
    });

    //
    // Dict Slice -> Cell
    //

    ctx.fun('__tact_dict_set_slice_cell', () => {
        ctx.signature(`(cell, ()) __tact_dict_set_slice_cell(cell d, int kl, slice k, cell v)`);
        ctx.write(`
            (cell, ()) __tact_dict_set_slice_cell(cell d, int kl, slice k, cell v) inline {
                if (null?(v)) {
                    var (r, ok) = ${ctx.used(`__tact_dict_delete`)}(d, kl, k);
                    return (r, ());
                } else {
                    return ${ctx.used(`__tact_dict_set_ref`)}(d, kl, k, v);
                }
            }
        `);
    });

    ctx.fun(`__tact_dict_get_slice_cell`, () => {
        ctx.signature(`cell __tact_dict_get_slice_cell(cell d, int kl, slice k)`);
        ctx.write(`
            cell __tact_dict_get_slice_cell(cell d, int kl, slice k) inline {
                var (r, ok) = ${ctx.used(`__tact_dict_get_ref`)}(d, kl, k);
                if (ok) {
                    return r;
                } else {
                    return null();
                }
            }
        `);
    });

    //
    // Address
    // 

    ctx.fun(`__tact_address_eq`, () => {
        ctx.signature(`int __tact_address_eq(slice a, slice b)`);
        ctx.write(`
            int __tact_address_eq(slice a, slice b) inline {
                return equal_slice_bits(a, b);
            }
        `)
    });

    ctx.fun(`__tact_address_neq`, () => {
        ctx.signature(`int __tact_address_neq(slice a, slice b)`);
        ctx.write(`
            int __tact_address_neq(slice a, slice b) inline {
                return ~ equal_slice_bits(a, b);
            }
        `);
    });

    //
    // Cell Eq
    // 

    ctx.fun(`__tact_cell_eq`, () => {
        ctx.signature(`int __tact_cell_eq(cell a, cell b)`);
        ctx.write(`
            int __tact_cell_eq(cell a, cell b) inline {
                return (a.cell_hash() ==  b.cell_hash());
            }
        `);
    });
    ctx.fun(`__tact_cell_neq`, () => {
        ctx.signature(`int __tact_cell_neq(slice a, slice b)`);
        ctx.write(`
            int __tact_cell_neq(slice a, slice b) inline {
                return (a.cell_hash() !=  b.cell_hash());
            }
        `);
    });

    //
    // Sys Dict
    //

    ctx.fun(`__tact_dict_set_code`, () => {
        ctx.signature(`cell __tact_dict_set_code(cell dict, int id, cell code)`);
        ctx.write(`
            cell __tact_dict_set_code(cell dict, int id, cell code) inline {
                return udict_set_ref(dict, 16, id, code);
            }
        `);
    });

    ctx.fun(`__tact_dict_get_code`, () => {
        ctx.signature(`cell __tact_dict_get_code(cell dict, int id)`);
        ctx.write(`
            cell __tact_dict_get_code(cell dict, int id) inline {
                var (data, ok) = udict_get_ref?(dict, 16, id);
                throw_unless(${contractErrors.codeNotFound.id}, ok);
                return data;
            }
        `);
    });

    //
    // Tuples
    //

    ctx.fun(`__tact_tuple_create_0`, () => {
        ctx.signature(`tuple __tact_tuple_create_0()`);
        ctx.append(`tuple __tact_tuple_create_0() asm "NIL";`);
    });
    ctx.fun(`__tact_tuple_destroy_0`, () => {
        ctx.signature(`() __tact_tuple_destroy_0()`);
        ctx.append(`() __tact_tuple_destroy_0() inline {`);
        ctx.inIndent(() => {
            ctx.append(`return ();`)
        });
        ctx.append(`}`);
    });

    for (let i = 1; i < 64; i++) {
        ctx.fun(`__tact_tuple_create_${i}`, () => {
            let args: string[] = [];
            for (let j = 0; j < i; j++) {
                args.push(`X${j}`);
            }
            ctx.signature(`forall ${args.join(', ')} -> tuple __tact_tuple_create_${i}((${args.join(', ')}) v)`);
            ctx.append(`forall ${args.join(', ')} -> tuple __tact_tuple_create_${i}((${args.join(', ')}) v) asm "${i} TUPLE";`);
        });
        ctx.fun(`__tact_tuple_destroy_${i}`, () => {
            let args: string[] = [];
            for (let j = 0; j < i; j++) {
                args.push(`X${j}`);
            }
            ctx.signature(`forall ${args.join(', ')} -> (${args.join(', ')}) __tact_tuple_destroy_${i}(tuple v)`);
            ctx.append(`forall ${args.join(', ')} -> (${args.join(', ')}) __tact_tuple_destroy_${i}(tuple v) asm "${i} UNTUPLE";`);
        });
    }

    //
    // Strings
    //

    ctx.fun(`__tact_string_builder_start_comment`, () => {
        ctx.signature(`tuple __tact_string_builder_start_comment()`);
        ctx.write(`
            tuple __tact_string_builder_start_comment() inline {
                return ${ctx.used('__tact_string_builder_start')}(begin_cell().store_uint(0, 32));
            }
        `);
    });

    ctx.fun(`__tact_string_builder_start_tail_string`, () => {
        ctx.signature(`tuple __tact_string_builder_start_tail_string()`);
        ctx.write(`
            tuple __tact_string_builder_start_tail_string() inline {
                return ${ctx.used('__tact_string_builder_start')}(begin_cell().store_uint(0, 8));
            }
        `);
    });

    ctx.fun(`__tact_string_builder_start_string`, () => {
        ctx.signature(`tuple __tact_string_builder_start_string()`);
        ctx.write(`
            tuple __tact_string_builder_start_string() inline {
                return ${ctx.used('__tact_string_builder_start')}(begin_cell());
            }
        `);
    });

    ctx.fun(`__tact_string_builder_start`, () => {
        ctx.signature(`tuple __tact_string_builder_start(builder b)`);
        ctx.write(`
            tuple __tact_string_builder_start(builder b) inline {
                return tpush(tpush(empty_tuple(), b), null());
            }
        `);
    });

    ctx.fun(`__tact_string_builder_end`, () => {
        ctx.signature(`cell __tact_string_builder_end(tuple builders)`);
        ctx.write(`
            cell __tact_string_builder_end(tuple builders) inline {
                (builder b, tuple tail) = uncons(builders);
                cell c = b.end_cell();
                while(~ null?(tail)) {
                    (b, tail) = uncons(tail);
                    c = b.store_ref(c).end_cell();
                }
                return c;
            }
        `);
    });

    ctx.fun(`__tact_string_builder_end_slice`, () => {
        ctx.signature(`slice __tact_string_builder_end_slice(tuple builders)`);
        ctx.write(`
            slice __tact_string_builder_end_slice(tuple builders) inline {
                return ${ctx.used('__tact_string_builder_end')}(builders).begin_parse();
            }
        `);
    });

    ctx.fun(`__tact_string_builder_append`, () => {
        ctx.signature(`((tuple), ()) __tact_string_builder_append(tuple builders, slice sc)`);
        ctx.write(`
            ((tuple), ()) __tact_string_builder_append(tuple builders, slice sc) inline_ref {
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
            }
        `);
    });

    ctx.fun(`__tact_int_to_string`, () => {
        ctx.signature(`slice __tact_int_to_string(int src)`);
        ctx.write(`
            slice __tact_int_to_string(int src) inline_ref {
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
            }
        `);
    });

    ctx.fun(`__tact_float_to_string`, () => {
        ctx.signature(`slice __tact_float_to_string(int src, int digits)`);
        ctx.write(`
            slice __tact_float_to_string(int src, int digits) inline_ref {
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
            }
        `);
    });
}