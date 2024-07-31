import { Address, Cell, toNano } from "@ton/core";
import { enabledDebug, enabledMasterchain } from "../config/features";
import { writeAddress, writeCell } from "../generator/writers/writeConstant";
import {
    writeExpression,
    writeValue,
} from "../generator/writers/writeExpression";
import { throwCompilationError, throwInternalCompilerError } from "../errors";
import { evalConstantExpression } from "../constEval";
import { getErrorId } from "../types/resolveErrors";
import { AbiFunction } from "./AbiFunction";
import { sha256_sync } from "@ton/crypto";
import path from "path";
import { cwd } from "process";
import { posixNormalize } from "../utils/filePath";
import { AstExpression } from "../grammar/ast";
import { Maybe } from "@ton/core/dist/utils/maybe";
import { WriterContext } from "../generator/Writer";
import { dummySrcInfo } from "../grammar/grammar";
import { TypeRef } from "../types/types";

export const GlobalFunctions: Map<string, AbiFunction> = new Map([
    [
        "ton",
        {
            name: "ton",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError(
                        "ton() expects single string argument",
                        ref,
                    );
                }
                const arg0 = args[0]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "ton() expects single string argument",
                        ref,
                    );
                }
                if (arg0.name !== "String") {
                    throwCompilationError(
                        "ton() expects single string argument",
                        ref,
                    );
                }
                return { kind: "ref", name: "Int", optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 1) {
                    throwCompilationError(
                        "ton() expects single string argument",
                        ref,
                    );
                }
                const str = evalConstantExpression(
                    resolved[0]!,
                    ctx.ctx,
                ) as string;
                return toNano(str).toString(10);
            },
        },
    ],
    [
        "require",
        {
            name: "require",
            resolve: (ctx, args, ref) => {
                if (args.length !== 2) {
                    throwCompilationError(
                        "require() expects two arguments",
                        ref,
                    );
                }
                const arg0 = args[0]!;
                const arg1 = args[1]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "require() expects first Bool argument",
                        ref,
                    );
                }
                if (arg0.name !== "Bool") {
                    throwCompilationError(
                        "require() expects first Bool argument",
                        ref,
                    );
                }
                if (arg1.kind !== "ref") {
                    throwCompilationError(
                        "require() expects second string argument",
                        ref,
                    );
                }
                if (arg1.name !== "String") {
                    throwCompilationError(
                        "require() expects second string argument",
                        ref,
                    );
                }
                return { kind: "void" };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 2) {
                    throwCompilationError(
                        "require() expects two arguments",
                        ref,
                    );
                }
                const str = evalConstantExpression(
                    resolved[1]!,
                    ctx.ctx,
                ) as string;
                return `throw_unless(${getErrorId(str, ctx.ctx)}, ${writeExpression(resolved[0]!, ctx)})`;
            },
        },
    ],
    [
        "address",
        {
            name: "address",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError(
                        "address() expects one argument",
                        ref,
                    );
                }
                const arg0 = args[0]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "address() expects string argument",
                        ref,
                    );
                }
                if (arg0.name !== "String") {
                    throwCompilationError(
                        "address() expects string argument",
                        ref,
                    );
                }
                return { kind: "ref", name: "Address", optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 1) {
                    throwCompilationError(
                        "address() expects one argument",
                        ref,
                    );
                }
                const str = evalConstantExpression(
                    resolved[0]!,
                    ctx.ctx,
                ) as string;
                let address: Address;
                try {
                    address = Address.parse(str);
                } catch {
                    throwCompilationError(`${str} is not a valid address`, ref);
                }
                if (address.workChain !== 0 && address.workChain !== -1) {
                    throwCompilationError(
                        `Address ${str} invalid address`,
                        ref,
                    );
                }
                if (!enabledMasterchain(ctx.ctx)) {
                    if (address.workChain !== 0) {
                        throwCompilationError(
                            `Address ${str} from masterchain are not enabled for this contract`,
                            ref,
                        );
                    }
                }

                // Generate address
                const res = writeAddress(address, ctx);
                ctx.used(res);
                return res + "()";
            },
        },
    ],
    [
        "cell",
        {
            name: "cell",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("cell() expects one argument", ref);
                }
                const arg0 = args[0]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "cell() expects string argument",
                        ref,
                    );
                }
                if (arg0.name !== "String") {
                    throwCompilationError(
                        "cell() expects string argument",
                        ref,
                    );
                }
                return { kind: "ref", name: "Cell", optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 1) {
                    throwCompilationError("cell() expects one argument", ref);
                }

                // Load cell data
                const str = evalConstantExpression(
                    resolved[0]!,
                    ctx.ctx,
                ) as string;
                let c: Cell;
                try {
                    c = Cell.fromBase64(str);
                } catch (e) {
                    throwCompilationError(`Invalid cell ${str}`, ref);
                }

                // Generate address
                const res = writeCell(c, ctx);
                ctx.used(res);
                return `${res}()`;
            },
        },
    ],
    [
        "dump",
        {
            name: "dump",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("dump expects 1 argument", ref);
                }
                return { kind: "void" };
            },
            generate: (ctx, args, resolved, ref) => {
                if (!enabledDebug(ctx.ctx)) {
                    return `${ctx.used("__tact_nop")}()`;
                }
                const arg0 = args[0]!;

                const filePath = ref.file
                    ? posixNormalize(path.relative(cwd(), ref.file!))
                    : "unknown";
                const lineCol = ref.interval.getLineAndColumn();
                const debugPrint1 = `File ${filePath}:${lineCol.lineNum}:${lineCol.colNum}:`;
                const debugPrint2 = writeValue(ref.interval.contents, ctx);

                if (arg0.kind === "map") {
                    const exp = writeExpression(resolved[0]!, ctx);
                    return `${ctx.used(`__tact_debug`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
                } else if (arg0.kind === "null") {
                    return `${ctx.used(`__tact_debug_str`)}("null", ${debugPrint2}, "${debugPrint1}")`;
                } else if (arg0.kind === "void") {
                    return `${ctx.used(`__tact_debug_str`)}("void", ${debugPrint2}, "${debugPrint1}")`;
                } else if (arg0.kind === "ref") {
                    if (arg0.name === "Int") {
                        const exp = writeExpression(resolved[0]!, ctx);
                        return `${ctx.used(`__tact_debug_str`)}(${ctx.used(`__tact_int_to_string`)}(${exp}), ${debugPrint2}, "${debugPrint1}")`;
                    } else if (arg0.name === "Bool") {
                        const exp = writeExpression(resolved[0]!, ctx);
                        return `${ctx.used(`__tact_debug_bool`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
                    } else if (arg0.name === "String") {
                        const exp = writeExpression(resolved[0]!, ctx);
                        return `${ctx.used(`__tact_debug_str`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
                    } else if (arg0.name === "Address") {
                        const exp = writeExpression(resolved[0]!, ctx);
                        return `${ctx.used(`__tact_debug_address`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
                    } else if (
                        arg0.name === "Builder" ||
                        arg0.name === "Slice" ||
                        arg0.name === "Cell"
                    ) {
                        const exp = writeExpression(resolved[0]!, ctx);
                        return `${ctx.used(`__tact_debug`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
                    }
                    throwCompilationError(
                        "dump() not supported for type: " + arg0.name,
                        ref,
                    );
                } else {
                    throwCompilationError(
                        "dump() not supported for argument",
                        ref,
                    );
                }
            },
        },
    ],
    [
        "dumpStack",
        {
            name: "dumpStack",
            resolve: (_ctx, args, ref) => {
                if (args.length !== 0) {
                    throwCompilationError(
                        "dumpStack expects no arguments",
                        ref,
                    );
                }
                return { kind: "void" };
            },
            generate: (ctx, _args, _resolved, ref) => {
                if (!enabledDebug(ctx.ctx)) {
                    return `${ctx.used("__tact_nop")}()`;
                }
                const filePath = ref.file
                    ? posixNormalize(path.relative(cwd(), ref.file!))
                    : "unknown";
                const lineCol = ref.interval.getLineAndColumn();
                const debugPrint1 = `File ${filePath}:${lineCol.lineNum}:${lineCol.colNum}:`;
                return `${ctx.used(`__tact_debug_stack`)}("dumpStack()", "${debugPrint1}")`;
            },
        },
    ],
    [
        "emptyMap",
        {
            name: "emptyMap",
            resolve: (ctx, args, ref) => {
                if (args.length !== 0) {
                    throwCompilationError("emptyMap expects no arguments", ref);
                }
                return { kind: "null" };
            },
            generate: (_ctx, _args, _resolved, _ref) => {
                return "null()";
            },
        },
    ],
    [
        "sha256",
        {
            name: "sha256",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("sha256 expects 1 argument", ref);
                }
                const arg0 = args[0]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "sha256 expects string argument",
                        ref,
                    );
                }
                if (arg0.name !== "String" && arg0.name !== "Slice") {
                    throwCompilationError(
                        "sha256 expects string or slice argument",
                        ref,
                    );
                }
                return { kind: "ref", name: "Int", optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("sha256 expects 1 argument", ref);
                }
                const arg0 = args[0]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "sha256 expects string argument",
                        ref,
                    );
                }

                // String case
                if (arg0.name === "String") {
                    try {
                        const str = evalConstantExpression(
                            resolved[0]!,
                            ctx.ctx,
                        ) as string;
                        if (Buffer.from(str).length > 128) {
                            throwCompilationError(
                                "sha256 expects string argument with byte length <= 128",
                                ref,
                            );
                        }
                        return BigInt(
                            "0x" + sha256_sync(str).toString("hex"),
                        ).toString(10);
                    } catch (e) {
                        // Not a constant
                    }
                    const exp = writeExpression(resolved[0]!, ctx);
                    return `string_hash(${exp})`;
                }

                // Slice case
                if (arg0.name === "Slice") {
                    const exp = writeExpression(resolved[0]!, ctx);
                    return `string_hash(${exp})`;
                }

                throwCompilationError(
                    "sha256 expects string or slice argument",
                    ref,
                );
            },
        },
    ],
    [
        "send",
        {
            name: "send",
            resolve: (ctx, args, ref) => {
                if (args.length < 4 || args.length > 7) {
                    throwCompilationError("send(to: Address, value: Int, bounce: Bool, mode: Int, body: Cell, code: Cell, data: Cell) expects from 4 to 7 arguments", ref);
                }

                const arg0 = args[0]!; // to
                const arg1 = args[1]!; // value
                const arg2 = args[2]!; // bounce
                const arg3 = args[3]!; // mode
                const arg4 = args[4] as Maybe<TypeRef>;  // body (may not exist)
                const arg5 = args[5] as Maybe<TypeRef>;  // code (may not exist)
                const arg6 = args[6] as Maybe<TypeRef>;  // data (may not exist)

                // type check of `to`
                if (arg0.kind !== 'ref' || arg0.name !== 'Address' || arg0.optional) {
                    throwCompilationError("send() expects the 1st argument `to` to be `Address`", ref);
                }

                // type check of `value`
                if (arg1.kind !== 'ref' || arg1.name !== 'Int' || arg1.optional) {
                    throwCompilationError("send() expects the 2nd argument `value` to be `Int`", ref);
                }

                // type check of `bounce`
                if (arg2.kind !== 'ref' || arg2.name !== 'Bool' || arg2.optional) {
                    throwCompilationError("send() expects the 3rd argument `bounce` to be `Bool`", ref);
                }

                // type check of `mode`
                if (arg3.kind !== 'ref' || arg3.name !== 'Int' || arg3.optional) {
                    throwCompilationError("send() expects the 4th argument `mode` to be `Int`", ref);
                }

                // type check of `body`
                if (arg4 && (arg4.kind !== 'ref' || arg4.name !== 'Cell' || arg4.optional)) {
                    throwCompilationError("send() expects the 5th argument `body` to be `Cell`", ref);
                }

                // type check of `code`
                if (arg5 && (arg5.kind !== 'ref' || arg5.name !== 'Cell' || arg5.optional)) {
                    throwCompilationError("send() expects the 6th argument `code` to be `Cell`", ref);
                }

                // type check of `data`
                if (arg6 && (arg6.kind !== 'ref' || arg6.name !== 'Cell' || arg6.optional)) {
                    throwCompilationError("send() expects the 7th argument `data` to be `Cell`", ref);
                }

                return { kind: "void" };
            },
            generate: (ctx, args, resolved, _ /* ref */) => {
                type VComputed<T> = {
                    kind: 'const';
                    value: T
                };

                type VExternal = {
                    kind: 'ext';
                    value: AstExpression
                };
                
                type V<T> = VComputed<T> | VExternal;

                type StoreUintOperation = {
                    kind: 'u';
                    a0: V<bigint>;
                    a1: number;
                };

                type StoreAddressOperation = {
                    kind: 'a';
                    a0: V<string>;
                };

                type StoreCoinsOperation = {
                    kind: 'c';
                    a0: V<bigint>;
                };

                type StoreRefOperation = {
                    kind: 'r';
                    a0: V<void>;
                };

                type Operation =
                    | StoreUintOperation
                    | StoreAddressOperation
                    | StoreCoinsOperation
                    | StoreRefOperation;

                ctx.append('{');

                ctx.inIndent(() => {
                    ctx.append('builder b = begin_cell();');
                    ctx.append();

                    const to = resolved[0]!; // to
                    const value = resolved[1]!; // value
                    const bounce = resolved[2]!; // bounce
                    const mode = resolved[3]!; // mode
                    const body = resolved[4] as Maybe<AstExpression>;  // body (may not exist)
                    const code = resolved[5] as Maybe<AstExpression>;  // code (may not exist)
                    const data = resolved[6] as Maybe<AstExpression>;  // data (may not exist)

                    let operations: Operation[] = [];

                    operations.push({ kind: 'u', a0: { kind: 'const', value: 0n }, a1: 1 }); // int_msg_info$0 tag
                    operations.push({ kind: 'u', a0: { kind: 'const', value: 1n }, a1: 1 }); // ihr_disabled:Bool

                    // bounce:Bool
                    try {
                        const bool = evalConstantExpression(bounce, ctx.ctx) as boolean;
                        const value = (bool ? 1n : 0n) as bigint
                        operations.push({ kind: 'u', a0: { kind: 'const', value: value }, a1: 1 });
                    } catch {
                        operations.push({ kind: 'u', a0: { kind: 'ext', value: bounce }, a1: 1 });
                    }
                 

                    operations.push({ kind: 'u', a0: { kind: 'const', value: 0n }, a1: 1 }); // bounced:Bool
                    operations.push({ kind: 'u', a0: { kind: 'const', value: 0n }, a1: 2 }); // src:MsgAddress

                    // dest:MsgAddressInt
                    try {
                        const address = evalConstantExpression(to, ctx.ctx) as string;
                        operations.push({ kind: 'a', a0: { kind: 'const', value: address } });
                    } catch {
                        operations.push({ kind: 'a', a0: { kind: 'ext', value: to } });
                    }

                    // value:CurrencyCollection -> grams:Grams
                    try {
                        const coins = evalConstantExpression(value, ctx.ctx) as bigint;
                        operations.push({ kind: 'c', a0: { kind: 'const', value: coins } });
                    } catch {
                        operations.push({ kind: 'c', a0: { kind: 'ext', value: value } });
                    }

                    // value:CurrencyCollection -> other:ExtraCurrencyCollection 
                    operations.push({ kind: 'u', a0: { kind: 'const', value: 0n }, a1: 1 });

                    // ihr_fee:Grams fwd_fee:Grams created_lt:uint64 created_at:uint32
                    operations.push({ kind: 'u', a0: { kind: 'const', value: 0n }, a1: 4 + 4 + 64 + 32 });

                    if (code !== undefined || data !== undefined) {
                        // init:(Maybe (Either StateInit ^StateInit))
                        operations.push({ kind: 'u', a0: { kind: 'const', value: 1n }, a1: 1 });
                        operations.push({ kind: 'u', a0: { kind: 'const', value: 0n }, a1: 1 });

                        operations.push({ kind: 'u', a0: { kind: 'const', value: 0n }, a1: 1 }); // split_depth:(Maybe (## 5))
                        operations.push({ kind: 'u', a0: { kind: 'const', value: 0n }, a1: 1 }); // special:(Maybe TickTock)

                        // code:(Maybe ^Cell)
                        if (code) {
                            operations.push({ kind: 'u', a0: { kind: 'const', value: 1n }, a1: 1 });
                            operations.push({ kind: 'r', a0: { kind: 'ext', value: code } });
                        } else {
                            operations.push({ kind: 'u', a0: { kind: 'const', value: 0n }, a1: 1 });
                        }

                        // data:(Maybe ^Cell)
                        if (data) {
                            operations.push({ kind: 'u', a0: { kind: 'const', value: 1n }, a1: 1 });
                            operations.push({ kind: 'r', a0: { kind: 'ext', value: data } });
                        } else {
                            operations.push({ kind: 'u', a0: { kind: 'const', value: 0n }, a1: 1 });
                        }

                        // library:(Maybe ^Cell), not supported by SendParameters
                        operations.push({ kind: 'u', a0: { kind: 'const', value: 0n }, a1: 1 });
                    } else {
                        // init:(Maybe (Either StateInit ^StateInit))
                        operations.push({ kind: 'u', a0: { kind: 'const', value: 0n }, a1: 1 });
                    }

                    if (body) {
                        // body:(Either X ^X)
                        operations.push({ kind: 'u', a0: { kind: 'const', value: 1n }, a1: 1 });
                        operations.push({ kind: 'r', a0: { kind: 'ext', value: body } });
                    } else {
                        // body:(Either X ^X)
                        operations.push({ kind: 'u', a0: { kind: 'const', value: 0n }, a1: 1 });
                    }

                    // move refs to the end 💀
                    operations = [
                        ...operations.filter(item => item.kind !== 'r'),
                        ...operations.filter(item => item.kind === 'r')
                    ];

                    const optimize = (operations: Operation[]): Operation[] => {
                        let i = 0;
                        const out: Operation[] = [];
                        
                        while (i < operations.length) {
                            const curr = operations[i]!;
                            
                            // u(any), u(any) -> u
                            if (curr.kind === 'u' && i + 1 < operations.length && operations[i + 1]!.kind === 'u') {
                                const cop = curr;
                                const nop = operations[i + 1]! as StoreUintOperation;
    
                                if (cop.a0.kind !== 'const' || nop.a0.kind !== 'const') {
                                    out.push(curr);
                                    i++;
                                    continue;
                                }
    
                                const shifted = cop.a0.value << BigInt(nop.a1);
                                const combined = shifted | nop.a0.value;
                                const newsize = cop.a1 + nop.a1;
                                
                                out.push({ kind: 'u', a0: { kind: 'const', value: combined }, a1: newsize });
    
                                i += 2;
                                continue;
                            }

                            // c(0), u(any) -> u
                            if (curr.kind === 'c' && i + 1 < operations.length && operations[i + 1]!.kind === 'u') {
                                const cop: StoreCoinsOperation = curr;
                                const nop: StoreUintOperation = operations[i + 1]! as StoreUintOperation;
    
                                if (cop.a0.kind !== 'const' || nop.a0.kind !== 'const') {
                                    out.push(curr);
                                    i++;
                                    continue;
                                }

                                if (cop.a0.value !== 0n) {
                                    out.push(curr);
                                    i++;
                                    continue;
                                }

                                out.push({ kind: 'u', a0: { kind: 'const', value: nop.a0.value }, a1: nop.a1 + 4 });
    
                                i += 2;
                                continue;
                            }
                            
                            out.push(curr);
                            i++;
                        }

                        return out;
                    };

                    const isseq = (set1: Operation[], set2: Operation[]): boolean => {
                        if (set1.length !== set2.length) {
                            return false;
                        }

                        for (let i = 0; i < set1.length; i++) {
                            const op1 = set1[i]!;
                            const op2 = set2[i]!;

                            if (op1.kind !== op2.kind) {
                                return false
                            }
                        }

                        return true;
                    }

                    let prevset: Operation[] = [];
                    let currset: Operation[] = operations;

                    while (!isseq(prevset, currset)) {
                        prevset = currset;
                        currset = optimize(currset);
                    }
                    
                    operations = currset;

                    const writeU = (ctx: WriterContext, op: StoreUintOperation) => {
                        if (op.a0.kind === 'const') {
                            ctx.append(`b = store_uint(b, ${op.a0.value}, ${op.a1});`);
                        } else {
                            const exp = writeExpression(op.a0.value, ctx)
                            ctx.append(`b = store_uint(b, ${exp}, ${op.a1});`);
                        }
                    };

                    const writeA = (ctx: WriterContext, op: StoreAddressOperation) => {
                        ctx.used(`__tact_store_address`);

                        if (op.a0.kind === 'const') {
                            ctx.append(`b = __tact_store_address(b, "${op.a0.value}"a);`);
                        } else {
                            const exp = writeExpression(op.a0.value, ctx);
                            ctx.append(`b = __tact_store_address(b, ${exp});`);
                        }
                    };
                    
                    const writeC = (ctx: WriterContext, op: StoreCoinsOperation) => {
                        if (op.a0.kind === 'const') {
                            ctx.append(`b = store_coins(b, ${op.a0.value});`);
                        } else {
                            const exp = writeExpression(op.a0.value, ctx);
                            ctx.append(`b = store_coins(b, ${exp});`);
                        }
                    };
                    
                    const writeR = (ctx: WriterContext, op: StoreRefOperation) => {
                        if (op.a0.kind === 'const') {
                            throwInternalCompilerError('StoreRefOperation is impossible to be const', dummySrcInfo)
                        } else {
                            const exp = writeExpression(op.a0.value, ctx);
                            ctx.append(`b = store_ref(b, ${exp});`);
                        }
                    };

                    for (const op of operations) {
                        switch (op.kind) {
                            case 'u':
                                writeU(ctx, op);
                                break;
                            case 'a':
                                writeA(ctx, op);
                                break;
                            case 'c':
                                writeC(ctx, op);
                                break;
                            case 'r':
                                writeR(ctx, op);
                                break;
                        }
                    }

                    const modexp = writeExpression(mode, ctx);

                    ctx.append();
                    ctx.append(`send_raw_message(end_cell(b), ${modexp});`);
                });

                return '}'
            }
        }
    ]
]);
