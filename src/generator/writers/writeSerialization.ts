import { contractErrors } from "../../abi/errors";
import { AllocationCell, AllocationOperation } from "../../storage/operation";
import { StorageAllocation } from "../../storage/StorageAllocation";
import { TypeDescription } from "../../types/types";
import { WriterContext } from "../Writer";
import { resolveFuncType } from "./resolveFuncType";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";

//
// Serializer
//

export function writeSerializer(type: TypeDescription, allocation: StorageAllocation, ctx: WriterContext) {

    // Write to builder
    ctx.fun(`__gen_write_${type.name}`, () => {
        ctx.append(`builder __gen_write_${type.name}(builder build_0, ${resolveFuncType(allocation.type, ctx)} v) inline {`);
        ctx.inIndent(() => {
            ctx.append(`var ${resolveFuncTypeUnpack(allocation.type, `v`, ctx)} = v;`)
            if (allocation.header) {
                ctx.append(`build_0 = store_uint(build_0, ${allocation.header}, 32);`);
            }
            writeSerializerCell(allocation.root, type, 0, 0, ctx);
            ctx.append(`return build_0;`);
        });
        ctx.append(`}`);
    });

    // Write to cell
    ctx.fun(`__gen_writecell_${type.name}`, () => {
        ctx.append(`cell __gen_writecell_${type.name}(${resolveFuncType(allocation.type, ctx)} v) inline {`);
        ctx.inIndent(() => {
            ctx.used(`__gen_write_${type.name}`);
            ctx.append(`return __gen_write_${type.name}(begin_cell(), v).end_cell();`);
        });
        ctx.append(`}`);
    });

    // Write to slice
    ctx.fun(` __gen_writeslice_${type.name}`, () => {
        ctx.append(`slice __gen_writeslice_${type.name}(${resolveFuncType(allocation.type, ctx)} v}) inline {`);
        ctx.inIndent(() => {
            ctx.used(`__gen_writecell_${type.name}`);
            ctx.append(`return __gen_writecell_${type.name}(v).begin_parse();`);
        });
        ctx.append(`}`);
    });

    // Write to opt cell
    ctx.fun(`__gen_writecellopt_${type.name}`, () => {
        ctx.append(`cell __gen_writecellopt_${type.name}(tuple v) inline {`);
        ctx.inIndent(() => {

            // If null
            ctx.append(`if (null?(v)) {`);
            ctx.inIndent(() => {
                ctx.append(`return null();`);
            });
            ctx.append(`}`);

            // If not null
            ctx.used(`__gen_writecell_${type.name}`);
            ctx.used(`__gen_${type.name}_not_null`);
            ctx.append(`return __gen_writecell_${type.name}(__gen_${type.name}_not_null(v));`);
        });
        ctx.append(`}`);
    });
}

function writeSerializerCell(cell: AllocationCell, type: TypeDescription, offset: number, gen: number, ctx: WriterContext) {

    // Write fields
    for (let f of cell.ops) {
        writeSerializerField(f, type, offset++, gen, ctx);
    }

    // Tail
    if (cell.next) {
        ctx.append(`var build_${gen + 1} = begin_cell();`);
        writeSerializerCell(cell.next, type, offset + 1, gen + 1, ctx);
        ctx.append(`build_${gen} = store_ref(build_${gen}, build_${gen + 1}.end_cell());`);
    }
}

