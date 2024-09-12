import { WriterContext } from "../Writer";
import { contractErrors } from "../../abi/errors";
import { enabledMasterchain } from "../../config/features";

export function writeStdlib(ctx: WriterContext): void {
    const parse = (code: string) =>
        ctx.parse(code, { context: "stdlib" });

    //
    // stdlib extension functions
    //
    //
    ctx.skip("__tact_set");
    ctx.skip("__tact_nop");
    ctx.skip("__tact_str_to_slice");
    ctx.skip("__tact_slice_to_str");
    ctx.skip("__tact_address_to_slice");

    //
    // Addresses
    //

    parse(
        `slice __tact_verify_address(slice address) impure inline {
        throw_unless(${contractErrors.invalidAddress.id}, address.slice_bits() == 267);
        var h = address.preload_uint(11);

        ${
            enabledMasterchain(ctx.ctx)
                ? `
            throw_unless(${contractErrors.invalidAddress.id}, (h == 1024) | (h == 1279));
        `
                : `
            throw_if(${contractErrors.masterchainNotEnabled.id}, h == 1279);
            throw_unless(${contractErrors.invalidAddress.id}, h == 1024);
        `
        }

        return address;
    }`,
    );

    parse(`(slice, int) __tact_load_bool(slice s) asm(s -> 1 0) "1 LDI";`);

    parse(
        `(slice, slice) __tact_load_address(slice cs) inline {
        slice raw = cs~load_msg_addr();
        return (cs, __tact_verify_address(raw));
    }`,
    );

    parse(
        `(slice, slice) __tact_load_address_opt(slice cs) inline {
        if (cs.preload_uint(2) != 0) {
            slice raw = cs~load_msg_addr();
            return (cs, __tact_verify_address(raw));
        } else {
            cs~skip_bits(2);
            return (cs, null());
        }
    }`,
    );

    parse(
        `builder __tact_store_address(builder b, slice address) inline {
        return b.store_slice(__tact_verify_address(address));
    }`,
    );

    parse(
        `builder __tact_store_address_opt(builder b, slice address) inline {
        if (null?(address)) {
            b = b.store_uint(0, 2);
            return b;
        } else {
            return __tact_store_address(b, address);
        }
    }`,
    );

    parse(
        `slice __tact_create_address(int chain, int hash) inline {
        var b = begin_cell();
        b = b.store_uint(2, 2);
        b = b.store_uint(0, 1);
        b = b.store_int(chain, 8);
        b = b.store_uint(hash, 256);
        var addr = b.end_cell().begin_parse();
        return __tact_verify_address(addr);
    }`,
    );

    parse(
        `slice __tact_compute_contract_address(int chain, cell code, cell data) inline {
        var b = begin_cell();
        b = b.store_uint(0, 2);
        b = b.store_uint(3, 2);
        b = b.store_uint(0, 1);
        b = b.store_ref(code);
        b = b.store_ref(data);
        var hash = cell_hash(b.end_cell());
        return __tact_create_address(chain, hash);
    }`,
    );

    parse(
        `int __tact_my_balance() inline {
        return pair_first(get_balance());
    }`,
    );

    parse(
        `forall X -> X __tact_not_null(X x) inline {
        throw_if(${contractErrors.null.id}, null?(x));
        return x;
    }`,
    );

    parse(
        `(cell, int) __tact_dict_delete(cell dict, int key_len, slice index) asm(index dict key_len) "DICTDEL";`,
    );

    parse(
        `(cell, int) __tact_dict_delete_int(cell dict, int key_len, int index) asm(index dict key_len) "DICTIDEL";`,
    );

    parse(
        `(cell, int) __tact_dict_delete_uint(cell dict, int key_len, int index) asm(index dict key_len) "DICTUDEL";`,
    );

    parse(
        `((cell), ()) __tact_dict_set_ref(cell dict, int key_len, slice index, cell value) asm(value index dict key_len) "DICTSETREF";`,
    );

    parse(
        `(slice, int) __tact_dict_get(cell dict, int key_len, slice index) asm(index dict key_len) "DICTGET" "NULLSWAPIFNOT";`,
    );

    parse(
        `(cell, int) __tact_dict_get_ref(cell dict, int key_len, slice index) asm(index dict key_len) "DICTGETREF" "NULLSWAPIFNOT";`,
    );

    parse(
        `(slice, slice, int) __tact_dict_min(cell dict, int key_len) asm(dict key_len -> 1 0 2) "DICTMIN" "NULLSWAPIFNOT2";`,
    );

    parse(
        `(slice, cell, int) __tact_dict_min_ref(cell dict, int key_len) asm(dict key_len -> 1 0 2) "DICTMINREF" "NULLSWAPIFNOT2";`,
    );

    parse(
        `(slice, slice, int) __tact_dict_next(cell dict, int key_len, slice pivot) asm(pivot dict key_len -> 1 0 2) "DICTGETNEXT" "NULLSWAPIFNOT2";`,
    );

    parse(
        `(slice, cell, int) __tact_dict_next_ref(cell dict, int key_len, slice pivot) inline {
        var (key, value, flag) = __tact_dict_next(dict, key_len, pivot);
        if (flag) {
            return (key, value~load_ref(), flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    parse(
        `forall X -> () __tact_debug(X value, slice debug_print) impure asm "STRDUMP" "DROP" "s0 DUMP" "DROP";`,
    );

    parse(
        `() __tact_debug_str(slice value, slice debug_print) impure asm "STRDUMP" "DROP" "STRDUMP" "DROP";`,
    );

    parse(
        `() __tact_debug_bool(int value, slice debug_print) impure {
        if (value) {
            __tact_debug_str("true", debug_print);
        } else {
            __tact_debug_str("false", debug_print);
        }
    }`,
    );

    parse(
        `(slice) __tact_preload_offset(slice s, int offset, int bits) inline asm "SDSUBSTR";`,
    );

    parse(
        `(slice) __tact_crc16(slice data) inline_ref {
        slice new_data = begin_cell()
            .store_slice(data)
            .store_slice("0000"s)
            .end_cell().begin_parse();
        int reg = 0;
        while (~new_data.slice_data_empty?()) {
            int byte = new_data~load_uint(8);
            int mask = 0x80;
            while (mask > 0) {
                reg <<= 1;
                if (byte & mask) {
                    reg += 1;
                }
                mask >>= 1;
                if (reg > 0xffff) {
                    reg &= 0xffff;
                    reg ^= 0x1021;
                }
            }
        }
        (int q, int r) = divmod(reg, 256);
        return begin_cell()
            .store_uint(q, 8)
            .store_uint(r, 8)
            .end_cell().begin_parse();
    }`,
    );

    parse(
        `(slice) __tact_base64_encode(slice data) inline {
        slice chars = "4142434445464748494A4B4C4D4E4F505152535455565758595A6162636465666768696A6B6C6D6E6F707172737475767778797A303132333435363738392D5F"s;
        builder res = begin_cell();

        while (data.slice_bits() >= 24) {
            (int bs1, int bs2, int bs3) = (data~load_uint(8), data~load_uint(8), data~load_uint(8));

            int n = (bs1 << 16) | (bs2 << 8) | bs3;

            res = res
                .store_slice(__tact_preload_offset(chars, ((n >> 18) & 63) * 8, 8))
                .store_slice(__tact_preload_offset(chars, ((n >> 12) & 63) * 8, 8))
                .store_slice(__tact_preload_offset(chars, ((n >>  6) & 63) * 8, 8))
                .store_slice(__tact_preload_offset(chars, ((n      ) & 63) * 8, 8));
        }

        return res.end_cell().begin_parse();
    }`,
    );

    parse(
        `(slice) __tact_address_to_user_friendly(slice address) inline {
        (int wc, int hash) = address.parse_std_addr();

        slice user_friendly_address = begin_cell()
            .store_slice("11"s)
            .store_uint((wc + 0x100) % 0x100, 8)
            .store_uint(hash, 256)
        .end_cell().begin_parse();

        slice checksum = __tact_crc16(user_friendly_address);
        slice user_friendly_address_with_checksum = begin_cell()
            .store_slice(user_friendly_address)
            .store_slice(checksum)
        .end_cell().begin_parse();

        return __tact_base64_encode(user_friendly_address_with_checksum);
    }`,
    );

    parse(
        `() __tact_debug_address(slice address, slice debug_print) impure {
        __tact_debug_str(__tact_address_to_user_friendly(address), debug_print);
    }`,
    );

    parse(
        `() __tact_debug_stack(slice debug_print) impure asm "STRDUMP" "DROP" "DUMPSTK";`,
    );

    parse(
        `(int, slice, int, slice) __tact_context_get() inline {
        return __tact_context;
    }`,
    );

    parse(
        `slice __tact_context_get_sender() inline {
        return __tact_context_sender;
    }`,
    );

    parse(
        `() __tact_prepare_random() impure inline {
        if (null?(__tact_randomized)) {
            randomize_lt();
            __tact_randomized = true;
        }
    }`,
    );

    parse(
        `builder __tact_store_bool(builder b, int v) inline {
        return b.store_int(v, 1);
    }`,
    );

    parse(`forall X -> tuple __tact_to_tuple(X x) asm "NOP";`);

    parse(`forall X -> X __tact_from_tuple(tuple x) asm "NOP";`);

    //
    // Dict Int -> Int
    //

    parse(
        `(cell, ()) __tact_dict_set_int_int(cell d, int kl, int k, int v, int vl) inline {
        if (null?(v)) {
            var (r, ok) = idict_delete?(d, kl, k);
            return (r, ());
        } else {
            return (idict_set_builder(d, kl, k, begin_cell().store_int(v, vl)), ());
        }
    }`,
    );

    parse(
        `int __tact_dict_get_int_int(cell d, int kl, int k, int vl) inline {
        var (r, ok) = idict_get?(d, kl, k);
        if (ok) {
            return r~load_int(vl);
        } else {
            return null();
        }
    }`,
    );

    parse(
        `(int, int, int) __tact_dict_min_int_int(cell d, int kl, int vl) inline {
        var (key, value, flag) = idict_get_min?(d, kl);
        if (flag) {
            return (key, value~load_int(vl), flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    parse(
        `(int, int, int) __tact_dict_next_int_int(cell d, int kl, int pivot, int vl) inline {
        var (key, value, flag) = idict_get_next?(d, kl, pivot);
        if (flag) {
            return (key, value~load_int(vl), flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    //
    // Dict Int -> Uint
    //

    parse(
        `(cell, ()) __tact_dict_set_uint_int(cell d, int kl, int k, int v, int vl) inline {
        if (null?(v)) {
            var (r, ok) = udict_delete?(d, kl, k);
            return (r, ());
        } else {
            return (udict_set_builder(d, kl, k, begin_cell().store_int(v, vl)), ());
        }
    }`,
    );

    parse(
        `int __tact_dict_get_uint_int(cell d, int kl, int k, int vl) inline {
        var (r, ok) = udict_get?(d, kl, k);
        if (ok) {
            return r~load_int(vl);
        } else {
            return null();
        }
    }`,
    );

    parse(
        `(int, int, int) __tact_dict_min_uint_int(cell d, int kl, int vl) inline {
        var (key, value, flag) = udict_get_min?(d, kl);
        if (flag) {
            return (key, value~load_int(vl), flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    parse(
        `(int, int, int) __tact_dict_next_uint_int(cell d, int kl, int pivot, int vl) inline {
        var (key, value, flag) = udict_get_next?(d, kl, pivot);
        if (flag) {
            return (key, value~load_int(vl), flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    //
    // Dict Uint -> Uint
    //

    parse(
        `(cell, ()) __tact_dict_set_uint_uint(cell d, int kl, int k, int v, int vl) inline {
        if (null?(v)) {
            var (r, ok) = udict_delete?(d, kl, k);
            return (r, ());
        } else {
            return (udict_set_builder(d, kl, k, begin_cell().store_uint(v, vl)), ());
        }
    }`,
    );

    parse(
        `int __tact_dict_get_uint_uint(cell d, int kl, int k, int vl) inline {
        var (r, ok) = udict_get?(d, kl, k);
        if (ok) {
            return r~load_uint(vl);
        } else {
            return null();
        }
    }`,
    );

    parse(
        `(int, int, int) __tact_dict_min_uint_uint(cell d, int kl, int vl) inline {
        var (key, value, flag) = udict_get_min?(d, kl);
        if (flag) {
            return (key, value~load_uint(vl), flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    parse(
        `(int, int, int) __tact_dict_next_uint_uint(cell d, int kl, int pivot, int vl) inline {
        var (key, value, flag) = udict_get_next?(d, kl, pivot);
        if (flag) {
            return (key, value~load_uint(vl), flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    //
    // Dict Int -> Cell
    //

    parse(
        `(cell, ()) __tact_dict_set_int_cell(cell d, int kl, int k, cell v) inline {
        if (null?(v)) {
            var (r, ok) = idict_delete?(d, kl, k);
            return (r, ());
        } else {
            return (idict_set_ref(d, kl, k, v), ());
        }
    }`,
    );

    parse(
        `cell __tact_dict_get_int_cell(cell d, int kl, int k) inline {
        var (r, ok) = idict_get_ref?(d, kl, k);
        if (ok) {
            return r;
        } else {
            return null();
        }
    }`,
    );

    parse(
        `(int, cell, int) __tact_dict_min_int_cell(cell d, int kl) inline {
        var (key, value, flag) = idict_get_min_ref?(d, kl);
        if (flag) {
            return (key, value, flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    parse(
        `(int, cell, int) __tact_dict_next_int_cell(cell d, int kl, int pivot) inline {
        var (key, value, flag) = idict_get_next?(d, kl, pivot);
        if (flag) {
            return (key, value~load_ref(), flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    //
    // Dict Uint -> Cell
    //

    parse(
        `(cell, ()) __tact_dict_set_uint_cell(cell d, int kl, int k, cell v) inline {
        if (null?(v)) {
            var (r, ok) = udict_delete?(d, kl, k);
            return (r, ());
        } else {
            return (udict_set_ref(d, kl, k, v), ());
        }
    }`,
    );

    parse(
        `cell __tact_dict_get_uint_cell(cell d, int kl, int k) inline {
        var (r, ok) = udict_get_ref?(d, kl, k);
        if (ok) {
            return r;
        } else {
            return null();
        }
    }`,
    );

    parse(
        `(int, cell, int) __tact_dict_min_uint_cell(cell d, int kl) inline {
        var (key, value, flag) = udict_get_min_ref?(d, kl);
        if (flag) {
            return (key, value, flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    parse(
        `(int, cell, int) __tact_dict_next_uint_cell(cell d, int kl, int pivot) inline {
        var (key, value, flag) = udict_get_next?(d, kl, pivot);
        if (flag) {
            return (key, value~load_ref(), flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    //
    // Dict Int -> Slice
    //

    parse(
        `(cell, ()) __tact_dict_set_int_slice(cell d, int kl, int k, slice v) inline {
        if (null?(v)) {
            var (r, ok) = idict_delete?(d, kl, k);
            return (r, ());
        } else {
            return (idict_set(d, kl, k, v), ());
        }
    }`,
    );

    parse(
        `slice __tact_dict_get_int_slice(cell d, int kl, int k) inline {
        var (r, ok) = idict_get?(d, kl, k);
        if (ok) {
            return r;
        } else {
            return null();
        }
    }`,
    );

    parse(
        `(int, slice, int) __tact_dict_min_int_slice(cell d, int kl) inline {
        var (key, value, flag) = idict_get_min?(d, kl);
        if (flag) {
            return (key, value, flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    parse(
        `(int, slice, int) __tact_dict_next_int_slice(cell d, int kl, int pivot) inline {
        var (key, value, flag) = idict_get_next?(d, kl, pivot);
        if (flag) {
            return (key, value, flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    //
    // Dict Uint -> Slice
    //

    parse(
        `(cell, ()) __tact_dict_set_uint_slice(cell d, int kl, int k, slice v) inline {
        if (null?(v)) {
            var (r, ok) = udict_delete?(d, kl, k);
            return (r, ());
        } else {
            return (udict_set(d, kl, k, v), ());
        }
    }`,
    );

    parse(
        `slice __tact_dict_get_uint_slice(cell d, int kl, int k) inline {
        var (r, ok) = udict_get?(d, kl, k);
        if (ok) {
            return r;
        } else {
            return null();
        }
    }`,
    );

    parse(
        `(int, slice, int) __tact_dict_min_uint_slice(cell d, int kl) inline {
        var (key, value, flag) = udict_get_min?(d, kl);
        if (flag) {
            return (key, value, flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    parse(
        `(int, slice, int) __tact_dict_next_uint_slice(cell d, int kl, int pivot) inline {
        var (key, value, flag) = udict_get_next?(d, kl, pivot);
        if (flag) {
            return (key, value, flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    //
    // Dict Slice -> Int
    //

    parse(
        `(cell, ()) __tact_dict_set_slice_int(cell d, int kl, slice k, int v, int vl) inline {
        if (null?(v)) {
            var (r, ok) = __tact_dict_delete(d, kl, k);
            return (r, ());
        } else {
            return (dict_set_builder(d, kl, k, begin_cell().store_int(v, vl)), ());
        }
    }`,
    );

    parse(
        `int __tact_dict_get_slice_int(cell d, int kl, slice k, int vl) inline {
        var (r, ok) = __tact_dict_get(d, kl, k);
        if (ok) {
            return r~load_int(vl);
        } else {
            return null();
        }
    }`,
    );

    parse(
        `(slice, int, int) __tact_dict_min_slice_int(cell d, int kl, int vl) inline {
        var (key, value, flag) = __tact_dict_min(d, kl);
        if (flag) {
            return (key, value~load_int(vl), flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    parse(
        `(slice, int, int) __tact_dict_next_slice_int(cell d, int kl, slice pivot, int vl) inline {
        var (key, value, flag) = __tact_dict_next(d, kl, pivot);
        if (flag) {
            return (key, value~load_int(vl), flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    //
    // Dict Slice -> UInt
    //

    parse(
        `(cell, ()) __tact_dict_set_slice_uint(cell d, int kl, slice k, int v, int vl) inline {
        if (null?(v)) {
            var (r, ok) = __tact_dict_delete(d, kl, k);
            return (r, ());
        } else {
            return (dict_set_builder(d, kl, k, begin_cell().store_uint(v, vl)), ());
        }
    }`,
    );

    parse(
        `int __tact_dict_get_slice_uint(cell d, int kl, slice k, int vl) inline {
        var (r, ok) = __tact_dict_get(d, kl, k);
        if (ok) {
            return r~load_uint(vl);
        } else {
            return null();
        }
    }`,
    );

    parse(
        `(slice, int, int) __tact_dict_min_slice_uint(cell d, int kl, int vl) inline {
        var (key, value, flag) = __tact_dict_min(d, kl);
        if (flag) {
            return (key, value~load_uint(vl), flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    parse(
        `(slice, int, int) __tact_dict_next_slice_uint(cell d, int kl, slice pivot, int vl) inline {
        var (key, value, flag) = __tact_dict_next(d, kl, pivot);
        if (flag) {
            return (key, value~load_uint(vl), flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    //
    // Dict Slice -> Cell
    //

    parse(
        `(cell, ()) __tact_dict_set_slice_cell(cell d, int kl, slice k, cell v) inline {
        if (null?(v)) {
            var (r, ok) = __tact_dict_delete(d, kl, k);
            return (r, ());
        } else {
            return __tact_dict_set_ref(d, kl, k, v);
        }
    }`,
    );

    parse(
        `cell __tact_dict_get_slice_cell(cell d, int kl, slice k) inline {
        var (r, ok) = __tact_dict_get_ref(d, kl, k);
        if (ok) {
            return r;
        } else {
            return null();
        }
    }`,
    );

    parse(
        `(slice, cell, int) __tact_dict_min_slice_cell(cell d, int kl) inline {
        var (key, value, flag) = __tact_dict_min_ref(d, kl);
        if (flag) {
            return (key, value, flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    parse(
        `(slice, cell, int) __tact_dict_next_slice_cell(cell d, int kl, slice pivot) inline {
        var (key, value, flag) = __tact_dict_next(d, kl, pivot);
        if (flag) {
            return (key, value~load_ref(), flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    //
    // Dict Slice -> Slice
    //

    parse(
        `(cell, ()) __tact_dict_set_slice_slice(cell d, int kl, slice k, slice v) inline {
        if (null?(v)) {
            var (r, ok) = __tact_dict_delete(d, kl, k);
            return (r, ());
        } else {
            return (dict_set_builder(d, kl, k, begin_cell().store_slice(v)), ());
        }
    }`,
    );

    parse(
        `slice __tact_dict_get_slice_slice(cell d, int kl, slice k) inline {
        var (r, ok) = __tact_dict_get(d, kl, k);
        if (ok) {
            return r;
        } else {
            return null();
        }
    }`,
    );

    parse(
        `(slice, slice, int) __tact_dict_min_slice_slice(cell d, int kl) inline {
        var (key, value, flag) = __tact_dict_min(d, kl);
        if (flag) {
            return (key, value, flag);
        } else {
            return (null(), null(), flag);
        }
    }`,
    );

    parse(
        `(slice, slice, int) __tact_dict_next_slice_slice(cell d, int kl, slice pivot) inline {
        return __tact_dict_next(d, kl, pivot);
    }`,
    );

    //
    // Address
    //

    parse(
        `int __tact_slice_eq_bits(slice a, slice b) inline {
        return equal_slice_bits(a, b);
    }`,
    );

    parse(
        `int __tact_slice_eq_bits_nullable_one(slice a, slice b) inline {
        return (null?(a)) ? (false) : (equal_slice_bits(a, b));
    }`,
    );

    parse(
        `int __tact_slice_eq_bits_nullable(slice a, slice b) inline {
        var a_is_null = null?(a);
        var b_is_null = null?(b);
        return (a_is_null & b_is_null) ? (true) : ((~a_is_null) & (~b_is_null)) ? (equal_slice_bits(a, b)) : (false);
    }`,
    );

    //
    // Int Eq
    //

    parse(
        `int __tact_int_eq_nullable_one(int a, int b) inline {
        return (null?(a)) ? (false) : (a == b);
    }`,
    );

    parse(
        `int __tact_int_neq_nullable_one(int a, int b) inline {
        return (null?(a)) ? (true) : (a != b);
    }`,
    );

    parse(
        `int __tact_int_eq_nullable(int a, int b) inline {
        var a_is_null = null?(a);
        var b_is_null = null?(b);
        return (a_is_null & b_is_null) ? (true) : ((~a_is_null) & (~b_is_null)) ? (a == b) : (false);
    }`,
    );

    parse(
        `int __tact_int_neq_nullable(int a, int b) inline {
        var a_is_null = null?(a);
        var b_is_null = null?(b);
        return (a_is_null & b_is_null) ? (false) : ((~a_is_null) & (~b_is_null)) ? (a != b) : (true);
    }`,
    );

    //
    // Cell Eq
    //

    parse(
        `int __tact_cell_eq(cell a, cell b) inline {
        return (a.cell_hash() == b.cell_hash());
    }`,
    );

    parse(
        `int __tact_cell_neq(cell a, cell b) inline {
        return (a.cell_hash() != b.cell_hash());
    }`,
    );

    parse(
        `int __tact_cell_eq_nullable_one(cell a, cell b) inline {
        return (null?(a)) ? (false) : (a.cell_hash() == b.cell_hash());
    }`,
    );

    parse(
        `int __tact_cell_neq_nullable_one(cell a, cell b) inline {
        return (null?(a)) ? (true) : (a.cell_hash() != b.cell_hash());
    }`,
    );

    parse(
        `int __tact_cell_eq_nullable(cell a, cell b) inline {
        var a_is_null = null?(a);
        var b_is_null = null?(b);
        return (a_is_null & b_is_null) ? (true) : ((~a_is_null) & (~b_is_null)) ? (a.cell_hash() == b.cell_hash()) : (false);
    }`,
    );

    parse(
        `int __tact_cell_neq_nullable(cell a, cell b) inline {
        var a_is_null = null?(a);
        var b_is_null = null?(b);
        return (a_is_null & b_is_null) ? (false) : ((~a_is_null) & (~b_is_null)) ? (a.cell_hash() != b.cell_hash()) : (true);
    }`,
    );

    //
    // Slice Eq
    //

    parse(
        `int __tact_slice_eq(slice a, slice b) inline {
        return (a.slice_hash() == b.slice_hash());
    }`,
    );

    parse(
        `int __tact_slice_neq(slice a, slice b) inline {
        return (a.slice_hash() != b.slice_hash());
    }`,
    );

    parse(
        `int __tact_slice_eq_nullable_one(slice a, slice b) inline {
        return (null?(a)) ? (false) : (a.slice_hash() == b.slice_hash());
    }`,
    );

    parse(
        `int __tact_slice_neq_nullable_one(slice a, slice b) inline {
        return (null?(a)) ? (true) : (a.slice_hash() != b.slice_hash());
    }`,
    );

    parse(
        `int __tact_slice_eq_nullable(slice a, slice b) inline {
        var a_is_null = null?(a);
        var b_is_null = null?(b);
        return (a_is_null & b_is_null) ? (true) : ((~a_is_null) & (~b_is_null)) ? (a.slice_hash() == b.slice_hash()) : (false);
    }`,
    );

    parse(
        `int __tact_slice_neq_nullable(slice a, slice b) inline {
        var a_is_null = null?(a);
        var b_is_null = null?(b);
        return (a_is_null & b_is_null) ? (false) : ((~a_is_null) & (~b_is_null)) ? (a.slice_hash() != b.slice_hash()) : (true);
    }`,
    );

    //
    // Sys Dict
    //

    parse(
        `cell __tact_dict_set_code(cell dict, int id, cell code) inline {
        return udict_set_ref(dict, 16, id, code);
    }`,
    );

    parse(
        `cell __tact_dict_get_code(cell dict, int id) inline {
        var (data, ok) = udict_get_ref?(dict, 16, id);
        throw_unless(${contractErrors.codeNotFound.id}, ok);
        return data;
    }`,
    );

    //
    // Tuples
    //

    parse(`tuple __tact_tuple_create_0() asm "NIL";`);

    parse(
        `() __tact_tuple_destroy_0() inline {
        return ();
    }`,
    );

    for (let i = 1; i < 64; i++) {
        const args: string[] = [];
        for (let j = 0; j < i; j++) {
            args.push(`X${j}`);
        }

        parse(
            `forall ${args.join(", ")} -> tuple __tact_tuple_create_${i}((${args.join(", ")}) v) asm "${i} TUPLE";`,
        );

        parse(
            `forall ${args.join(", ")} -> (${args.join(", ")}) __tact_tuple_destroy_${i}(tuple v) asm "${i} UNTUPLE";`,
        );
    }

    //
    // Strings
    //

    parse(
        `tuple __tact_string_builder_start_comment() inline {
        return __tact_string_builder_start(begin_cell().store_uint(0, 32));
    }`,
    );

    parse(
        `tuple __tact_string_builder_start_tail_string() inline {
        return __tact_string_builder_start(begin_cell().store_uint(0, 8));
    }`,
    );

    parse(
        `tuple __tact_string_builder_start_string() inline {
        return __tact_string_builder_start(begin_cell());
    }`,
    );

    parse(
        `tuple __tact_string_builder_start(builder b) inline {
        return tpush(tpush(empty_tuple(), b), null());
    }`,
    );

    parse(
        `cell __tact_string_builder_end(tuple builders) inline {
        (builder b, tuple tail) = uncons(builders);
        cell c = b.end_cell();
        while (~null?(tail)) {
            (b, tail) = uncons(tail);
            c = b.store_ref(c).end_cell();
        }
        return c;
    }`,
    );

    parse(
        `slice __tact_string_builder_end_slice(tuple builders) inline {
        return __tact_string_builder_end(builders).begin_parse();
    }`,
    );

    parse(
        `((tuple), ()) __tact_string_builder_append(tuple builders, slice sc) {
        int sliceRefs = slice_refs(sc);
        int sliceBits = slice_bits(sc);

        while ((sliceBits > 0) | (sliceRefs > 0)) {
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
    }`,
    );

    parse(
        `(tuple) __tact_string_builder_append_not_mut(tuple builders, slice sc) {
        builders~__tact_string_builder_append(sc);
        return builders;
    }`,
    );

    parse(
        `slice __tact_int_to_string(int src) {
        var b = begin_cell();
        if (src < 0) {
            b = b.store_uint(45, 8);
            src = -src;
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
    }`,
    );

    parse(
        `slice __tact_float_to_string(int src, int digits) {
        throw_if(${contractErrors.invalidArgument.id}, (digits <= 0) | (digits > 77));
        builder b = begin_cell();

        if (src < 0) {
            b = b.store_uint(45, 8);
            src = -src;
        }

        ;; Process rem part
        int skip = true;
        int len = 0;
        int rem = 0;
        tuple t = empty_tuple();
        repeat(digits) {
            (src, rem) = src.divmod(10);
            if (~ (skip & (rem == 0))) {
                skip = false;
                t~tpush(rem + 48);
                len = len + 1;
            }
        }

        ;; Process dot
        if (~skip) {
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
    }`,
    );

    parse(`int __tact_log2(int num) asm "DUP 5 THROWIFNOT UBITSIZE DEC";`);

    parse(
        `int __tact_log(int num, int base) {
        throw_unless(5, num > 0);
        throw_unless(5, base > 1);
        if (num < base) {
            return 0;
        }
        int result = 0;
        while (num >= base) {
            num /= base;
            result += 1;
        }
        return result;
    }`,
    );

    parse(
        `int __tact_pow(int base, int exp) {
        throw_unless(5, exp >= 0);
        int result = 1;
        repeat(exp) {
            result *= base;
        }
        return result;
    }`,
    );

    parse(`int __tact_pow2(int exp) asm "POW2";`);
}
