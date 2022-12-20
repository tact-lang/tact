import { contractErrors } from "../../abi/errors";
import { WriterContext } from "../Writer";

export function writeStdlib(ctx: WriterContext) {
    ctx.fun('__tact_set', () => {
        ctx.append(`forall X -> tuple __tact_set(tuple x, X v, int i) asm "SETINDEXVARQ";`);
    });
    ctx.fun('__tact_nop', () => {
        ctx.append(`() __tact_nop() impure asm "NOP";`);
    });
    ctx.fun('__tact_not_null', () => {
        ctx.append(`forall X -> X __tact_not_null(X x) { throw_if(${contractErrors.null.id}, null?(x)); return x; }`);
    });
    ctx.fun('__tact_dict_delete', () => {
        ctx.append(`(cell, int) __tact_dict_delete(cell dict, int key_len, slice index) asm(index dict key_len) "DICTDEL";`)
    });
    ctx.fun('__tact_dict_set_ref', () => {
        ctx.append(`((cell), ()) __tact_dict_set_ref(cell dict, int key_len, slice index, cell value) asm(value index dict key_len) "DICTSETREF";`)
    });
    ctx.fun('__tact_dict_get', () => {
        ctx.append(`(slice, int) __tact_dict_get(cell dict, int key_len, slice index) asm(index dict key_len) "DICTGET" "NULLSWAPIFNOT";`);
    });
    ctx.fun('__tact_dict_get_ref', () => {
        ctx.append(`(cell, int) __tact_dict_get_ref(cell dict, int key_len, slice index) asm(index dict key_len) "DICTGETREF" "NULLSWAPIFNOT";`);
    });
    ctx.fun('__tact_debug', () => {
        ctx.append(`() __tact_debug(int msg) impure inline { int v = msg; v~dump(); }`);
    });
    ctx.fun('__tact_debug_str', () => {
        ctx.append(`forall X -> X __tact_debug_str(slice value) impure asm "STRDUMP";`);
    });

    ctx.fun('__tact_context', () => {
        ctx.append(`global (int, slice, int) __tact_context;`);
        ctx.append(`global cell __tact_context_sys;`);
    });
    ctx.fun('__tact_context_get', () => {
        ctx.used('__tact_context');
        ctx.append(`(int, slice, int) __tact_context_get() inline { return __tact_context; }`);
    })
    ctx.fun('__tact_load_address', () => {
        ctx.append(`(slice, slice) __tact_load_address(slice cs) inline {`);
        ctx.inIndent(() => {
            ctx.append(`slice raw = cs~load_msg_addr();`);
            ctx.append(`return (cs, raw);`);
        });
        ctx.append(`}`);
    });
    ctx.fun('__tact_store_address', () => {
        ctx.append(`builder __tact_store_address(builder b, slice address) inline {`);
        ctx.inIndent(() => {
            ctx.append(`b = b.store_slice(address);`) // Is std address
            ctx.append(`return b;`);
        });
        ctx.append(`}`);
    });
    ctx.fun('__tact_compute_contract_address', () => {
        ctx.append('slice __tact_compute_contract_address(int chain, cell code, cell data) {')
        ctx.inIndent(() => {

            // Compute hash
            ctx.append(`var b = begin_cell();`);
            ctx.append(`b = b.store_uint(0, 2);`);
            ctx.append(`b = b.store_uint(3, 2);`);
            ctx.append(`b = b.store_uint(0, 1);`);
            ctx.append(`b = b.store_ref(code);`);
            ctx.append(`b = b.store_ref(data);`);
            ctx.append(`var hash = cell_hash(b.end_cell());`);

            // Compute address
            ctx.append(`var b2 = begin_cell();`) // Is std address
            ctx.append(`b2 = b2.store_uint(2, 2);`) // Is std address
            ctx.append(`b2 = b2.store_uint(0, 1);`) // Non-unicast
            ctx.append(`b2 = b2.store_int(chain, 8);`) // Workchain (0 or -1)
            ctx.append(`b2 = b2.store_uint(hash, 256);`) // Address hash
            ctx.append(`return b2.end_cell().begin_parse();`);
        });
        ctx.append('}');
    });
    ctx.fun('__tact_to_tuple', () => {
        ctx.append(`forall X -> tuple __tact_to_tuple(X x) impure asm "NOP";`);
    });
    ctx.fun('__tact_from_tuple', () => {
        ctx.append(`forall X -> X __tact_from_tuple(tuple x) impure asm "NOP";`);
    });

    //
    // Dict Int -> Int
    //

    ctx.fun('__tact_dict_set_int_int', () => {
        ctx.append(`(cell, ()) __tact_dict_set_int_int(cell d, int kl, int k, int v, int vl) {`);
        ctx.inIndent(() => {
            ctx.append(`if (null?(v)) {`);
            ctx.inIndent(() => {
                ctx.append(`var (r, ok) = idict_delete?(d, kl, k);`);
                ctx.append(`return (r, ());`);
            });
            ctx.append(`} else {`);
            ctx.inIndent(() => {
                ctx.append(`return (idict_set_builder(d, kl, k, begin_cell().store_int(v, vl)), ());`);
            });
            ctx.append(`}`);
        });
        ctx.append('}')
    });
    ctx.fun('__tact_dict_get_int_int', () => {
        ctx.append(`int __tact_dict_get_int_int(cell d, int kl, int k, int vl) {`);
        ctx.inIndent(() => {
            ctx.append(`var (r, ok) = idict_get?(d, kl, k);`);
            ctx.append(`if (ok) {`);
            ctx.inIndent(() => {
                ctx.append(`return r~load_int(vl);`);
            });
            ctx.append(`} else {`);
            ctx.inIndent(() => {
                ctx.append(`return null();`);
            });
            ctx.append(`}`);
        });
        ctx.append('}')
    });

    //
    // Dict Int -> Cell
    //

    ctx.fun('__tact_dict_set_int_cell', () => {
        ctx.append(`(cell, ()) __tact_dict_set_int_cell(cell d, int kl, int k, cell v) {`);
        ctx.inIndent(() => {
            ctx.append(`if (null?(v)) {`);
            ctx.inIndent(() => {
                ctx.append(`var (r, ok) = idict_delete?(d, kl, k);`);
                ctx.append(`return (r, ());`);
            });
            ctx.append(`} else {`);
            ctx.inIndent(() => {
                ctx.append(`return (idict_set_ref(d, kl, k, v), ());`);
            });
            ctx.append(`}`);
        });
        ctx.append('}')
    });
    ctx.fun('__tact_dict_get_int_cell', () => {
        ctx.append(`cell __tact_dict_get_int_cell(cell d, int kl, int k) {`);
        ctx.inIndent(() => {
            ctx.append(`var (r, ok) = idict_get_ref?(d, kl, k);`);
            ctx.append(`if (ok) {`);
            ctx.inIndent(() => {
                ctx.append(`return r;`);
            });
            ctx.append(`} else {`);
            ctx.inIndent(() => {
                ctx.append(`return null();`);
            });
            ctx.append(`}`);
        });
        ctx.append('}')
    });

    //
    // Dict Int -> Slice
    //

    ctx.fun('__tact_dict_set_int_slice', () => {
        ctx.append(`(cell, ()) __tact_dict_set_int_slice(cell d, int kl, int k, slice v) {`);
        ctx.inIndent(() => {
            ctx.append(`if (null?(v)) {`);
            ctx.inIndent(() => {
                ctx.append(`var (r, ok) = idict_delete?(d, kl, k);`);
                ctx.append(`return (r, ());`);
            });
            ctx.append(`} else {`);
            ctx.inIndent(() => {
                ctx.append(`return (idict_set(d, kl, k, v), ());`);
            });
            ctx.append(`}`);
        });
        ctx.append('}')
    });
    ctx.fun('__tact_dict_get_int_slice', () => {
        ctx.append(`slice __tact_dict_get_int_slice(cell d, int kl, int k) {`);
        ctx.inIndent(() => {
            ctx.append(`var (r, ok) = idict_get?(d, kl, k);`);
            ctx.append(`if (ok) {`);
            ctx.inIndent(() => {
                ctx.append(`return r;`);
            });
            ctx.append(`} else {`);
            ctx.inIndent(() => {
                ctx.append(`return null();`);
            });
            ctx.append(`}`);
        });
        ctx.append('}')
    });

    //
    // Dict Slice -> Int
    //

    ctx.fun('__tact_dict_set_slice_int', () => {
        ctx.append(`(cell, ()) __tact_dict_set_slice_int(cell d, int kl, slice k, int v, int vl) {`);
        ctx.inIndent(() => {
            ctx.append(`if (null?(v)) {`);
            ctx.inIndent(() => {
                ctx.used('__tact_dict_delete');
                ctx.append(`var (r, ok) = __tact_dict_delete(d, kl, k);`);
                ctx.append(`return (r, ());`);
            });
            ctx.append(`} else {`);
            ctx.inIndent(() => {
                ctx.append(`return (dict_set_builder(d, kl, k, begin_cell().store_int(v, vl)), ());`);
            });
            ctx.append(`}`);
        });
        ctx.append('}')
    });
    ctx.fun('__tact_dict_get_slice_int', () => {
        ctx.append(`int __tact_dict_get_slice_int(cell d, int kl, slice k, int vl) {`);
        ctx.inIndent(() => {
            ctx.used(`__tact_dict_get`);
            ctx.append(`var (r, ok) = __tact_dict_get(d, kl, k);`);
            ctx.append(`if (ok) {`);
            ctx.inIndent(() => {
                ctx.append(`return r~load_int(vl);`);
            });
            ctx.append(`} else {`);
            ctx.inIndent(() => {
                ctx.append(`return null();`);
            });
            ctx.append(`}`);
        });
        ctx.append('}')
    });

    //
    // Dict Slice -> Cell
    //

    ctx.fun('__tact_dict_set_slice_cell', () => {
        ctx.append(`(cell, ()) __tact_dict_set_slice_cell(cell d, int kl, slice k, cell v) {`);
        ctx.inIndent(() => {
            ctx.append(`if (null?(v)) {`);
            ctx.inIndent(() => {
                ctx.used(`__tact_dict_delete`);
                ctx.append(`var (r, ok) = __tact_dict_delete(d, kl, k);`);
                ctx.append(`return (r, ());`);
            });
            ctx.append(`} else {`);
            ctx.inIndent(() => {
                ctx.used('__tact_dict_set_ref');
                ctx.append(`return __tact_dict_set_ref(d, kl, k, v);`);
            });
            ctx.append(`}`);
        });
        ctx.append('}')
    });
    ctx.fun(`__tact_dict_get_slice_cell`, () => {
        ctx.append(`cell __tact_dict_get_slice_cell(cell d, int kl, slice k) {`);
        ctx.inIndent(() => {
            ctx.used(`__tact_dict_get_ref`);
            ctx.append(`var (r, ok) = __tact_dict_get_ref(d, kl, k);`);
            ctx.append(`if (ok) {`);
            ctx.inIndent(() => {
                ctx.append(`return r;`);
            });
            ctx.append(`} else {`);
            ctx.inIndent(() => {
                ctx.append(`return null();`);
            });
            ctx.append(`}`);
        });
        ctx.append('}')
    });

    //
    // Address
    // 

    ctx.fun(`__tact_address_eq`, () => {
        ctx.append(`int __tact_address_eq(slice a, slice b) inline {`);
        ctx.inIndent(() => {
            ctx.append(`return equal_slice_bits(a, b);`);
        });
        ctx.append(`}`);
    });
    ctx.fun(`__tact_address_neq`, () => {
        ctx.append(`int __tact_address_neq(slice a, slice b) inline {`);
        ctx.inIndent(() => {
            ctx.append(`return ~ equal_slice_bits(a, b);`);
        });
        ctx.append(`}`);
    });

    //
    // Cell Eq
    // 

    ctx.fun(`__tact_cell_eq`, () => {
        ctx.append(`int __tact_cell_eq(cell a, cell b) inline {`);
        ctx.inIndent(() => {
            ctx.append(`return (a.cell_hash() ==  b.cell_hash());`);
        });
        ctx.append(`}`);
    });
    ctx.fun(`__tact_cell_neq`, () => {
        ctx.append(`int __tact_cell_neq(slice a, slice b) inline {`);
        ctx.inIndent(() => {
            ctx.append(`return (a.cell_hash() !=  b.cell_hash());`);
        });
        ctx.append(`}`);
    });

    //
    // Sys Dict
    //

    ctx.fun(`__tact_dict_set_code`, () => {
        ctx.append(`cell __tact_dict_set_code(cell dict, int id, cell code) inline {`);
        ctx.inIndent(() => {
            ctx.append(`return udict_set_ref(dict, 16, id, code);`);
        });
        ctx.append(`}`);
    });
    ctx.fun(`__tact_dict_get_code`, () => {
        ctx.append(`cell __tact_dict_get_code(cell dict, int id) inline {`);
        ctx.inIndent(() => {
            ctx.append(`var (data, ok) = udict_get_ref?(dict, 16, id);`);
            ctx.append(`throw_unless(100, ok);`);
            ctx.append(`return data;`);
        });
        ctx.append(`}`);
    });

    //
    // Tuples
    //

    ctx.fun(`__tact_tuple_create_0`, () => {
        ctx.append(`tuple __tact_tuple_create_0() asm "NIL";`);
    });
    ctx.fun(`__tact_tuple_destroy_0`, () => {
        ctx.append(`() __tact_tuple_destroy_0() {`);
        ctx.inIndent(() => {
            ctx.append(`return ();`)
        });
        ctx.append(`}`);
    });

    for (let i = 1; i < 15; i++) {
        ctx.fun(`__tact_tuple_create_${i}`, () => {
            let args: string[] = [];
            for (let j = 0; j < i; j++) {
                args.push(`X${j}`);
            }
            ctx.append(`forall ${args.join(', ')} -> tuple __tact_tuple_create_${i}((${args.join(', ')}) v) asm "${i} TUPLE";`);
        });
        ctx.fun(`__tact_tuple_destroy_${i}`, () => {
            let args: string[] = [];
            for (let j = 0; j < i; j++) {
                args.push(`X${j}`);
            }
            ctx.append(`forall ${args.join(', ')} -> (${args.join(', ')}) __tact_tuple_destroy_${i}(tuple v) asm "${i} UNTUPLE";`);
        });
    }

    //
    // Strings
    //

    ctx.fun(`__tact_string_builder_start_comment`, () => {
        ctx.used(`__tact_string_builder_start`);
        ctx.append(`tuple __tact_string_builder_start_comment() inline {`);
        ctx.inIndent(() => {
            ctx.append(`return __tact_string_builder_start(true);`);
        });
        ctx.append(`}`);
    });

    ctx.fun(`__tact_string_builder_start_string`, () => {
        ctx.used(`__tact_string_builder_start`);
        ctx.append(`tuple __tact_string_builder_start_string() inline {`);
        ctx.inIndent(() => {
            ctx.append(`return __tact_string_builder_start(false);`);
        });
        ctx.append(`}`);
    });

    ctx.fun(`__tact_string_builder_start`, () => {
        ctx.append(`tuple __tact_string_builder_start(int comment) inline {`);
        ctx.inIndent(() => {
            ctx.append(`builder b = begin_cell();`);
            ctx.append(`if (comment) {`);
            ctx.inIndent(() => {
                ctx.append(`b = store_uint(b, 0, 32);`);
            });
            ctx.append(`}`);
            ctx.append(`return tpush(tpush(empty_tuple(), b), null());`);
        });
        ctx.append(`}`);
    });

    ctx.fun(`__tact_string_builder_end`, () => {
        ctx.append(`cell __tact_string_builder_end(tuple builders) {`);
        ctx.inIndent(() => {
            ctx.append(`(builder b, tuple tail) = uncons(builders);`);
            ctx.append(`cell c = b.end_cell();`);
            ctx.append(`while(~ null?(tail)) {`);
            ctx.inIndent(() => {
                ctx.append(`(b, tail) = uncons(tail);`);
                ctx.append(`c = b.store_ref(c).end_cell();`);
            });
            ctx.append(`}`);
            ctx.append(`return c;`);
        });
        ctx.append(`}`);
    });
    
    ctx.fun(`__tact_string_builder_end_slice`, () => {
        ctx.append(`slice __tact_string_builder_end_slice(tuple builders) {`);
        ctx.inIndent(() => {
            ctx.used(`__tact_string_builder_end`);
            ctx.append(`return __tact_string_builder_end(builders).begin_parse();`)
        });
        ctx.append(`}`);
    });

    ctx.fun(`__tact_string_builder_append`, () => {
        ctx.append(`((tuple), ()) __tact_string_builder_append(tuple builders, slice sc) {`);
        ctx.inIndent(() => {
            ctx.append(`int sliceRefs = slice_refs(sc);`);
            ctx.append(`int sliceBits = slice_bits(sc);`);
            ctx.append();
            ctx.append(`while((sliceBits > 0) | (sliceRefs > 0)) {`);
            ctx.inIndent(() => {
                ctx.append();
                ctx.append(`;; Load the current builder`);
                ctx.append(`(builder b, tuple tail) = uncons(builders);`);
                ctx.append(`int remBytes = 127 - (builder_bits(b) / 8);`);
                ctx.append(`int exBytes = sliceBits / 8;`);
                ctx.append();
                ctx.append(`;; Append bits`);
                ctx.append(`int amount = min(remBytes, exBytes);`);
                ctx.append(`if (amount > 0) {`);
                ctx.inIndent(() => {
                    ctx.append(`slice read = sc~load_bits(amount * 8);`);
                    ctx.append(`b = b.store_slice(read);`);
                });
                ctx.append(`}`);
                ctx.append();
                ctx.append(`;; Update builders`);
                ctx.append(`builders = cons(b, tail);`);
                ctx.append();
                ctx.append(`;; Check if we need to add a new cell and continue`);
                ctx.append(`if (exBytes - amount > 0) {`);
                ctx.inIndent(() => {
                    ctx.append(`var bb = begin_cell();`);
                    ctx.append(`builders = cons(bb, builders);`);
                    ctx.append(`sliceBits = (exBytes - amount) * 8;`);
                });
                ctx.append(`} elseif (sliceRefs > 0) {`);
                ctx.inIndent(() => {
                    ctx.append(`sc = sc~load_ref().begin_parse();`);
                    ctx.append(`sliceRefs = slice_refs(sc);`);
                    ctx.append(`sliceBits = slice_bits(sc);`);
                });
                ctx.append(`} else {`);
                ctx.inIndent(() => {
                    ctx.append(`sliceBits = 0;`);
                    ctx.append(`sliceRefs = 0;`);
                });
                ctx.append(`}`);
            });
            ctx.append(`}`);
            ctx.append();
            ctx.append(`return ((builders), ());`)
        });
        ctx.append(`}`);
    });
}