function writeSerializerField(f: AllocationOperation, type: TypeDescription, offset: number, gen: number, ctx: WriterContext) {
    let field = type.fields[offset];
    let fieldName = `v'${field.name}`;

    if (f.kind === 'int') {
        if (f.optional) {
            ctx.append(`build_${gen} = null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_int(${fieldName}, ${f.bits}) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_int(${fieldName}, ${f.bits});`);
        }
        return;
    }
    if (f.kind === 'uint') {
        if (f.optional) {
            ctx.append(`build_${gen} = null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_uint(${fieldName}, ${f.bits}) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_uint(${fieldName}, ${f.bits});`);
        }
        return;
    }
    if (f.kind === 'coins') {
        if (f.optional) {
            ctx.append(`build_${gen} = null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_coins(${fieldName}) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_coins(${fieldName});`);
        }
        return;
    }
    if (f.kind === 'boolean') {
        if (f.optional) {
            ctx.append(`build_${gen} = null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_int(${fieldName}, 1) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_int(${fieldName}, 1);`);
        }
        return;
    }
    if (f.kind === 'address') {
        if (f.optional) {
            ctx.used(`__tact_store_address_opt`);
            ctx.append(`build_${gen} = __tact_store_address_opt(build_${gen}, ${fieldName});`);
        } else {
            ctx.used(`__tact_store_address`);
            ctx.append(`build_${gen} = __tact_store_address(build_${gen}, ${fieldName});`);
        }
        return;
    }
    if (f.kind === 'cell') {
        if (f.format === 'default') {
            if (f.optional) {
                ctx.append(`build_${gen} = null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(${fieldName}) : build_${gen}.store_int(false, 1);`);
            } else {
                ctx.append(`build_${gen} = build_${gen}.store_ref(${fieldName});`);
            }
        } else if (f.format === 'remainder') {
            if (f.optional) {
                throw Error('Impossible');
            }
            ctx.append(`build_${gen} = build_${gen}.store_slice(${fieldName}.begin_parse());`);
        } else {
            throw Error('Impossible');
        }
        return;
    }
    if (f.kind === 'slice') {
        if (f.format === 'default') {
            if (f.optional) {
                ctx.append(`build_${gen} = null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(begin_cell().store_slice(${fieldName}).end_cell()) : build_${gen}.store_int(false, 1);`);
            } else {
                ctx.append(`build_${gen} = build_${gen}.store_ref(begin_cell().store_slice(${fieldName}).end_cell());`);
            }
        } else if (f.format === 'remainder') {
            if (f.optional) {
                throw Error('Impossible');
            }
            ctx.append(`build_${gen} = build_${gen}.store_slice(${fieldName});`);
        } else {
            throw Error('Impossible');
        }
        return;
    }
    if (f.kind === 'string') {
        if (f.optional) {
            ctx.append(`build_${gen} = null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(begin_cell().store_slice(${fieldName}).end_cell()) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_ref(begin_cell().store_slice(${fieldName}).end_cell());`);
        }
        return;
    }
    if (f.kind ==='fixed-bytes') {
        if (f.optional) {
            ctx.append(`build_${gen} = null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_slice(${fieldName}) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_slice(${fieldName});`);
        }
        return;
    }
    if (f.kind ==='map') {
        ctx.append(`build_${gen} = build_${gen}.store_dict(${fieldName});`);
        return;
    }
    // if (f.kind ==='struct') {
        
    // }

    // if (f.kind === 'optional') {
    //     if (f.inner.kind === 'address') {
    //         ctx.used(`__tact_store_address_opt`);
    //         ctx.append(`build_${index} = __tact_store_address_opt(build_${index}, v'${f.name});`);
    //     } else {
    //         ctx.append(`if (null?(v'${f.name})) {`);
    //         ctx.inIndent(() => {
    //             ctx.append(`build_${index} = store_int(build_${index}, false, 1);`);
    //         });
    //         ctx.append(`} else {`);
    //         ctx.inIndent(() => {
    //             ctx.append(`build_${index} = store_int(build_${index}, true, 1);`);
    //             writeSerializerField(f.inner, index, ctx, true);
    //         });
    //         ctx.append(`}`);
    //     }
    //     return;
    // }

    // // Handle primitives

    // if (f.kind === 'int') {
    //     ctx.append(`build_${index} = store_int(build_${index}, v'${f.name}, ${f.bits});`);
    //     return;
    // }

    // if (f.kind === 'uint') {
    //     ctx.append(`build_${index} = store_uint(build_${index}, v'${f.name}, ${f.bits});`);
    //     return;
    // }

    // if (f.kind === 'coins') {
    //     ctx.append(`build_${index} = store_coins(build_${index}, v'${f.name});`);
    //     return;
    // }

    // if (f.kind === 'slice') {
    //     ctx.append(`build_${index} = store_ref(build_${index}, begin_cell().store_slice(v'${f.name}).end_cell());`);
    //     return;
    // }

    // if (f.kind === 'cell') {
    //     ctx.append(`build_${index} = store_ref(build_${index}, v'${f.name});`);
    //     return;
    // }

    // if (f.kind === 'address') {
    //     ctx.used(`__tact_store_address`);
    //     ctx.append(`build_${index} = __tact_store_address(build_${index}, v'${f.name});`);
    //     return;
    // }

    // if (f.kind === 'map') {
    //     ctx.append(`build_${index} = store_dict(build_${index}, v'${f.name});`);
    //     return;
    // }

    // if (f.kind === 'remaining') {
    //     ctx.append(`build_${index} = store_slice(build_${index}, v'${f.name});`);
    //     return;
    // }

    // if (f.kind === 'bytes') {
    //     ctx.append(`build_${index} = store_slice(build_${index}, v'${f.name});`);
    //     return;
    // }

    // // Handle structs

    // if (f.kind === 'struct') {
    //     if (optional) {
    //         ctx.used(`__gen_write_${f.type.name}`);
    //         ctx.used(`__gen_${f.type.name}_not_null`);
    //         ctx.append(`build_${index} = __gen_write_${f.type.name}(build_${index}, __gen_${f.type.name}_not_null(v'${f.name}));`);
    //     } else {
    //         ctx.used(`__gen_write_${f.type.name}`);
    //         ctx.append(`build_${index} = __gen_write_${f.type.name}(build_${index}, ${resolveFuncTypeUnpack(f.type, `v'${f.name}`, ctx)});`);
    //     }
    //     return;
    // }

    throw Error('Unsupported field kind: ' + f.kind);
}

