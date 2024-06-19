import { contractErrors } from "../../abi/errors";
import { AllocationCell, AllocationOperation } from "../../storage/operation";
import { StorageAllocation } from "../../storage/StorageAllocation";
import { getType } from "../../types/resolveDescriptors";
import { TypeOrigin } from "../../types/types";
import { WriterContext } from "../Writer";
import { ops } from "./ops";
import { resolveFuncTypeFromAbi } from "./resolveFuncTypeFromAbi";
import { resolveFuncTypeFromAbiUnpack } from "./resolveFuncTypeFromAbiUnpack";

const SMALL_STRUCT_MAX_FIELDS = 5;

//
// Serializer
//

export function writeSerializer(
    name: string,
    forceInline: boolean,
    allocation: StorageAllocation,
    origin: TypeOrigin,
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
    origin: TypeOrigin,
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
            `build_${gen} = store_ref(build_${gen}, build_${gen + 1}.end_cell());`,
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

    if (op.kind === "int") {
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
    if (op.kind === "uint") {
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
    if (op.kind === "coins") {
        if (op.optional) {
            ctx.append(
                `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_coins(${fieldName}) : build_${gen}.store_int(false, 1);`,
            );
        } else {
            ctx.append(
                `build_${gen} = build_${gen}.store_coins(${fieldName});`,
            );
        }
        return;
    }
    if (op.kind === "boolean") {
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
    if (op.kind === "address") {
        if (op.optional) {
            ctx.used(`__tact_store_address_opt`);
            ctx.append(
                `build_${gen} = __tact_store_address_opt(build_${gen}, ${fieldName});`,
            );
        } else {
            ctx.used(`__tact_store_address`);
            ctx.append(
                `build_${gen} = __tact_store_address(build_${gen}, ${fieldName});`,
            );
        }
        return;
    }
    if (op.kind === "cell") {
        if (op.format === "default") {
            if (op.optional) {
                ctx.append(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(${fieldName}) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                ctx.append(
                    `build_${gen} = build_${gen}.store_ref(${fieldName});`,
                );
            }
        } else if (op.format === "remainder") {
            if (op.optional) {
                throw Error("Impossible");
            }
            ctx.append(
                `build_${gen} = build_${gen}.store_slice(${fieldName}.begin_parse());`,
            );
        } else {
            throw Error("Impossible");
        }
        return;
    }
    if (op.kind === "slice") {
        if (op.format === "default") {
            if (op.optional) {
                ctx.append(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(begin_cell().store_slice(${fieldName}).end_cell()) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                ctx.append(
                    `build_${gen} = build_${gen}.store_ref(begin_cell().store_slice(${fieldName}).end_cell());`,
                );
            }
        } else if (op.format === "remainder") {
            if (op.optional) {
                throw Error("Impossible");
            }
            ctx.append(
                `build_${gen} = build_${gen}.store_slice(${fieldName});`,
            );
        } else {
            throw Error("Impossible");
        }
        return;
    }
    if (op.kind === "builder") {
        if (op.format === "default") {
            if (op.optional) {
                ctx.append(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(begin_cell().store_slice(${fieldName}.end_cell().begin_parse()).end_cell()) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                ctx.append(
                    `build_${gen} = build_${gen}.store_ref(begin_cell().store_slice(${fieldName}.end_cell().begin_parse()).end_cell());`,
                );
            }
        } else if (op.format === "remainder") {
            if (op.optional) {
                throw Error("Impossible");
            }
            ctx.append(
                `build_${gen} = build_${gen}.store_slice(${fieldName}.end_cell().begin_parse());`,
            );
        } else {
            throw Error("Impossible");
        }
        return;
    }
    if (op.kind === "string") {
        if (op.optional) {
            ctx.append(
                `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(begin_cell().store_slice(${fieldName}).end_cell()) : build_${gen}.store_int(false, 1);`,
            );
        } else {
            ctx.append(
                `build_${gen} = build_${gen}.store_ref(begin_cell().store_slice(${fieldName}).end_cell());`,
            );
        }
        return;
    }
    if (op.kind === "fixed-bytes") {
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
    if (op.kind === "map") {
        ctx.append(`build_${gen} = build_${gen}.store_dict(${fieldName});`);
        return;
    }
    if (op.kind === "struct") {
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

    throw Error("Unsupported field kind: " + op.kind);
}

//
// Parser
//

export function writeParser(
    name: string,
    forceInline: boolean,
    allocation: StorageAllocation,
    origin: TypeOrigin,
    ctx: WriterContext,
) {
    const isSmall = allocation.ops.length <= SMALL_STRUCT_MAX_FIELDS;

    ctx.fun(ops.reader(name, ctx), () => {
        ctx.signature(
            `(slice, (${resolveFuncTypeFromAbi(
                allocation.ops.map((v) => v.type),
                ctx,
            )})) ${ops.reader(name, ctx)}(slice sc_0)`,
        );
        if (forceInline || isSmall) {
            ctx.flag("inline");
        }
        ctx.context("type:" + name);
        ctx.body(() => {
            // Check prefix
            if (allocation.header) {
                ctx.append(
                    `throw_unless(${contractErrors.invalidPrefix.id}, sc_0~load_uint(${allocation.header.bits}) == ${allocation.header.value});`,
                );
            }

            // Write cell parser
            writeCellParser(allocation.root, 0, ctx);

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
            ctx.append(`var r = sc_0~${ops.reader(name, ctx)}();`);
            ctx.append(`sc_0.end_parse();`);
            ctx.append(`return r;`);
        });
    });
}

export function writeBouncedParser(
    name: string,
    forceInline: boolean,
    allocation: StorageAllocation,
    origin: TypeOrigin,
    ctx: WriterContext,
) {
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
            // Check prefix
            if (allocation.header) {
                ctx.append(
                    `throw_unless(${contractErrors.invalidPrefix.id}, sc_0~load_uint(${allocation.header.bits}) == ${allocation.header.value});`,
                );
            }

            // Write cell parser
            writeCellParser(allocation.root, 0, ctx);

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
    origin: TypeOrigin,
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
                return ${ops.typeAsOptional(name, ctx)}(sc~${ops.reader(name, ctx)}());
            `);
        });
    });
}

function writeCellParser(
    cell: AllocationCell,
    gen: number,
    ctx: WriterContext,
): number {
    // Write current fields
    for (const f of cell.ops) {
        writeFieldParser(f, gen, ctx);
    }

    // Handle next cell
    if (cell.next) {
        ctx.append(`slice sc_${gen + 1} = sc_${gen}~load_ref().begin_parse();`);
        return writeCellParser(cell.next, gen + 1, ctx);
    } else {
        return gen;
    }
}

function writeFieldParser(
    f: AllocationOperation,
    gen: number,
    ctx: WriterContext,
) {
    const op = f.op;
    const varName = `var v'${f.name}`;

    // Handle int
    if (op.kind === "int") {
        if (op.optional) {
            ctx.append(
                `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_int(${op.bits}) : null();`,
            );
        } else {
            ctx.append(`${varName} = sc_${gen}~load_int(${op.bits});`);
        }
        return;
    }
    if (op.kind === "uint") {
        if (op.optional) {
            ctx.append(
                `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_uint(${op.bits}) : null();`,
            );
        } else {
            ctx.append(`${varName} = sc_${gen}~load_uint(${op.bits});`);
        }
        return;
    }
    if (op.kind === "coins") {
        if (op.optional) {
            ctx.append(
                `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_coins() : null();`,
            );
        } else {
            ctx.append(`${varName} = sc_${gen}~load_coins();`);
        }
        return;
    }
    if (op.kind === "boolean") {
        if (op.optional) {
            ctx.append(
                `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_int(1) : null();`,
            );
        } else {
            ctx.append(`${varName} = sc_${gen}~load_int(1);`);
        }
        return;
    }
    if (op.kind === "address") {
        if (op.optional) {
            ctx.used(`__tact_load_address_opt`);
            ctx.append(`${varName} = sc_${gen}~__tact_load_address_opt();`);
        } else {
            ctx.used(`__tact_load_address`);
            ctx.append(`${varName} = sc_${gen}~__tact_load_address();`);
        }
        return;
    }
    if (op.kind === "cell") {
        if (op.optional) {
            if (op.format !== "default") {
                throw new Error(`Impossible`);
            }
            ctx.append(
                `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_ref() : null();`,
            );
        } else {
            if (op.format === "default") {
                ctx.append(`${varName} = sc_${gen}~load_ref();`);
            } else if (op.format === "remainder") {
                ctx.append(
                    `${varName} = begin_cell().store_slice(sc_${gen}).end_cell();`,
                );
            } else {
                throw new Error(`Impossible`);
            }
        }
        return;
    }
    if (op.kind === "slice") {
        if (op.optional) {
            if (op.format !== "default") {
                throw new Error(`Impossible`);
            }
            ctx.append(
                `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_ref().begin_parse() : null();`,
            );
        } else {
            if (op.format === "default") {
                ctx.append(`${varName} = sc_${gen}~load_ref().begin_parse();`);
            } else if (op.format === "remainder") {
                ctx.append(`${varName} = sc_${gen};`);
            } else {
                throw new Error(`Impossible`);
            }
        }
        return;
    }
    if (op.kind === "builder") {
        if (op.optional) {
            if (op.format !== "default") {
                throw new Error(`Impossible`);
            }
            ctx.append(
                `${varName} = sc_${gen}~load_int(1) ? begin_cell().store_slice(sc_${gen}~load_ref().begin_parse()) : null();`,
            );
        } else {
            if (op.format === "default") {
                ctx.append(
                    `${varName} = begin_cell().store_slice(sc_${gen}~load_ref().begin_parse());`,
                );
            } else if (op.format === "remainder") {
                ctx.append(`${varName} = begin_cell().store_slice(sc_${gen});`);
            } else {
                throw new Error(`Impossible`);
            }
        }
        return;
    }
    if (op.kind === "string") {
        if (op.optional) {
            ctx.append(
                `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_ref().begin_parse() : null();`,
            );
        } else {
            ctx.append(`${varName} = sc_${gen}~load_ref().begin_parse();`);
        }
        return;
    }
    if (op.kind === "fixed-bytes") {
        if (op.optional) {
            ctx.append(
                `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_bits(${op.bytes * 8}) : null();`,
            );
        } else {
            ctx.append(`${varName} = sc_${gen}~load_bits(${op.bytes * 8});`);
        }
        return;
    }
    if (op.kind === "map") {
        ctx.append(`${varName} = sc_${gen}~load_dict();`);
        return;
    }
    if (op.kind === "struct") {
        if (op.optional) {
            if (op.ref) {
                throw Error("Not implemented");
            } else {
                ctx.append(
                    `${varName} = sc_${gen}~load_int(1) ? ${ops.typeAsOptional(op.type, ctx)}(sc_${gen}~${ops.reader(op.type, ctx)}()) : null();`,
                );
            }
        } else {
            if (op.ref) {
                throw Error("Not implemented");
            } else {
                ctx.append(
                    `${varName} = sc_${gen}~${ops.reader(op.type, ctx)}();`,
                );
            }
        }
        return;
    }

    throw Error("Unsupported field kind: " + op.kind);
}
