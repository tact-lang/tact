import { contractErrors } from "../abi/errors";
import { throwInternalCompilerError } from "../errors";
import { dummySrcInfo } from "../grammar/grammar";
import { AllocationCell, AllocationOperation } from "../storage/operation";
import { StorageAllocation } from "../storage/StorageAllocation";
import { getType } from "../types/resolveDescriptors";
import { WriterContext, Location } from "./context";
import { ops } from "./util";
import { resolveFuncTypeFromAbiUnpack, resolveFuncTypeFromAbi } from "./type";

const SMALL_STRUCT_MAX_FIELDS = 5;

//
// Serializer
//

export function writeSerializer(
    name: string,
    forceInline: boolean,
    allocation: StorageAllocation,
    ctx: WriterContext,
) {
    const parse = (code: string) =>
        ctx.parse(code, { context: Location.type(name) });
    const isSmall = allocation.ops.length <= SMALL_STRUCT_MAX_FIELDS;

    // Write to builder
    parse(`builder ${ops.writer(name)}(builder build_0, ${resolveFuncTypeFromAbi(
        ctx.ctx,
        allocation.ops.map((v) => v.type),
    )} v) ${forceInline || isSmall ? "inline" : ""} {
        ${allocation.ops.length > 0 ? `${resolveFuncTypeFromAbiUnpack(ctx.ctx, "v", allocation.ops)} = v;` : ""}
        ${allocation.header ? `build_0 = store_uint(build_0, ${allocation.header.value}, ${allocation.header.bits});` : ""}
        ${writeSerializerCell(allocation.root, 0, ctx)};
        return build_0;
    }
`);

    // Write to cell
    parse(`cell ${ops.writerCell(name)}(${resolveFuncTypeFromAbi(
        ctx.ctx,
        allocation.ops.map((v) => v.type),
    )} v) inline {
            return ${ops.writer(name)}(begin_cell(), v).end_cell();
        }
    `);
}

export function writeOptionalSerializer(name: string, ctx: WriterContext) {
    const parse = (code: string) =>
        ctx.parse(code, { context: Location.type(name) });
    parse(`cell ${ops.writerCellOpt(name)}(tuple v) inline {
        if (null?(v)) {
            return null();
        }
        return ${ops.writerCell(name)}(${ops.typeNotNull(name)}(v));
    }`);
}

function writeSerializerCell(
    cell: AllocationCell,
    gen: number,
    ctx: WriterContext,
): string {
    const result = [];

    // Write fields
    for (const f of cell.ops) {
        result.push(writeSerializerField(f, gen, ctx));
    }

    // Tail
    if (cell.next) {
        result.push(`var build_${gen + 1} = begin_cell();`);
        result.push(writeSerializerCell(cell.next, gen + 1, ctx));
        result.push(
            `build_${gen} = store_ref(build_${gen}, build_${gen + 1}.end_cell());`,
        );
    }

    return result.join("\n");
}

