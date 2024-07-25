import { contractErrors } from "../abi/errors";
import { enabledMasterchain } from "../config/features";
import { WriterContext, Location } from "./context";
import {
    UNIT_TYPE,
    FuncAstModule,
    FuncAstStmt,
    FuncAstFunctionAttribute,
    FuncType,
    FuncAstVarDefStmt,
    FuncAstFunctionDefinition,
    FuncAstExpr,
} from "../func/syntax";
import {
    cr,
    unop,
    comment,
    FunParamValue,
    nil,
    assign,
    while_,
    expr,
    unit,
    call,
    binop,
    bool,
    number,
    hexnumber,
    string,
    fun,
    ret,
    tensor,
    Type,
    ternary,
    FunAttr,
    vardef,
    mod,
    condition,
    id,
} from "../func/syntaxConstructors";

export function writeStdlib(ctx: WriterContext) {
    //
    // stdlib extension functions
    //

    ctx.skip("__tact_set", { context: Location.stdlib() });
    ctx.skip("__tact_nop", { context: Location.stdlib() });
    ctx.skip("__tact_str_to_slice", { context: Location.stdlib() });
    ctx.skip("__tact_slice_to_str", { context: Location.stdlib() });
    ctx.skip("__tact_address_to_slice", { context: Location.stdlib() });

    //
    // Addresses
    //

    // ctx.fun("__tact_verify_address", () => );

    // ctx.fun("__tact_load_bool", () => );

    // ctx.fun("__tact_load_address", () => );

    // __tact_load_address
    {
        const returnTy = Type.tensor(Type.slice(), Type.slice());
        const funName = "__tact_load_address";
        const paramValues: FunParamValue[] = [["cs", Type.slice()]];
        const attrs = [FunAttr.inline()];
        const body: FuncAstStmt[] = [];

        body.push(vardef(Type.slice(), "raw", call("cs~load_msg_addr", [])));
        body.push(
            ret(tensor(id("cs"), call("__tact_verify_address", [id("raw")]))),
        );

        ctx.fun(attrs, funName, paramValues, returnTy, body, {
            context: Location.stdlib(),
        });
    }

    // __tact_load_address_opt
    {
        const returnTy = Type.tensor(Type.slice(), Type.slice());
        const funName = "__tact_load_address_opt";
        const paramValues: FunParamValue[] = [["cs", Type.slice()]];
        const attrs = [FunAttr.inline()];
        const body: FuncAstStmt[] = [];

        // if (cs.preload_uint(2) != 0)
        const cond = binop(
            call(id("cs~preload_uint"), [number(2)]),
            "!=",
            number(0),
        );

        // if branch
        const ifBody: FuncAstStmt[] = [];
        ifBody.push(vardef(Type.slice(), "raw", call("cs~load_msg_addr", [])));
        ifBody.push(
            ret(tensor(id("cs"), call("__tact_verify_address", [id("raw")]))),
        );

        // else branch
        const elseBody: FuncAstStmt[] = [];
        elseBody.push(expr(call(id("cs~skip_bits"), [number(2)])));
        elseBody.push(ret(tensor(id("cs"), call("null", []))));

        body.push(
            condition(cond, ifBody, false, condition(undefined, elseBody)),
        );

        ctx.fun(attrs, funName, paramValues, returnTy, body, {
            context: Location.stdlib(),
        });
    }

    // __tact_store_address
    {
        const returnTy = Type.builder();
        const funName = "__tact_store_address";
        const paramValues: FunParamValue[] = [
            ["b", Type.builder()],
            ["address", Type.slice()],
        ];
        const attrs = [FunAttr.inline()];
        const body: FuncAstStmt[] = [];

        body.push(
            ret(
                call(id("b~store_slice"), [
                    call("__tact_verify_address", [id("address")]),
                ]),
            ),
        );

        ctx.fun(attrs, funName, paramValues, returnTy, body, {
            context: Location.stdlib(),
        });
    }

    // __tact_store_address_opt
    {
        const returnTy = Type.builder();
        const funName = "__tact_store_address_opt";
        const paramValues: FunParamValue[] = [
            ["b", Type.builder()],
            ["address", Type.slice()],
        ];
        const attrs = [FunAttr.inline()];
        const body: FuncAstStmt[] = [];

        // if (null?(address))
        const cond = call("null?", [id("address")]);

        // if branch
        const ifBody: FuncAstStmt[] = [];
        ifBody.push(
            expr(
                assign(
                    id("b"),
                    call("store_uint", [number(0), number(2)], {
                        receiver: id("b"),
                    }),
                ),
            ),
        );
        ifBody.push(ret(id("b")));

        // else branch
        const elseBody: FuncAstStmt[] = [];
        elseBody.push(
            ret(call("__tact_store_address", [id("b"), id("address")])),
        );

        body.push(
            condition(cond, ifBody, false, condition(undefined, elseBody)),
        );

        ctx.fun(attrs, funName, paramValues, returnTy, body, {
            context: Location.stdlib(),
        });
    }

    // __tact_create_address
    {
        const returnTy = Type.slice();
        const funName = "__tact_create_address";
        const paramValues: FunParamValue[] = [
            ["chain", Type.int()],
            ["hash", Type.int()],
        ];
        const attrs = [FunAttr.inline()];
        const body: FuncAstStmt[] = [];

        body.push(vardef(Type.builder(), "b", call("begin_cell", [])));
        body.push(
            expr(
                assign(
                    id("b"),
                    call("store_uint", [number(2), number(2)], {
                        receiver: id("b"),
                    }),
                ),
            ),
        );
        body.push(
            expr(
                assign(
                    id("b"),
                    call("store_uint", [number(0), number(1)], {
                        receiver: id("b"),
                    }),
                ),
            ),
        );
        body.push(
            expr(
                assign(
                    id("b"),
                    call("store_int", [id("chain"), number(8)], {
                        receiver: id("b"),
                    }),
                ),
            ),
        );
        body.push(
            expr(
                assign(
                    id("b"),
                    call("store_uint", [id("hash"), number(256)], {
                        receiver: id("b"),
                    }),
                ),
            ),
        );
        body.push(
            vardef(
                Type.slice(),
                "addr",
                call("begin_parse", [], {
                    receiver: call("end_cell", [], { receiver: id("b") }),
                }),
            ),
        );
        body.push(ret(call("__tact_verify_address", [id("addr")])));

        ctx.fun(attrs, funName, paramValues, returnTy, body, {
            context: Location.stdlib(),
        });
    }

    // __tact_compute_contract_address
    {
        const returnTy = Type.slice();
        const funName = "__tact_compute_contract_address";
        const paramValues: FunParamValue[] = [
            ["chain", Type.int()],
            ["code", Type.cell()],
            ["data", Type.cell()],
        ];
        const attrs = [FunAttr.inline()];
        const body: FuncAstStmt[] = [];

        body.push(vardef(Type.builder(), "b", call("begin_cell", [])));
        body.push(
            expr(
                assign(
                    id("b"),
                    call("store_uint", [number(0), number(2)], {
                        receiver: id("b"),
                    }),
                ),
            ),
        );
        body.push(
            expr(
                assign(
                    id("b"),
                    call("store_uint", [number(3), number(2)], {
                        receiver: id("b"),
                    }),
                ),
            ),
        );
        body.push(
            expr(
                assign(
                    id("b"),
                    call("store_uint", [number(0), number(1)], {
                        receiver: id("b"),
                    }),
                ),
            ),
        );
        body.push(
            expr(
                assign(
                    id("b"),
                    call("store_ref", [id("code")], { receiver: id("b") }),
                ),
            ),
        );
        body.push(
            expr(
                assign(
                    id("b"),
                    call("store_ref", [id("data")], { receiver: id("b") }),
                ),
            ),
        );
        body.push(
            vardef(
                Type.slice(),
                "hash",
                call("cell_hash", [
                    call("end_cell", [], { receiver: id("b") }),
                ]),
            ),
        );
        body.push(
            ret(call("__tact_create_address", [id("chain"), id("hash")])),
        );

        ctx.fun(attrs, funName, paramValues, returnTy, body, {
            context: Location.stdlib(),
        });
    }

    // __tact_my_balance
    {
        const returnTy = Type.int();
        const funName = "__tact_my_balance";
        const paramValues: FunParamValue[] = [];
        const attrs = [FunAttr.inline()];
        const body: FuncAstStmt[] = [];

        body.push(ret(call("pair_first", [call("get_balance", [])])));

        ctx.fun(attrs, funName, paramValues, returnTy, body, {
            context: Location.stdlib(),
        });
    }

    // TODO: we don't have forall yet
    // ctx.fun("__tact_not_null", () => );

    // ctx.fun("__tact_dict_delete", () => );

    // ctx.fun("__tact_dict_delete_int", () => );

    // ctx.fun("__tact_dict_delete_uint", () => );

    // ctx.fun("__tact_dict_set_ref", () => );

    // ctx.fun("__tact_dict_get", () => );

    // ctx.fun("__tact_dict_get_ref", () => );

    // ctx.fun("__tact_dict_min", () => );

    // ctx.fun("__tact_dict_min_ref", () => );

    // ctx.fun("__tact_dict_next", () => );

    // __tact_dict_next_ref
    {
        const returnTy = Type.tensor(Type.slice(), Type.cell(), Type.int());
        const funName = "__tact_dict_next_ref";
        const paramValues: FunParamValue[] = [
            ["dict", Type.cell()],
            ["key_len", Type.int()],
            ["pivot", Type.slice()],
        ];
        const attrs: FuncAstFunctionAttribute[] = [];
        const body: FuncAstStmt[] = [];

        body.push(
            vardef(
                undefined,
                ["key", "value", "flag"],
                call("__tact_dict_next", [
                    id("dict"),
                    id("key_len"),
                    id("pivot"),
                ]),
            ),
        );

        // if branch
        const ifBody: FuncAstStmt[] = [];
        ifBody.push(
            ret(tensor(id("key"), call("value~load_ref", []), id("flag"))),
        );

        // else branch
        const elseBody: FuncAstStmt[] = [];
        elseBody.push(
            ret(tensor(call("null", []), call("null", []), id("flag"))),
        );

        body.push(
            condition(
                id("flag"),
                ifBody,
                false,
                condition(undefined, elseBody),
            ),
        );

        ctx.fun(attrs, funName, paramValues, returnTy, body, {
            context: Location.stdlib(),
        });
    }

    // ctx.fun("__tact_debug", () => );

    // ctx.fun("__tact_debug_str", () => );

    // __tact_debug_bool
    {
        const returnTy = UNIT_TYPE;
        const funName = "__tact_debug_bool";
        const paramValues: FunParamValue[] = [
            ["value", Type.int()],
            ["debug_print", Type.slice()],
        ];
        const attrs = [FunAttr.impure()];
        const body: FuncAstStmt[] = [];

        // if branch
        const ifBody: FuncAstStmt[] = [];
        ifBody.push(
            expr(call("__tact_debug_str", [string("true"), id("debug_print")])),
        );

        // else branch
        const elseBody: FuncAstStmt[] = [];
        elseBody.push(
            expr(
                call("__tact_debug_str", [string("false"), id("debug_print")]),
            ),
        );

        body.push(
            condition(
                id("value"),
                ifBody,
                false,
                condition(undefined, elseBody),
            ),
        );

        ctx.fun(attrs, funName, paramValues, returnTy, body, {
            context: Location.stdlib(),
        });
    }

    // ctx.fun("__tact_preload_offset", () => );

    // __tact_crc16
    {
        const returnTy = Type.slice();
        const funName = "__tact_crc16";
        const paramValues: FunParamValue[] = [["data", Type.slice()]];
        const attrs = [FunAttr.inline_ref()];
        const body: FuncAstStmt[] = [];

        body.push(
            vardef(
                Type.slice(),
                "new_data",
                call("begin_parse", [], {
                    receiver: call("end_cell", [], {
                        receiver: call("store_slice", [string("0000", "s")], {
                            receiver: call("store_slice", [id("data")], {
                                receiver: call("begin_cell", []),
                            }),
                        }),
                    }),
                }),
            ),
        );

        body.push(vardef(Type.int(), "reg", number(0)));

        const cond = unop(
            "~",
            call("slice_data_empty?", [], { receiver: id("new_data") }),
        );

        // while loop
        const whileBody: FuncAstStmt[] = [];
        whileBody.push(
            vardef(
                Type.int(),
                "byte",
                call("load_uint", [number(8)], { receiver: id("new_data") }),
            ),
        );
        whileBody.push(vardef(Type.int(), "mask", hexnumber("0x80")));

        const innerCond = binop(id("mask"), ">", number(0));

        // inner while loop
        const innerWhileBody: FuncAstStmt[] = [];
        innerWhileBody.push(
            expr(assign(id("reg"), binop(id("reg"), "<<", number(1)))),
        );
        innerWhileBody.push(
            condition(
                binop(id("byte"), "&", id("mask")),
                [expr(assign(id("reg"), binop(id("reg"), "+", number(1))))],
                false,
            ),
        );
        innerWhileBody.push(
            expr(assign(id("mask"), binop(id("mask"), ">>", number(1)))),
        );
        innerWhileBody.push(
            condition(
                binop(id("reg"), ">", number(0xffff)),
                [
                    expr(
                        assign(
                            id("reg"),
                            binop(id("reg"), "&", number(0xffff)),
                        ),
                    ),
                    expr(
                        assign(
                            id("reg"),
                            binop(id("reg"), "^", hexnumber("0x1021")),
                        ),
                    ),
                ],
                false,
            ),
        );

        whileBody.push(while_(innerCond, innerWhileBody));
        body.push(while_(cond, whileBody));

        body.push(
            vardef(
                undefined,
                ["q", "r"],
                call("divmod", [id("reg"), number(256)]),
            ),
        );

        body.push(
            ret(
                call("begin_parse", [], {
                    receiver: call("end_cell", [], {
                        receiver: call("store_uint", [id("r"), number(8)], {
                            receiver: call("store_uint", [id("q"), number(8)], {
                                receiver: call("begin_cell", []),
                            }),
                        }),
                    }),
                }),
            ),
        );

        ctx.fun(attrs, funName, paramValues, returnTy, body, {
            context: Location.stdlib(),
        });
    }

    // ctx.fun("__tact_base64_encode", () => {
    //     ctx.signature(`(slice) __tact_base64_encode(slice data)`);
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             slice chars = "4142434445464748494A4B4C4D4E4F505152535455565758595A6162636465666768696A6B6C6D6E6F707172737475767778797A303132333435363738392D5F"s;
    //             builder res = begin_cell();
    //
    //             while (data.slice_bits() >= 24) {
    //                 (int bs1, int bs2, int bs3) = (data~load_uint(8), data~load_uint(8), data~load_uint(8));
    //
    //                 int n = (bs1 << 16) | (bs2 << 8) | bs3;
    //
    //                 res = res
    //                     .store_slice(${ctx.used("__tact_preload_offset")}(chars, ((n >> 18) & 63) * 8, 8))
    //                     .store_slice(${ctx.used("__tact_preload_offset")}(chars, ((n >> 12) & 63) * 8, 8))
    //                     .store_slice(${ctx.used("__tact_preload_offset")}(chars, ((n >>  6) & 63) * 8, 8))
    //                     .store_slice(${ctx.used("__tact_preload_offset")}(chars, ((n      ) & 63) * 8, 8));
    //             }
    //
    //             return res.end_cell().begin_parse();
    //         `);
    //     });
    // });

    // ctx.fun("__tact_address_to_user_friendly", () => {
    //     ctx.signature(`(slice) __tact_address_to_user_friendly(slice address)`);
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             (int wc, int hash) = address.parse_std_addr();

    //             slice user_friendly_address = begin_cell()
    //                 .store_slice("11"s)
    //                 .store_uint((wc + 0x100) % 0x100, 8)
    //                 .store_uint(hash, 256)
    //             .end_cell().begin_parse();
    //
    //             slice checksum = ${ctx.used("__tact_crc16")}(user_friendly_address);
    //             slice user_friendly_address_with_checksum = begin_cell()
    //                 .store_slice(user_friendly_address)
    //                 .store_slice(checksum)
    //             .end_cell().begin_parse();
    //
    //             return ${ctx.used("__tact_base64_encode")}(user_friendly_address_with_checksum);
    //         `);
    //     });
    // });

    // ctx.fun("__tact_debug_address", () => {
    //     ctx.signature(
    //         `() __tact_debug_address(slice address, slice debug_print)`,
    //     );
    //     ctx.flag("impure");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             ${ctx.used("__tact_debug_str")}(${ctx.used("__tact_address_to_user_friendly")}(address), debug_print);
    //         `);
    //     });
    // });

    // ctx.fun("__tact_debug_stack", () => {
    //     ctx.signature(`() __tact_debug_stack(slice debug_print)`);
    //     ctx.flag("impure");
    //     ctx.context("stdlib");
    //     ctx.asm(`asm "STRDUMP" "DROP" "DUMPSTK"`);
    // });

    // ctx.fun("__tact_context_get", () => {
    //     ctx.signature(`(int, slice, int, slice) __tact_context_get()`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`return __tact_context;`);
    //     });
    // });

    // ctx.fun("__tact_context_get_sender", () => {
    //     ctx.signature(`slice __tact_context_get_sender()`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`return __tact_context_sender;`);
    //     });
    // });

    // ctx.fun("__tact_prepare_random", () => {
    //     ctx.signature(`() __tact_prepare_random()`);
    //     ctx.flag("impure");
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             if (null?(__tact_randomized)) {
    //                 randomize_lt();
    //                 __tact_randomized = true;
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_store_bool", () => {
    //     ctx.signature(`builder __tact_store_bool(builder b, int v)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return b.store_int(v, 1);
    //         `);
    //     });
    // });

    // ctx.fun("__tact_to_tuple", () => {
    //     ctx.signature(`forall X -> tuple __tact_to_tuple(X x)`);
    //     ctx.context("stdlib");
    //     ctx.asm(`asm "NOP"`);
    // });

    // ctx.fun("__tact_from_tuple", () => {
    //     ctx.signature(`forall X -> X __tact_from_tuple(tuple x)`);
    //     ctx.context("stdlib");
    //     ctx.asm(`asm "NOP"`);
    // });

    // Dict Int -> Int
    //
    //
    // ctx.fun("__tact_dict_set_int_int", () => {
    //     ctx.signature(
    //         `(cell, ()) __tact_dict_set_int_int(cell d, int kl, int k, int v, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             if (null?(v)) {
    //                 var (r, ok) = idict_delete?(d, kl, k);
    //                 return (r, ());
    //             } else {
    //                 return (idict_set_builder(d, kl, k, begin_cell().store_int(v, vl)), ());
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_get_int_int", () => {
    //     ctx.signature(
    //         `int __tact_dict_get_int_int(cell d, int kl, int k, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (r, ok) = idict_get?(d, kl, k);
    //             if (ok) {
    //                 return r~load_int(vl);
    //             } else {
    //                 return null();
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_min_int_int", () => {
    //     ctx.signature(
    //         `(int, int, int) __tact_dict_min_int_int(cell d, int kl, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = idict_get_min?(d, kl);
    //             if (flag) {
    //                 return (key, value~load_int(vl), flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_next_int_int", () => {
    //     ctx.signature(
    //         `(int, int, int) __tact_dict_next_int_int(cell d, int kl, int pivot, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = idict_get_next?(d, kl, pivot);
    //             if (flag) {
    //                 return (key, value~load_int(vl), flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // Dict Int -> Int
    //
    //
    // ctx.fun("__tact_dict_set_int_uint", () => {
    //     ctx.signature(
    //         `(cell, ()) __tact_dict_set_int_uint(cell d, int kl, int k, int v, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             if (null?(v)) {
    //                 var (r, ok) = idict_delete?(d, kl, k);
    //                 return (r, ());
    //             } else {
    //                 return (idict_set_builder(d, kl, k, begin_cell().store_uint(v, vl)), ());
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_get_int_uint", () => {
    //     ctx.signature(
    //         `int __tact_dict_get_int_uint(cell d, int kl, int k, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (r, ok) = idict_get?(d, kl, k);
    //             if (ok) {
    //                 return r~load_uint(vl);
    //             } else {
    //                 return null();
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_min_int_uint", () => {
    //     ctx.signature(
    //         `(int, int, int) __tact_dict_min_int_uint(cell d, int kl, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = idict_get_min?(d, kl);
    //             if (flag) {
    //                 return (key, value~load_uint(vl), flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_next_int_uint", () => {
    //     ctx.signature(
    //         `(int, int, int) __tact_dict_next_int_uint(cell d, int kl, int pivot, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = idict_get_next?(d, kl, pivot);
    //             if (flag) {
    //                 return (key, value~load_uint(vl), flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // Dict Uint -> Int
    //
    //
    // ctx.fun("__tact_dict_set_uint_int", () => {
    //     ctx.signature(
    //         `(cell, ()) __tact_dict_set_uint_int(cell d, int kl, int k, int v, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             if (null?(v)) {
    //                 var (r, ok) = udict_delete?(d, kl, k);
    //                 return (r, ());
    //             } else {
    //                 return (udict_set_builder(d, kl, k, begin_cell().store_int(v, vl)), ());
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_get_uint_int", () => {
    //     ctx.signature(
    //         `int __tact_dict_get_uint_int(cell d, int kl, int k, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (r, ok) = udict_get?(d, kl, k);
    //             if (ok) {
    //                 return r~load_int(vl);
    //             } else {
    //                 return null();
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_min_uint_int", () => {
    //     ctx.signature(
    //         `(int, int, int) __tact_dict_min_uint_int(cell d, int kl, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = udict_get_min?(d, kl);
    //             if (flag) {
    //                 return (key, value~load_int(vl), flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_next_uint_int", () => {
    //     ctx.signature(
    //         `(int, int, int) __tact_dict_next_uint_int(cell d, int kl, int pivot, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = udict_get_next?(d, kl, pivot);
    //             if (flag) {
    //                 return (key, value~load_int(vl), flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // Dict Uint -> Uint
    //
    //
    // ctx.fun("__tact_dict_set_uint_uint", () => {
    //     ctx.signature(
    //         `(cell, ()) __tact_dict_set_uint_uint(cell d, int kl, int k, int v, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             if (null?(v)) {
    //                 var (r, ok) = udict_delete?(d, kl, k);
    //                 return (r, ());
    //             } else {
    //                 return (udict_set_builder(d, kl, k, begin_cell().store_uint(v, vl)), ());
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_get_uint_uint", () => {
    //     ctx.signature(
    //         `int __tact_dict_get_uint_uint(cell d, int kl, int k, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (r, ok) = udict_get?(d, kl, k);
    //             if (ok) {
    //                 return r~load_uint(vl);
    //             } else {
    //                 return null();
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_min_uint_uint", () => {
    //     ctx.signature(
    //         `(int, int, int) __tact_dict_min_uint_uint(cell d, int kl, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = udict_get_min?(d, kl);
    //             if (flag) {
    //                 return (key, value~load_uint(vl), flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_next_uint_uint", () => {
    //     ctx.signature(
    //         `(int, int, int) __tact_dict_next_uint_uint(cell d, int kl, int pivot, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = udict_get_next?(d, kl, pivot);
    //             if (flag) {
    //                 return (key, value~load_uint(vl), flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // Dict Int -> Cell
    //
    //
    // ctx.fun("__tact_dict_set_int_cell", () => {
    //     ctx.signature(
    //         `(cell, ()) __tact_dict_set_int_cell(cell d, int kl, int k, cell v)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             if (null?(v)) {
    //                 var (r, ok) = idict_delete?(d, kl, k);
    //                 return (r, ());
    //             } else {
    //                 return (idict_set_ref(d, kl, k, v), ());
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_get_int_cell", () => {
    //     ctx.signature(`cell __tact_dict_get_int_cell(cell d, int kl, int k)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (r, ok) = idict_get_ref?(d, kl, k);
    //             if (ok) {
    //                 return r;
    //             } else {
    //                 return null();
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_min_int_cell", () => {
    //     ctx.signature(
    //         `(int, cell, int) __tact_dict_min_int_cell(cell d, int kl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = idict_get_min_ref?(d, kl);
    //             if (flag) {
    //                 return (key, value, flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_next_int_cell", () => {
    //     ctx.signature(
    //         `(int, cell, int) __tact_dict_next_int_cell(cell d, int kl, int pivot)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = idict_get_next?(d, kl, pivot);
    //             if (flag) {
    //                 return (key, value~load_ref(), flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // Dict Uint -> Cell
    //
    //
    // ctx.fun("__tact_dict_set_uint_cell", () => {
    //     ctx.signature(
    //         `(cell, ()) __tact_dict_set_uint_cell(cell d, int kl, int k, cell v)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             if (null?(v)) {
    //                 var (r, ok) = udict_delete?(d, kl, k);
    //                 return (r, ());
    //             } else {
    //                 return (udict_set_ref(d, kl, k, v), ());
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_get_uint_cell", () => {
    //     ctx.signature(`cell __tact_dict_get_uint_cell(cell d, int kl, int k)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (r, ok) = udict_get_ref?(d, kl, k);
    //             if (ok) {
    //                 return r;
    //             } else {
    //                 return null();
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_min_uint_cell", () => {
    //     ctx.signature(
    //         `(int, cell, int) __tact_dict_min_uint_cell(cell d, int kl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = udict_get_min_ref?(d, kl);
    //             if (flag) {
    //                 return (key, value, flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_next_uint_cell", () => {
    //     ctx.signature(
    //         `(int, cell, int) __tact_dict_next_uint_cell(cell d, int kl, int pivot)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = udict_get_next?(d, kl, pivot);
    //             if (flag) {
    //                 return (key, value~load_ref(), flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // Dict Int -> Slice
    //
    //
    // ctx.fun("__tact_dict_set_int_slice", () => {
    //     ctx.signature(
    //         `(cell, ()) __tact_dict_set_int_slice(cell d, int kl, int k, slice v)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             if (null?(v)) {
    //                 var (r, ok) = idict_delete?(d, kl, k);
    //                 return (r, ());
    //             } else {
    //                 return (idict_set(d, kl, k, v), ());
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_get_int_slice", () => {
    //     ctx.signature(`slice __tact_dict_get_int_slice(cell d, int kl, int k)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (r, ok) = idict_get?(d, kl, k);
    //             if (ok) {
    //                 return r;
    //             } else {
    //                 return null();
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_min_int_slice", () => {
    //     ctx.signature(
    //         `(int, slice, int) __tact_dict_min_int_slice(cell d, int kl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = idict_get_min?(d, kl);
    //             if (flag) {
    //                 return (key, value, flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_next_int_slice", () => {
    //     ctx.signature(
    //         `(int, slice, int) __tact_dict_next_int_slice(cell d, int kl, int pivot)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = idict_get_next?(d, kl, pivot);
    //             if (flag) {
    //                 return (key, value, flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // Dict Uint -> Slice
    //
    //
    // ctx.fun("__tact_dict_set_uint_slice", () => {
    //     ctx.signature(
    //         `(cell, ()) __tact_dict_set_uint_slice(cell d, int kl, int k, slice v)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             if (null?(v)) {
    //                 var (r, ok) = udict_delete?(d, kl, k);
    //                 return (r, ());
    //             } else {
    //                 return (udict_set(d, kl, k, v), ());
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_get_uint_slice", () => {
    //     ctx.signature(
    //         `slice __tact_dict_get_uint_slice(cell d, int kl, int k)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (r, ok) = udict_get?(d, kl, k);
    //             if (ok) {
    //                 return r;
    //             } else {
    //                 return null();
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_min_uint_slice", () => {
    //     ctx.signature(
    //         `(int, slice, int) __tact_dict_min_uint_slice(cell d, int kl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = udict_get_min?(d, kl);
    //             if (flag) {
    //                 return (key, value, flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_next_uint_slice", () => {
    //     ctx.signature(
    //         `(int, slice, int) __tact_dict_next_uint_slice(cell d, int kl, int pivot)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = udict_get_next?(d, kl, pivot);
    //             if (flag) {
    //                 return (key, value, flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // Dict Slice -> Int
    //
    //
    // ctx.fun("__tact_dict_set_slice_int", () => {
    //     ctx.signature(
    //         `(cell, ()) __tact_dict_set_slice_int(cell d, int kl, slice k, int v, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             if (null?(v)) {
    //                 var (r, ok) = ${ctx.used(`__tact_dict_delete`)}(d, kl, k);
    //                 return (r, ());
    //             } else {
    //                 return (dict_set_builder(d, kl, k, begin_cell().store_int(v, vl)), ());
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_get_slice_int", () => {
    //     ctx.signature(
    //         `int __tact_dict_get_slice_int(cell d, int kl, slice k, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (r, ok) = ${ctx.used(`__tact_dict_get`)}(d, kl, k);
    //             if (ok) {
    //                 return r~load_int(vl);
    //             } else {
    //                 return null();
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_min_slice_int", () => {
    //     ctx.signature(
    //         `(slice, int, int) __tact_dict_min_slice_int(cell d, int kl, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = ${ctx.used(`__tact_dict_min`)}(d, kl);
    //             if (flag) {
    //                 return (key, value~load_int(vl), flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_next_slice_int", () => {
    //     ctx.signature(
    //         `(slice, int, int) __tact_dict_next_slice_int(cell d, int kl, slice pivot, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = ${ctx.used(`__tact_dict_next`)}(d, kl, pivot);
    //             if (flag) {
    //                 return (key, value~load_int(vl), flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // Dict Slice -> UInt
    //
    //
    // ctx.fun("__tact_dict_set_slice_uint", () => {
    //     ctx.signature(
    //         `(cell, ()) __tact_dict_set_slice_uint(cell d, int kl, slice k, int v, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             if (null?(v)) {
    //                 var (r, ok) = ${ctx.used(`__tact_dict_delete`)}(d, kl, k);
    //                 return (r, ());
    //             } else {
    //                 return (dict_set_builder(d, kl, k, begin_cell().store_uint(v, vl)), ());
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_get_slice_uint", () => {
    //     ctx.signature(
    //         `int __tact_dict_get_slice_uint(cell d, int kl, slice k, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (r, ok) = ${ctx.used(`__tact_dict_get`)}(d, kl, k);
    //             if (ok) {
    //                 return r~load_uint(vl);
    //             } else {
    //                 return null();
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_min_slice_uint", () => {
    //     ctx.signature(
    //         `(slice, int, int) __tact_dict_min_slice_uint(cell d, int kl, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = ${ctx.used(`__tact_dict_min`)}(d, kl);
    //             if (flag) {
    //                 return (key, value~load_uint(vl), flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // ctx.fun("__tact_dict_next_slice_uint", () => {
    //     ctx.signature(
    //         `(slice, int, int) __tact_dict_next_slice_uint(cell d, int kl, slice pivot, int vl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = ${ctx.used(`__tact_dict_next`)}(d, kl, pivot);
    //             if (flag) {
    //                 return (key, value~load_uint(vl), flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // Dict Slice -> Cell
    //
    //
    // ctx.fun("__tact_dict_set_slice_cell", () => {
    //     ctx.signature(
    //         `(cell, ()) __tact_dict_set_slice_cell(cell d, int kl, slice k, cell v)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             if (null?(v)) {
    //                 var (r, ok) = ${ctx.used(`__tact_dict_delete`)}(d, kl, k);
    //                 return (r, ());
    //             } else {
    //                 return ${ctx.used(`__tact_dict_set_ref`)}(d, kl, k, v);
    //             }
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_dict_get_slice_cell`, () => {
    //     ctx.signature(
    //         `cell __tact_dict_get_slice_cell(cell d, int kl, slice k)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (r, ok) = ${ctx.used(`__tact_dict_get_ref`)}(d, kl, k);
    //             if (ok) {
    //                 return r;
    //             } else {
    //                 return null();
    //             }
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_dict_min_slice_cell`, () => {
    //     ctx.signature(
    //         `(slice, cell, int) __tact_dict_min_slice_cell(cell d, int kl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = ${ctx.used(`__tact_dict_min_ref`)}(d, kl);
    //             if (flag) {
    //                 return (key, value, flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_dict_next_slice_cell`, () => {
    //     ctx.signature(
    //         `(slice, cell, int) __tact_dict_next_slice_cell(cell d, int kl, slice pivot)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = ${ctx.used(`__tact_dict_next`)}(d, kl, pivot);
    //             if (flag) {
    //                 return (key, value~load_ref(), flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // Dict Slice -> Slice
    //
    //
    // ctx.fun("__tact_dict_set_slice_slice", () => {
    //     ctx.signature(
    //         `(cell, ()) __tact_dict_set_slice_slice(cell d, int kl, slice k, slice v)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             if (null?(v)) {
    //                 var (r, ok) = ${ctx.used(`__tact_dict_delete`)}(d, kl, k);
    //                 return (r, ());
    //             } else {
    //                 return (dict_set_builder(d, kl, k, begin_cell().store_slice(v)), ());
    //             }
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_dict_get_slice_slice`, () => {
    //     ctx.signature(
    //         `slice __tact_dict_get_slice_slice(cell d, int kl, slice k)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (r, ok) = ${ctx.used(`__tact_dict_get`)}(d, kl, k);
    //             if (ok) {
    //                 return r;
    //             } else {
    //                 return null();
    //             }
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_dict_min_slice_slice`, () => {
    //     ctx.signature(
    //         `(slice, slice, int) __tact_dict_min_slice_slice(cell d, int kl)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (key, value, flag) = ${ctx.used(`__tact_dict_min`)}(d, kl);
    //             if (flag) {
    //                 return (key, value, flag);
    //             } else {
    //                 return (null(), null(), flag);
    //             }
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_dict_next_slice_slice`, () => {
    //     ctx.signature(
    //         `(slice, slice, int) __tact_dict_next_slice_slice(cell d, int kl, slice pivot)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return ${ctx.used(`__tact_dict_next`)}(d, kl, pivot);
    //         `);
    //     });
    // });

    // Address
    //
    //
    // ctx.fun(`__tact_slice_eq_bits`, () => {
    //     ctx.signature(`int __tact_slice_eq_bits(slice a, slice b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return equal_slice_bits(a, b);
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_slice_eq_bits_nullable_one`, () => {
    //     ctx.signature(
    //         `int __tact_slice_eq_bits_nullable_one(slice a, slice b)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return (null?(a)) ? (false) : (equal_slice_bits(a, b));
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_slice_eq_bits_nullable`, () => {
    //     ctx.signature(`int __tact_slice_eq_bits_nullable(slice a, slice b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var a_is_null = null?(a);
    //             var b_is_null = null?(b);
    //             return ( a_is_null & b_is_null ) ? ( true ) : ( ( ( ~ a_is_null ) & ( ~ b_is_null ) ) ? ( equal_slice_bits(a, b) ) : ( false ) );
    //         `);
    //     });
    // });

    // Int Eq
    //
    //
    // ctx.fun(`__tact_int_eq_nullable_one`, () => {
    //     ctx.signature(`int __tact_int_eq_nullable_one(int a, int b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return (null?(a)) ? (false) : (a == b);
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_int_neq_nullable_one`, () => {
    //     ctx.signature(`int __tact_int_neq_nullable_one(int a, int b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return (null?(a)) ? (true) : (a != b);
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_int_eq_nullable`, () => {
    //     ctx.signature(`int __tact_int_eq_nullable(int a, int b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var a_is_null = null?(a);
    //             var b_is_null = null?(b);
    //             return ( a_is_null & b_is_null ) ? ( true ) : ( ( ( ~ a_is_null ) & ( ~ b_is_null ) ) ? ( a == b ) : ( false ) );
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_int_neq_nullable`, () => {
    //     ctx.signature(`int __tact_int_neq_nullable(int a, int b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var a_is_null = null?(a);
    //             var b_is_null = null?(b);
    //             return ( a_is_null & b_is_null ) ? ( false ) : ( ( ( ~ a_is_null ) & ( ~ b_is_null ) ) ? ( a != b ) : ( true ) );
    //         `);
    //     });
    // });

    // Cell Eq
    //
    //
    // ctx.fun(`__tact_cell_eq`, () => {
    //     ctx.signature(`int __tact_cell_eq(cell a, cell b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return (a.cell_hash() ==  b.cell_hash());
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_cell_neq`, () => {
    //     ctx.signature(`int __tact_cell_neq(cell a, cell b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return (a.cell_hash() !=  b.cell_hash());
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_cell_eq_nullable_one`, () => {
    //     ctx.signature(`int __tact_cell_eq_nullable_one(cell a, cell b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return (null?(a)) ? (false) : (a.cell_hash() == b.cell_hash());
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_cell_neq_nullable_one`, () => {
    //     ctx.signature(`int __tact_cell_neq_nullable_one(cell a, cell b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return (null?(a)) ? (true) : (a.cell_hash() != b.cell_hash());
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_cell_eq_nullable`, () => {
    //     ctx.signature(`int __tact_cell_eq_nullable(cell a, cell b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var a_is_null = null?(a);
    //             var b_is_null = null?(b);
    //             return ( a_is_null & b_is_null ) ? ( true ) : ( ( ( ~ a_is_null ) & ( ~ b_is_null ) ) ? ( a.cell_hash() == b.cell_hash() ) : ( false ) );
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_cell_neq_nullable`, () => {
    //     ctx.signature(`int __tact_cell_neq_nullable(cell a, cell b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var a_is_null = null?(a);
    //             var b_is_null = null?(b);
    //             return ( a_is_null & b_is_null ) ? ( false ) : ( ( ( ~ a_is_null ) & ( ~ b_is_null ) ) ? ( a.cell_hash() != b.cell_hash() ) : ( true ) );
    //         `);
    //     });
    // });

    // Slice Eq
    //
    //
    // ctx.fun(`__tact_slice_eq`, () => {
    //     ctx.signature(`int __tact_slice_eq(slice a, slice b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return (a.slice_hash() ==  b.slice_hash());
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_slice_neq`, () => {
    //     ctx.signature(`int __tact_slice_neq(slice a, slice b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return (a.slice_hash() !=  b.slice_hash());
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_slice_eq_nullable_one`, () => {
    //     ctx.signature(`int __tact_slice_eq_nullable_one(slice a, slice b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return (null?(a)) ? (false) : (a.slice_hash() == b.slice_hash());
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_slice_neq_nullable_one`, () => {
    //     ctx.signature(`int __tact_slice_neq_nullable_one(slice a, slice b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return (null?(a)) ? (true) : (a.slice_hash() != b.slice_hash());
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_slice_eq_nullable`, () => {
    //     ctx.signature(`int __tact_slice_eq_nullable(slice a, slice b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var a_is_null = null?(a);
    //             var b_is_null = null?(b);
    //             return ( a_is_null & b_is_null ) ? ( true ) : ( ( ( ~ a_is_null ) & ( ~ b_is_null ) ) ? ( a.slice_hash() == b.slice_hash() ) : ( false ) );
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_slice_neq_nullable`, () => {
    //     ctx.signature(`int __tact_slice_neq_nullable(slice a, slice b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var a_is_null = null?(a);
    //             var b_is_null = null?(b);
    //             return ( a_is_null & b_is_null ) ? ( false ) : ( ( ( ~ a_is_null ) & ( ~ b_is_null ) ) ? ( a.slice_hash() != b.slice_hash() ) : ( true ) );
    //         `);
    //     });
    // });

    // Sys Dict
    //
    //
    // ctx.fun(`__tact_dict_set_code`, () => {
    //     ctx.signature(
    //         `cell __tact_dict_set_code(cell dict, int id, cell code)`,
    //     );
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return udict_set_ref(dict, 16, id, code);
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_dict_get_code`, () => {
    //     ctx.signature(`cell __tact_dict_get_code(cell dict, int id)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var (data, ok) = udict_get_ref?(dict, 16, id);
    //             throw_unless(${contractErrors.codeNotFound.id}, ok);
    //             return data;
    //         `);
    //     });
    // });

    // Tuples
    //
    //
    // ctx.fun(`__tact_tuple_create_0`, () => {
    //     ctx.signature(`tuple __tact_tuple_create_0()`);
    //     ctx.context("stdlib");
    //     ctx.asm(`asm "NIL"`);
    // });
    // ctx.fun(`__tact_tuple_destroy_0`, () => {
    //     ctx.signature(`() __tact_tuple_destroy_0()`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.append(`return ();`);
    //     });
    // });

    // for (let i = 1; i < 64; i++) {
    //     ctx.fun(`__tact_tuple_create_${i}`, () => {
    //         const args: string[] = [];
    //         for (let j = 0; j < i; j++) {
    //             args.push(`X${j}`);
    //         }
    //         ctx.signature(
    //             `forall ${args.join(", ")} -> tuple __tact_tuple_create_${i}((${args.join(", ")}) v)`,
    //         );
    //         ctx.context("stdlib");
    //         ctx.asm(`asm "${i} TUPLE"`);
    //     });
    //     ctx.fun(`__tact_tuple_destroy_${i}`, () => {
    //         const args: string[] = [];
    //         for (let j = 0; j < i; j++) {
    //             args.push(`X${j}`);
    //         }
    //         ctx.signature(
    //             `forall ${args.join(", ")} -> (${args.join(", ")}) __tact_tuple_destroy_${i}(tuple v)`,
    //         );
    //         ctx.context("stdlib");
    //         ctx.asm(`asm "${i} UNTUPLE"`);
    //     });
    // }

    // Strings
    //
    //
    // ctx.fun(`__tact_string_builder_start_comment`, () => {
    //     ctx.signature(`tuple __tact_string_builder_start_comment()`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return ${ctx.used("__tact_string_builder_start")}(begin_cell().store_uint(0, 32));
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_string_builder_start_tail_string`, () => {
    //     ctx.signature(`tuple __tact_string_builder_start_tail_string()`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return ${ctx.used("__tact_string_builder_start")}(begin_cell().store_uint(0, 8));
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_string_builder_start_string`, () => {
    //     ctx.signature(`tuple __tact_string_builder_start_string()`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return ${ctx.used("__tact_string_builder_start")}(begin_cell());
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_string_builder_start`, () => {
    //     ctx.signature(`tuple __tact_string_builder_start(builder b)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return tpush(tpush(empty_tuple(), b), null());
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_string_builder_end`, () => {
    //     ctx.signature(`cell __tact_string_builder_end(tuple builders)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             (builder b, tuple tail) = uncons(builders);
    //             cell c = b.end_cell();
    //             while(~ null?(tail)) {
    //                 (b, tail) = uncons(tail);
    //                 c = b.store_ref(c).end_cell();
    //             }
    //             return c;
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_string_builder_end_slice`, () => {
    //     ctx.signature(`slice __tact_string_builder_end_slice(tuple builders)`);
    //     ctx.flag("inline");
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             return ${ctx.used("__tact_string_builder_end")}(builders).begin_parse();
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_string_builder_append`, () => {
    //     ctx.signature(
    //         `((tuple), ()) __tact_string_builder_append(tuple builders, slice sc)`,
    //     );
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             int sliceRefs = slice_refs(sc);
    //             int sliceBits = slice_bits(sc);

    // while((sliceBits > 0) | (sliceRefs > 0)) {

    // ;; Load the current builder
    // (builder b, tuple tail) = uncons(builders);
    // int remBytes = 127 - (builder_bits(b) / 8);
    // int exBytes = sliceBits / 8;

    // ;; Append bits
    // int amount = min(remBytes, exBytes);
    // if (amount > 0) {
    //     slice read = sc~load_bits(amount * 8);
    //     b = b.store_slice(read);
    // }

    // ;; Update builders
    // builders = cons(b, tail);

    //     ;; Check if we need to add a new cell and continue
    //     if (exBytes - amount > 0) {
    //         var bb = begin_cell();
    //         builders = cons(bb, builders);
    //         sliceBits = (exBytes - amount) * 8;
    //     } elseif (sliceRefs > 0) {
    //         sc = sc~load_ref().begin_parse();
    //         sliceRefs = slice_refs(sc);
    //         sliceBits = slice_bits(sc);
    //     } else {
    //         sliceBits = 0;
    //         sliceRefs = 0;
    //     }
    // }

    //             return ((builders), ());
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_string_builder_append_not_mut`, () => {
    //     ctx.signature(
    //         `(tuple) __tact_string_builder_append_not_mut(tuple builders, slice sc)`,
    //     );
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             builders~${ctx.used("__tact_string_builder_append")}(sc);
    //             return builders;
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_int_to_string`, () => {
    //     ctx.signature(`slice __tact_int_to_string(int src)`);
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             var b = begin_cell();
    //             if (src < 0) {
    //                 b = b.store_uint(45, 8);
    //                 src = - src;
    //             }

    // if (src < ${(10n ** 30n).toString(10)}) {
    //     int len = 0;
    //     int value = 0;
    //     int mult = 1;
    //     do {
    //         (src, int res) = src.divmod(10);
    //         value = value + (res + 48) * mult;
    //         mult = mult * 256;
    //         len = len + 1;
    //     } until (src == 0);

    //     b = b.store_uint(value, len * 8);
    // } else {
    //     tuple t = empty_tuple();
    //     int len = 0;
    //     do {
    //         int digit = src % 10;
    //         t~tpush(digit);
    //         len = len + 1;
    //         src = src / 10;
    //     } until (src == 0);

    //                 int c = len - 1;
    //                 repeat(len) {
    //                     int v = t.at(c);
    //                     b = b.store_uint(v + 48, 8);
    //                     c = c - 1;
    //                 }
    //             }
    //             return b.end_cell().begin_parse();
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_float_to_string`, () => {
    //     ctx.signature(`slice __tact_float_to_string(int src, int digits)`);
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             throw_if(${contractErrors.invalidArgument.id}, (digits <= 0) | (digits > 77));
    //             builder b = begin_cell();

    // if (src < 0) {
    //     b = b.store_uint(45, 8);
    //     src = - src;
    // }

    // ;; Process rem part
    // int skip = true;
    // int len = 0;
    // int rem = 0;
    // tuple t = empty_tuple();
    // repeat(digits) {
    //     (src, rem) = src.divmod(10);
    //     if ( ~ ( skip & ( rem == 0 ) ) ) {
    //         skip = false;
    //         t~tpush(rem + 48);
    //         len = len + 1;
    //     }
    // }

    // ;; Process dot
    // if (~ skip) {
    //     t~tpush(46);
    //     len = len + 1;
    // }

    // ;; Main
    // do {
    //     (src, rem) = src.divmod(10);
    //     t~tpush(rem + 48);
    //     len = len + 1;
    // } until (src == 0);

    // ;; Assemble
    // int c = len - 1;
    // repeat(len) {
    //     int v = t.at(c);
    //     b = b.store_uint(v, 8);
    //     c = c - 1;
    // }

    //             ;; Result
    //             return b.end_cell().begin_parse();
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_log2`, () => {
    //     ctx.signature(`int __tact_log2(int num)`);
    //     ctx.context("stdlib");
    //     ctx.asm(`asm "DUP 5 THROWIFNOT UBITSIZE DEC"`);
    // });

    // ctx.fun(`__tact_log`, () => {
    //     ctx.signature(`int __tact_log(int num, int base)`);
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             throw_unless(5, num > 0);
    //             throw_unless(5, base > 1);
    //             if (num < base) {
    //                 return 0;
    //             }
    //             int result = 0;
    //             while (num >= base) {
    //                 num /= base;
    //                 result += 1;
    //             }
    //             return result;
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_pow`, () => {
    //     ctx.signature(`int __tact_pow(int base, int exp)`);
    //     ctx.context("stdlib");
    //     ctx.body(() => {
    //         ctx.write(`
    //             throw_unless(5, exp >= 0);
    //             int result = 1;
    //             repeat (exp) {
    //                 result *= base;
    //             }
    //             return result;
    //         `);
    //     });
    // });

    // ctx.fun(`__tact_pow2`, () => {
    //     ctx.signature(`int __tact_pow2(int exp)`);
    //     ctx.context("stdlib");
    //     ctx.asm(`asm "POW2"`);
    // });
}