//
// Parser
//

export function writeParser(type: TypeDescription, allocation: StorageAllocation, ctx: WriterContext) {
    ctx.fun(`__gen_read_${type.name}`, () => {
        ctx.append(`(slice, (${resolveFuncType(allocation.type, ctx)})) __gen_read_${type.name}(slice sc_0) inline {`);
        ctx.inIndent(() => {

            // Check prefix
            if (allocation.header) {
                ctx.append(`throw_unless(${contractErrors.invalidPrefix.id}, sc_0~load_uint(32) == ${allocation.header});`);
            }

            // Write cell parser
            writeCellParser(allocation.root, type, 0, 0, ctx);

            // Compile tuple
            ctx.append(`return (sc_0, (${type.fields.map((v) => `v'${v.name}`).join(', ')}));`);
        });
        ctx.append("}");
    });

    ctx.fun(`__gen_readopt_${type.name}`, () => {
        ctx.append(`tuple __gen_readopt_${type.name}(cell cl) inline {`);
        ctx.inIndent(() => {
            ctx.append(`if (null?(cl)) {`);
            ctx.inIndent(() => {
                ctx.append(`return null();`);
            });
            ctx.append(`}`);
            ctx.used(`__gen_read_${type.name}(cl.begin_parse());`);
            ctx.used(`__gen_${type.name}_as_optional`)
            ctx.append(`return __gen_${type.name}_as_optional(__gen_read_${type.name}(cl.begin_parse()));`);
        });
        ctx.append("}");
    });
}

function writeCellParser(cell: AllocationCell, type: TypeDescription, offset: number, gen: number, ctx: WriterContext): number {

    // Write current fields
    for (let f of cell.ops) {
        writeFieldParser(f, type, offset++, gen, ctx);
    }

    // Handle next cell
    if (cell.next) {
        ctx.append(`slice sc_${gen + 1} = sc_${gen}~load_ref().begin_parse();`);
        return writeCellParser(cell.next, type, offset++, gen + 1, ctx);
    } else {
        return gen;
    }
}

function writeFieldParser(f: AllocationOperation, type: TypeDescription, offset: number, gen: number, ctx: WriterContext) {
    let field = type.fields[offset];
    let varName = `var v'${field.name}`;

    // Handle int
    if (f.kind === 'int') {
        if (f.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}.load_int(${f.bits}) : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}.load_int(${f.bits});`);
        }
        return;
    }
    if (f.kind === 'uint') {
        if (f.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}.load_uint(${f.bits}) : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}.load_uint(${f.bits});`);
        }
        return;
    }
    if (f.kind === 'coins') {
        if (f.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}.load_coins() : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}.load_coins();`);
        }
        return;
    }
    if (f.kind === 'boolean') {
        if (f.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}.load_int(1) : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}.load_boolean();`);
        }
        return;
    }
    if (f.kind === 'address') {
        if (f.optional) {
            ctx.used(`__tact_load_address_opt`);
            ctx.append(`${varName} = sc_${gen}~__tact_load_address_opt();`);
        } else {
            ctx.used(`__tact_load_address`);
            ctx.append(`${varName} = sc_${gen}~__tact_load_address();`);
        }
        return;
    }
    if (f.kind === 'cell') {
        if (f.optional) {
            if (f.format !== 'default') {
                throw new Error(`Impossible`);
            }
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}.load_ref() : null();`);
        } else {
            if (f.format === 'default') {
                ctx.append(`${varName} = sc_${gen}.load_ref();`);
            } else if (f.format === 'remainder') {
                ctx.append(`${varName} = begin_cell().store_slice(sc_${gen}).end_cell();`);
            } else {
                throw new Error(`Impossible`);
            }
        }
        return;
    }
    if (f.kind === 'slice') {
        if (f.optional) {
            if (f.format !== 'default') {
                throw new Error(`Impossible`);
            }
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}.load_ref().begin_parse() : null();`);
        } else {
            if (f.format === 'default') {
                ctx.append(`${varName} = sc_${gen}.load_ref().begin_parse();`);
            } else if (f.format === 'remainder') {
                ctx.append(`${varName} = sc_${gen});`);
            } else {
                throw new Error(`Impossible`);
            }
        }
        return;
    }
    if (f.kind === 'string') {
        if (f.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}.load_ref().begin_parse() : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}.load_ref().begin_parse();`);
        }
        return;
    }
    if (f.kind === 'fixed-bytes') {
        if (f.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}.load_bits(${f.bytes * 8}) : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}.load_bits(${f.bytes * 8});`);
        }
        return;
    }
    if (f.kind === 'map') {
        ctx.append(`${varName} = sc_${gen}.load_dict();`);
        return;
    }
    if (f.kind === 'struct') {
        ctx.used(`__gen_read_${f.type}`);
        if (f.optional) {
            ctx.used(`__gen_${f.type}_as_optional`);
            if (f.ref) {
                ctx.append(`${varName} = sc_${gen}~load_int(1) ? __gen_${f.type}_as_optional(__gen_read_${f.type}((sc_${gen}.load_ref().begin_parse())) : null();`);
            } else {
                ctx.append(`${varName} = sc_${gen}~load_int(1) ? __gen_${f.type}_as_optional(__gen_read_${f.type}(sc_${gen})) : null();`);
            }
        } else {
            if (f.ref) {
                ctx.append(`${varName} = __gen_read_${f.type}((sc_${gen}.load_ref().begin_parse());`);
            } else {
                ctx.append(`${varName} = __gen_read_${f.type}(sc_${gen});`);
            }
        }
        return;
    }

    throw Error('Unsupported field kind: ' + f.kind);
}