function writeSerializerField(
    f: AllocationOperation,
    gen: number,
    ctx: WriterContext,
): string {
    const result: string[] = [];
    const fieldName = `v'${f.name}`;
    const op = f.op;

    switch (op.kind) {
        case "int": {
            if (op.optional) {
                result.push(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_int(${fieldName}, ${op.bits}) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                result.push(
                    `build_${gen} = build_${gen}.store_int(${fieldName}, ${op.bits});`,
                );
            }
            return result.join("\n");
        }
        case "uint": {
            if (op.optional) {
                result.push(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_uint(${fieldName}, ${op.bits}) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                result.push(
                    `build_${gen} = build_${gen}.store_uint(${fieldName}, ${op.bits});`,
                );
            }
            return result.join("\n");
        }
        case "coins": {
            if (op.optional) {
                result.push(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_coins(${fieldName}) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                result.push(
                    `build_${gen} = build_${gen}.store_coins(${fieldName});`,
                );
            }
            return result.join("\n");
        }
        case "boolean": {
            if (op.optional) {
                result.push(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_int(${fieldName}, 1) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                result.push(
                    `build_${gen} = build_${gen}.store_int(${fieldName}, 1);`,
                );
            }
            return result.join("\n");
        }
        case "address": {
            if (op.optional) {
                result.push(
                    `build_${gen} = __tact_store_address_opt(build_${gen}, ${fieldName});`,
                );
            } else {
                result.push(
                    `build_${gen} = __tact_store_address(build_${gen}, ${fieldName});`,
                );
            }
            return result.join("\n");
        }
        case "cell": {
            switch (op.format) {
                case "default":
                    {
                        if (op.optional) {
                            result.push(
                                `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(${fieldName}) : build_${gen}.store_int(false, 1);`,
                            );
                        } else {
                            result.push(
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
                        result.push(
                            `build_${gen} = build_${gen}.store_slice(${fieldName}.begin_parse());`,
                        );
                    }
                    break;
            }
            return result.join("\n");
        }
        case "slice": {
            switch (op.format) {
                case "default":
                    {
                        if (op.optional) {
                            result.push(
                                `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(begin_cell().store_slice(${fieldName}).end_cell()) : build_${gen}.store_int(false, 1);`,
                            );
                        } else {
                            result.push(
                                `build_${gen} = build_${gen}.store_ref(begin_cell().store_slice(${fieldName}).end_cell());`,
                            );
                        }
                    }
                    break;
                case "remainder": {
                    if (op.optional) {
                        throw Error("Impossible");
                    }
                    result.push(
                        `build_${gen} = build_${gen}.store_slice(${fieldName});`,
                    );
                }
            }
            return result.join("\n");
        }
        case "builder": {
            switch (op.format) {
                case "default":
                    {
                        if (op.optional) {
                            result.push(
                                `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(begin_cell().store_slice(${fieldName}.end_cell().begin_parse()).end_cell()) : build_${gen}.store_int(false, 1);`,
                            );
                        } else {
                            result.push(
                                `build_${gen} = build_${gen}.store_ref(begin_cell().store_slice(${fieldName}.end_cell().begin_parse()).end_cell());`,
                            );
                        }
                    }
                    break;
                case "remainder": {
                    if (op.optional) {
                        throw Error("Impossible");
                    }
                    result.push(
                        `build_${gen} = build_${gen}.store_slice(${fieldName}.end_cell().begin_parse());`,
                    );
                }
            }
            return result.join("\n");
        }
        case "string": {
            if (op.optional) {
                result.push(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(begin_cell().store_slice(${fieldName}).end_cell()) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                result.push(
                    `build_${gen} = build_${gen}.store_ref(begin_cell().store_slice(${fieldName}).end_cell());`,
                );
            }
            return result.join("\n");
        }
        case "fixed-bytes": {
            if (op.optional) {
                result.push(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_slice(${fieldName}) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                result.push(
                    `build_${gen} = build_${gen}.store_slice(${fieldName});`,
                );
            }
            return result.join("\n");
        }
        case "map": {
            result.push(
                `build_${gen} = build_${gen}.store_dict(${fieldName});`,
            );
            return result.join("\n");
        }
        case "struct": {
            if (op.ref) {
                throw Error("Not implemented");
            }
            if (op.optional) {
                result.push(
                    `build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).${ops.writer(op.type)}(${ops.typeNotNull(op.type)}(${fieldName})) : build_${gen}.store_int(false, 1);`,
                );
            } else {
                const ff = getType(ctx.ctx, op.type).fields.map((f) => f.abi);
                result.push(
                    `build_${gen} = ${ops.writer(op.type)}(build_${gen}, ${resolveFuncTypeFromAbiUnpack(ctx.ctx, fieldName, ff)});`,
                );
            }
            return result.join("\n");
        }
    }

    throwInternalCompilerError(`Unsupported field kind`, dummySrcInfo);
}

//
// Parser
//

export function writeParser(
    name: string,
    forceInline: boolean,
    allocation: StorageAllocation,
    ctx: WriterContext,
) {
    const isSmall = allocation.ops.length <= SMALL_STRUCT_MAX_FIELDS;
    const parse = (code: string) =>
        ctx.parse(code, { context: Location.type(name) });

    {
        const result = [];
        result.push(
            `(slice, (${resolveFuncTypeFromAbi(
                ctx.ctx,
                allocation.ops.map((v) => v.type),
            )})) ${ops.reader(name)}(slice sc_0) ${forceInline || isSmall ? "inline" : ""} {`,
        );
        if (allocation.header) {
            result.push(`
                throw_unless(${contractErrors.invalidPrefix.id}, sc_0~load_uint(${allocation.header.bits}) == ${allocation.header.value});
            `);
        }
        result.push(writeCellParser(allocation.root, 0, ctx));
        if (allocation.ops.length === 0) {
            result.push("return (sc_0, null());");
        } else {
            result.push(`
                return (sc_0, (${allocation.ops.map((v) => `v'${v.name}`).join(", ")}));
            `);
        }
        result.push("}");
        parse(result.join("\n"));
    }

    // Write non-modifying variant
    parse(`${resolveFuncTypeFromAbi(
        ctx.ctx,
        allocation.ops.map((v) => v.type),
    )} ${ops.readerNonModifying(name)}(slice sc_0) ${forceInline || isSmall ? "inline" : ""} {
            var r = sc_0~${ops.reader(name)}();
            sc_0.end_parse();
            return r;
        }`);
}

export function writeBouncedParser(
    name: string,
    forceInline: boolean,
    allocation: StorageAllocation,
    ctx: WriterContext,
) {
    const isSmall = allocation.ops.length <= SMALL_STRUCT_MAX_FIELDS;
    const parse = (code: string) =>
        ctx.parse(code, { context: Location.type(name) });

    {
        const result = [];
        result.push(
            `(slice, (${resolveFuncTypeFromAbi(
                ctx.ctx,
                allocation.ops.map((v) => v.type),
            )})) ${ops.readerBounced(name)}(slice sc_0) ${forceInline || isSmall ? "inline" : ""} {`,
        );
        if (allocation.header) {
            result.push(
                `throw_unless(${contractErrors.invalidPrefix.id}, sc_0~load_uint(${allocation.header.bits}) == ${allocation.header.value});`,
            );
        }
        result.push(writeCellParser(allocation.root, 0, ctx));
        if (allocation.ops.length === 0) {
            result.push("return (sc_0, null());");
        } else {
            result.push(
                `return (sc_0, (${allocation.ops.map((v) => `v'${v.name}`).join(", ")}));`,
            );
        }
        result.push("}");
        parse(result.join("\n"));
    }
}

export function writeOptionalParser(name: string, ctx: WriterContext) {
    const parse = (code: string) =>
        ctx.parse(code, { context: Location.type(name) });
    parse(`tuple ${ops.readerOpt(name)}(cell cl) inline {
        if (null?(cl)) {
            return null();
        }
        var sc = cl.begin_parse();
        return ${ops.typeAsOptional(name)}(sc~${ops.reader(name)}());
    }`);
}

function writeCellParser(
    cell: AllocationCell,
    gen: number,
    ctx: WriterContext,
): string {
    const result: string[] = [];

    // Write current fields
    for (const f of cell.ops) {
        result.push(writeFieldParser(f, gen));
    }

    // Handle next cell
    if (cell.next) {
        result.push(
            `slice sc_${gen + 1} = sc_${gen}~load_ref().begin_parse();\n`,
        );
        result.push(writeCellParser(cell.next, gen + 1, ctx));
    }

    return result.join("\n");
}

function writeFieldParser(f: AllocationOperation, gen: number): string {
    const result: string[] = [];
    const op = f.op;
    const varName = `var v'${f.name}`;

    switch (op.kind) {
        case "int": {
            if (op.optional) {
                result.push(
                    `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_int(${op.bits}) : null();`,
                );
            } else {
                result.push(`${varName} = sc_${gen}~load_int(${op.bits});`);
            }
            return result.join("\n");
        }
        case "uint": {
            if (op.optional) {
                result.push(
                    `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_uint(${op.bits}) : null();`,
                );
            } else {
                result.push(`${varName} = sc_${gen}~load_uint(${op.bits});`);
            }
            return result.join("\n");
        }
        case "coins": {
            if (op.optional) {
                result.push(
                    `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_coins() : null();`,
                );
            } else {
                result.push(`${varName} = sc_${gen}~load_coins();`);
            }
            return result.join("\n");
        }
        case "boolean": {
            if (op.optional) {
                result.push(
                    `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_int(1) : null();`,
                );
            } else {
                result.push(`${varName} = sc_${gen}~load_int(1);`);
            }
            return result.join("\n");
        }
        case "address": {
            if (op.optional) {
                result.push(
                    `${varName} = sc_${gen}~__tact_load_address_opt();`,
                );
            } else {
                result.push(`${varName} = sc_${gen}~__tact_load_address();`);
            }
            return result.join("\n");
        }
        case "cell": {
            if (op.optional) {
                if (op.format !== "default") {
                    throw new Error(`Impossible`);
                }
                result.push(
                    `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_ref() : null();`,
                );
            } else {
                switch (op.format) {
                    case "default":
                        {
                            result.push(`${varName} = sc_${gen}~load_ref();`);
                        }
                        break;
                    case "remainder": {
                        result.push(
                            `${varName} = begin_cell().store_slice(sc_${gen}).end_cell();`,
                        );
                    }
                }
            }
            return result.join("\n");
        }
        case "slice": {
            if (op.optional) {
                if (op.format !== "default") {
                    throw new Error(`Impossible`);
                }
                result.push(
                    `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_ref().begin_parse() : null();`,
                );
            } else {
                switch (op.format) {
                    case "default":
                        {
                            result.push(
                                `${varName} = sc_${gen}~load_ref().begin_parse();`,
                            );
                        }
                        break;
                    case "remainder":
                        {
                            result.push(`${varName} = sc_${gen};`);
                        }
                        break;
                }
            }
            return result.join("\n");
        }
        case "builder": {
            if (op.optional) {
                if (op.format !== "default") {
                    throw new Error(`Impossible`);
                }
                result.push(
                    `${varName} = sc_${gen}~load_int(1) ? begin_cell().store_slice(sc_${gen}~load_ref().begin_parse()) : null();`,
                );
            } else {
                switch (op.format) {
                    case "default":
                        {
                            result.push(
                                `${varName} = begin_cell().store_slice(sc_${gen}~load_ref().begin_parse());`,
                            );
                        }
                        break;
                    case "remainder":
                        {
                            result.push(
                                `${varName} = begin_cell().store_slice(sc_${gen});`,
                            );
                        }
                        break;
                }
            }
            return result.join("\n");
        }
        case "string": {
            if (op.optional) {
                result.push(
                    `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_ref().begin_parse() : null();`,
                );
            } else {
                result.push(`${varName} = sc_${gen}~load_ref().begin_parse();`);
            }
            return result.join("\n");
        }
        case "fixed-bytes": {
            if (op.optional) {
                result.push(
                    `${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_bits(${op.bytes * 8}) : null();`,
                );
            } else {
                result.push(
                    `${varName} = sc_${gen}~load_bits(${op.bytes * 8});`,
                );
            }
            return result.join("\n");
        }
        case "map": {
            result.push(`${varName} = sc_${gen}~load_dict();`);
            return result.join("\n");
        }
        case "struct": {
            if (op.optional) {
                if (op.ref) {
                    throw Error("Not implemented");
                } else {
                    result.push(
                        `${varName} = sc_${gen}~load_int(1) ? ${ops.typeAsOptional(op.type)}(sc_${gen}~${ops.reader(op.type)}()) : null();`,
                    );
                }
            } else {
                if (op.ref) {
                    throw Error("Not implemented");
                } else {
                    result.push(
                        `${varName} = sc_${gen}~${ops.reader(op.type)}();`,
                    );
                }
            }
            return result.join("\n");
        }
    }
}
