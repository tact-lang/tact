import { contractErrors } from "@/abi/errors";
import { throwInternalCompilerError } from "@/error/errors";
import { dummySrcInfo } from "@/grammar";
import type { AllocationCell, AllocationOperation } from "@/storage/operation";
import type { StorageAllocation } from "@/storage/StorageAllocation";
import { getType } from "@/types/resolveDescriptors";
import type { WriterContext } from "@/generator/Writer";
import { ops } from "@/generator/writers/ops";
import { resolveFuncTypeFromAbi } from "@/generator/writers/resolveFuncTypeFromAbi";
import { resolveFuncTypeFromAbiUnpack } from "@/generator/writers/resolveFuncTypeFromAbiUnpack";
import type { ItemOrigin } from "@/imports/source";
import type { TypeDescription, TypeRef } from "@/types/types";
import { resolveFuncTypeUnpack } from "@/generator/writers/resolveFuncTypeUnpack";

const SMALL_STRUCT_MAX_FIELDS = 10;

//
// Serializer
//

export function writeSerializer(
    name: string,
    forceInline: boolean,
    allocation: StorageAllocation,
    origin: ItemOrigin,
    ctx: WriterContext,
) {
    const isSmall = allocation.ops.length <= SMALL_STRUCT_MAX_FIELDS;

    // Write to builder
    ctx.fun(ops.writer(name, ctx), () => {
        ctx.signature(
            `builder ${ops.writer(name, ctx)}(builder build_0, ${resolveFuncTypeFromAbi(
                allocation.ops.map((v) => v.type),
                ctx,
            )} v)`,
        );
        if (forceInline || isSmall) {
            ctx.flag("inline");
        }
        ctx.context("type:" + name);
        ctx.body(() => {
            if (allocation.ops.length > 0) {
                ctx.append(
                    `var ${resolveFuncTypeFromAbiUnpack(`v`, allocation.ops, ctx)} = v;`,
                );
            }
            if (allocation.header) {
                ctx.append(
                    `build_0 = store_uint(build_0, ${allocation.header.value}, ${allocation.header.bits});`,
                );
            }
            writeSerializerCell(allocation.root, 0, ctx);
            ctx.append(`return build_0;`);
        });
    });

    // Write to cell
    ctx.fun(ops.writerCell(name, ctx), () => {
        ctx.signature(
            `cell ${ops.writerCell(name, ctx)}(${resolveFuncTypeFromAbi(
                allocation.ops.map((v) => v.type),
                ctx,
            )} v)`,
        );
        ctx.flag("inline");
        ctx.context("type:" + name);
        ctx.body(() => {
            ctx.append(
                `return ${ops.writer(name, ctx)}(begin_cell(), v).end_cell();`,
            );
        });
    });
}

export function writeOptionalSerializer(
    name: string,
    origin: ItemOrigin,
    ctx: WriterContext,
) {
    ctx.fun(ops.writerCellOpt(name, ctx), () => {
        ctx.signature(`cell ${ops.writerCellOpt(name, ctx)}(tuple v)`);
        ctx.flag("inline");
        ctx.context("type:" + name);
        ctx.body(() => {
            ctx.write(`
                if (null?(v)) {
                    return null();
                }
                return ${ops.writerCell(name, ctx)}(${ops.typeNotNull(name, ctx)}(v));
            `);
        });
    });
}

function writeSerializerCell(
    cell: AllocationCell,
    gen: number,
    ctx: WriterContext,
) {
    // Write fields
    for (const f of cell.ops) {
        writeSerializerField(f, gen, ctx);
    }

    // Tail
    if (cell.next) {
        ctx.append(`var build_${gen + 1} = begin_cell();`);
        writeSerializerCell(cell.next, gen + 1, ctx);
        ctx.append(
            `build_${gen} = store_builder_ref(build_${gen}, build_${gen + 1});`,
        );
    }
}