//
// Storage
//

export function writeStorageOps(type: TypeDescription, ctx: WriterContext) {

    // Load function
    ctx.fun(`__gen_load_${type.name}`, () => {
        ctx.append(`${resolveFuncType(type, ctx)} __gen_load_${type.name}() inline {`); // NOTE: Inline function
        ctx.inIndent(() => {

            // Load data slice
            ctx.append(`slice sc = get_data().begin_parse();`);

            // Load context
            ctx.used(`__tact_context`);
            ctx.append(`__tact_context_sys = sc~load_ref();`);

            // Load data
            ctx.used(`__gen_read_${type.name}`);
            ctx.append(`return sc~__gen_read_${type.name}();`);
        });
        ctx.append(`}`);
    });

    // Store function
    ctx.fun(`__gen_store_${type.name}`, () => {
        ctx.append(`() __gen_store_${type.name}(${resolveFuncType(type, ctx)} v) impure inline {`); // NOTE: Impure function
        ctx.inIndent(() => {
            ctx.append(`builder b = begin_cell();`);

            // Persist system cell
            ctx.used(`__tact_context`);
            ctx.append(`b = b.store_ref(__tact_context_sys);`);

            // Build data
            ctx.used(`__gen_write_${type.name}`);
            ctx.append(`b = __gen_write_${type.name}(b, v);`);

            // Persist data
            ctx.append(`set_data(b.end_cell());`);
        });
        ctx.append(`}`);
    });
}