function writeSerializerField(
    f: AllocationOperation,
    gen: number,
    ctx: WriterContext,
) {
    const fieldName = `v'${f.name}`;
    const op = f.op;

    switch (op.kind) {
        case "int": {
            if (op.optional) {
                ctx.append(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_int(${fieldName}, ${op.bits}) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                ctx.append(
                    `build_${gen} = build_${gen}.store_int(${fieldName}, ${op.bits});`,
                );
            }
            return;
        }
        case "uint": {
            if (op.optional) {
                ctx.append(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_uint(${fieldName}, ${op.bits}) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                ctx.append(
                    `build_${gen} = build_${gen}.store_uint(${fieldName}, ${op.bits});`,
                );
            }
            return;
        }
        case "varint16":
        case "varuint16":
        case "varint32":
        case "varuint32": {
            if (op.optional) {
                ctx.append(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_${op.kind}(${fieldName}) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                ctx.append(
                    `build_${gen} = build_${gen}.store_${op.kind}(${fieldName});`,
                );
            }
            return;
        }
        case "boolean": {
            if (op.optional) {
                ctx.append(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_int(${fieldName}, 1) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                ctx.append(
                    `build_${gen} = build_${gen}.store_int(${fieldName}, 1);`,
                );
            }
            return;
        }
        case "address": {
            if (op.optional) {
                ctx.used(`__tact_store_address_opt`);
                ctx.append(
                    `build_${gen} = __tact_store_address_opt(build_${gen}, ${fieldName});`,
                );
            } else {
                ctx.append(
                    `build_${gen} = build_${gen}.store_slice(${fieldName});`,
                );
            }
            return;
        }
        case "cell": {
            switch (op.format) {
                case "default":
                    {
                        if (op.optional) {
                            ctx.append(
                                `build_${gen} = build_${gen}.store_maybe_ref(${fieldName});`,
                            );
                        } else {
                            ctx.append(
                                `build_${gen} = build_${gen}.store_ref(${fieldName});`,
                            );
                        }
                    }
                    break;
                case "remainder":
                    {
                        if (op.optional) {
                            throw Error("Impossible");
                        }
                        ctx.append(
                            `build_${gen} = build_${gen}.store_slice(${fieldName}.begin_parse());`,
                        );
                    }
                    break;
            }
            return;
        }
        case "slice": {
            switch (op.format) {
                case "default":
                    {
                        if (op.optional) {
                            ctx.append(
                                `build_${gen} = build_${gen}.store_maybe_ref(begin_cell().store_slice(${fieldName}).end_cell());`,
                            );
                        } else {
                            ctx.append(
                                `build_${gen} = build_${gen}.store_builder_ref(begin_cell().store_slice(${fieldName}));`,
                            );
                        }
                    }
                    break;
                case "remainder": {
                    if (op.optional) {
                        throw Error("Impossible");
                    }
                    ctx.append(
                        `build_${gen} = build_${gen}.store_slice(${fieldName});`,
                    );
                }
            }
            return;
        }
        case "builder": {
            switch (op.format) {
                case "default":
                    {
                        if (op.optional) {
                            ctx.append(
                                `build_${gen} = build_${gen}.store_maybe_ref(begin_cell().store_slice(${fieldName}).end_cell());`,
                            );
                        } else {
                            ctx.append(
                                `build_${gen} = build_${gen}.store_builder_ref(${fieldName});`,
                            );
                        }
                    }
                    break;
                case "remainder": {
                    if (op.optional) {
                        throw Error("Impossible");
                    }
                    ctx.append(
                        `build_${gen} = build_${gen}.store_slice(${fieldName}.end_cell().begin_parse());`,
                    );
                }
            }
            return;
        }
        case "string": {
            if (op.optional) {
                ctx.append(
                    `build_${gen} = build_${gen}.store_maybe_ref(begin_cell().store_slice(${fieldName}).end_cell());`,
                );
            } else {
                ctx.append(
                    `build_${gen} = build_${gen}.store_builder_ref(begin_cell().store_slice(${fieldName}));`,
                );
            }
            return;
        }
        case "fixed-bytes": {
            if (op.optional) {
                ctx.append(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_slice(${fieldName}) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                ctx.append(
                    `build_${gen} = build_${gen}.store_slice(${fieldName});`,
                );
            }
            return;
        }
        case "map": {
            ctx.append(`build_${gen} = build_${gen}.store_dict(${fieldName});`);
            return;
        }
        case "struct": {
            if (op.ref) {
                throw Error("Not implemented");
            }
            if (op.optional) {
                ctx.append(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).${ops.writer(op.type, ctx)}(${ops.typeNotNull(op.type, ctx)}(${fieldName})) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                const ff = getType(ctx.ctx, op.type).fields.map((f) => f.abi);
                ctx.append(
                    `build_${gen} = ${ops.writer(op.type, ctx)}(build_${gen}, ${resolveFuncTypeFromAbiUnpack(fieldName, ff, ctx)});`,
                );
            }
            return;
        }
    }

    throwInternalCompilerError(`Unsupported field kind`, dummySrcInfo);
}

//
// Parser
//

export function writeParser(
    type: TypeDescription,
    name: string,
    forceInline: boolean,
    opcode: "with-opcode" | "no-opcode",
    allocation: StorageAllocation,
    ctx: WriterContext,
) {
    const isSmall = allocation.ops.length <= SMALL_STRUCT_MAX_FIELDS;

    ctx.fun(ops.reader(name, opcode, ctx), () => {
        ctx.signature(
            `(slice, (${resolveFuncTypeFromAbi(
                allocation.ops.map((v) => v.type),
                ctx,
            )})) ${ops.reader(name, opcode, ctx)}(slice sc_0)`,
        );
        if (forceInline || isSmall) {
            ctx.flag("inline");
        }
        ctx.context("type:" + name);
        ctx.body(() => {
            // Check prefix
            if (allocation.header && opcode === "with-opcode") {
                ctx.flag("impure");
                ctx.append(
                    `throw_unless(${contractErrors.invalidPrefix.id}, sc_0~load_uint(${allocation.header.bits}) == ${allocation.header.value});`,
                );
            }

            // Write cell parser
            writeCellParser(
                allocation.root,
                type,
                0,
                ctx,
                undefined,
                undefined,
            );

            // Compile tuple
            if (allocation.ops.length === 0) {
                ctx.append(`return (sc_0, null());`);
            } else {
                ctx.append(
                    `return (sc_0, (${allocation.ops.map((v) => `v'${v.name}`).join(", ")}));`,
                );
            }
        });
    });

    // Write non-modifying variant
    // prevent from writing two FunC functions with the same name
    if (opcode === "with-opcode") {
        ctx.fun(ops.readerNonModifying(name, ctx), () => {
            ctx.signature(
                `(${resolveFuncTypeFromAbi(
                    allocation.ops.map((v) => v.type),
                    ctx,
                )}) ${ops.readerNonModifying(name, ctx)}(slice sc_0)`,
            );
            if (forceInline || isSmall) {
                ctx.flag("inline");
            }
            ctx.context("type:" + name);
            ctx.body(() => {
                ctx.append(`var r = sc_0~${ops.reader(name, opcode, ctx)}();`);

                // When we parse a message with an `as remaining` field, we don't advance the original slice,
                // we just store it in that message field.
                // `end_parse()` on the original slice in this case will generate exit code 9 (extra data remaining in cell),
                // so we need to skip generation of the `end_parse()` call in this case.
                const lastField = type.fields.at(-1);
                const skipEndParse = lastField?.as === "remaining";

                if (!skipEndParse) {
                    ctx.append(`sc_0.end_parse();`);
                }
                ctx.append(`return r;`);
            });
        });
    }
}

export function writeBouncedParser(
    type: TypeDescription,
    allocation: StorageAllocation,
    ctx: WriterContext,
) {
    const name = type.name;
    const forceInline = type.kind === "contract";
    const isSmall = allocation.ops.length <= SMALL_STRUCT_MAX_FIELDS;

    ctx.fun(ops.readerBounced(name, ctx), () => {
        ctx.signature(
            `(slice, (${resolveFuncTypeFromAbi(
                allocation.ops.map((v) => v.type),
                ctx,
            )})) ${ops.readerBounced(name, ctx)}(slice sc_0)`,
        );
        if (forceInline || isSmall) {
            ctx.flag("inline");
        }
        ctx.context("type:" + name);
        ctx.body(() => {
            // Opcode already eaten and checked

            // Write cell parser
            writeCellParser(
                allocation.root,
                type,
                0,
                ctx,
                undefined,
                undefined,
            );

            // Compile tuple
            if (allocation.ops.length === 0) {
                ctx.append(`return (sc_0, null());`);
            } else {
                ctx.append(
                    `return (sc_0, (${allocation.ops.map((v) => `v'${v.name}`).join(", ")}));`,
                );
            }
        });
    });
}

export function writeOptionalParser(
    name: string,
    origin: ItemOrigin,
    ctx: WriterContext,
) {
    ctx.fun(ops.readerOpt(name, ctx), () => {
        ctx.signature(`tuple ${ops.readerOpt(name, ctx)}(cell cl)`);
        ctx.flag("inline");
        ctx.context("type:" + name);
        ctx.body(() => {
            ctx.write(`
                if (null?(cl)) {
                    return null();
                }
                var sc = cl.begin_parse();
                return ${ops.typeAsOptional(name, ctx)}(sc~${ops.reader(name, "with-opcode", ctx)}());
            `);
        });
    });
}

export function writeCellParser(
    cell: AllocationCell,
    type: TypeDescription | undefined,
    gen: number,
    ctx: WriterContext,
    prefix: string | undefined,
    sliceName: string | undefined,
): number {
    // Write current fields
    for (const f of cell.ops) {
        const field = type?.fields.find((v) => v.name === f.name);
        writeFieldParser(f, field?.type, gen, ctx, prefix, sliceName);
    }

    // Handle next cell
    if (cell.next) {
        ctx.append(
            `slice ${genSliceName(gen + 1, sliceName)} = ${genSliceName(gen, sliceName)}~load_ref().begin_parse();`,
        );
        return writeCellParser(
            cell.next,
            type,
            gen + 1,
            ctx,
            prefix,
            sliceName,
        );
    } else {
        return gen;
    }
}

const genSliceName = (gen: number, initialSliceName: string | undefined) => {
    if (gen === 0 && typeof initialSliceName !== "undefined") {
        return initialSliceName;
    }
    return `sc_${gen}`;
};

const fieldParserLeftHand = (
    wCtx: WriterContext,
    name: string,
    prefix: string | undefined,
    type: TypeDescription | TypeRef | undefined,
    inline: boolean,
) => {
    const prefixName = prefix ?? "v";
    const varName = `${prefixName}'${name}`;

    if (inline && type) {
        const fields = resolveFuncTypeUnpack(type, varName, wCtx);
        const presentation = fields.length > 0 ? fields : varName;
        return `var ${presentation}`;
    }

    return `var ${varName}`;
};

function writeFieldParser(
    f: AllocationOperation,
    type: TypeDescription | TypeRef | undefined,
    gen: number,
    ctx: WriterContext,
    prefix: string | undefined,
    sliceName: string | undefined,
) {
    const inline = typeof sliceName !== "undefined";

    const op = f.op;
    const leftHand = fieldParserLeftHand(ctx, f.name, prefix, type, inline);
    const slice = genSliceName(gen, sliceName);

    switch (op.kind) {
        case "int": {
            if (op.optional) {
                ctx.append(
                    `${leftHand} = ${slice}~load_int(1) ? ${slice}~load_int(${op.bits}) : null();`,
                );
            } else {
                ctx.append(`${leftHand} = ${slice}~load_int(${op.bits});`);
            }
            return;
        }
        case "uint": {
            if (op.optional) {
                ctx.append(
                    `${leftHand} = ${slice}~load_int(1) ? ${slice}~load_uint(${op.bits}) : null();`,
                );
            } else {
                ctx.append(`${leftHand} = ${slice}~load_uint(${op.bits});`);
            }
            return;
        }
        case "varint16":
        case "varint32":
        case "varuint16":
        case "varuint32": {
            if (op.optional) {
                ctx.append(
                    `${leftHand} = ${slice}~load_int(1) ? ${slice}~load_${op.kind}() : null();`,
                );
            } else {
                ctx.append(`${leftHand} = ${slice}~load_${op.kind}();`);
            }
            return;
        }
        case "boolean": {
            if (op.optional) {
                ctx.append(
                    `${leftHand} = ${slice}~load_int(1) ? ${slice}~load_int(1) : null();`,
                );
            } else {
                ctx.append(`${leftHand} = ${slice}~load_int(1);`);
            }
            return;
        }
        case "address": {
            if (op.optional) {
                ctx.used(`__tact_load_address_opt`);
                ctx.append(`${leftHand} = ${slice}~__tact_load_address_opt();`);
            } else {
                ctx.append(`${leftHand} = ${slice}~load_msg_addr();`);
            }
            return;
        }
        case "cell": {
            if (op.optional) {
                if (op.format !== "default") {
                    throw new Error(`Impossible`);
                }
                ctx.append(`${leftHand} = ${slice}~load_maybe_ref();`);
            } else {
                switch (op.format) {
                    case "default":
                        {
                            ctx.append(`${leftHand} = ${slice}~load_ref();`);
                        }
                        break;
                    case "remainder": {
                        ctx.append(
                            `${leftHand} = begin_cell().store_slice(${slice}).end_cell();`,
                        );
                    }
                }
            }
            return;
        }
        case "slice": {
            if (op.optional) {
                if (op.format !== "default") {
                    throw new Error(`Impossible`);
                }
                ctx.append(
                    `${leftHand} = ${slice}~load_int(1) ? ${slice}~load_ref().begin_parse() : null();`,
                );
            } else {
                switch (op.format) {
                    case "default":
                        {
                            ctx.append(
                                `${leftHand} = ${slice}~load_ref().begin_parse();`,
                            );
                        }
                        break;
                    case "remainder":
                        {
                            ctx.append(`${leftHand} = ${slice};`);
                        }
                        break;
                }
            }
            return;
        }
        case "builder": {
            if (op.optional) {
                if (op.format !== "default") {
                    throw new Error(`Impossible`);
                }
                ctx.append(
                    `${leftHand} = ${slice}~load_int(1) ? begin_cell().store_slice(${slice}~load_ref().begin_parse()) : null();`,
                );
            } else {
                switch (op.format) {
                    case "default":
                        {
                            ctx.append(
                                `${leftHand} = begin_cell().store_slice(${slice}~load_ref().begin_parse());`,
                            );
                        }
                        break;
                    case "remainder":
                        {
                            ctx.append(
                                `${leftHand} = begin_cell().store_slice(${slice});`,
                            );
                        }
                        break;
                }
            }
            return;
        }
        case "string": {
            if (op.optional) {
                ctx.append(
                    `${leftHand} = ${slice}~load_int(1) ? ${slice}~load_ref().begin_parse() : null();`,
                );
            } else {
                ctx.append(`${leftHand} = ${slice}~load_ref().begin_parse();`);
            }
            return;
        }
        case "fixed-bytes": {
            if (op.optional) {
                ctx.append(
                    `${leftHand} = ${slice}~load_int(1) ? ${slice}~load_bits(${op.bytes * 8}) : null();`,
                );
            } else {
                ctx.append(
                    `${leftHand} = ${slice}~load_bits(${op.bytes * 8});`,
                );
            }
            return;
        }
        case "map": {
            ctx.append(`${leftHand} = ${slice}~load_dict();`);
            return;
        }
        case "struct": {
            if (op.optional) {
                if (op.ref) {
                    throw Error("Not implemented");
                } else {
                    ctx.append(
                        `${leftHand} = ${slice}~load_int(1) ? ${ops.typeAsOptional(op.type, ctx)}(${slice}~${ops.reader(op.type, "with-opcode", ctx)}()) : null();`,
                    );
                }
            } else {
                if (op.ref) {
                    throw Error("Not implemented");
                } else {
                    ctx.append(
                        `${leftHand} = ${slice}~${ops.reader(op.type, "with-opcode", ctx)}();`,
                    );
                }
            }
            return;
        }
    }
}
