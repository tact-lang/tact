import { contractErrors } from "../../abi/errors";
import { getType } from "../../types/resolveDescriptors";
import { TypeDescription } from "../../types/types";
import { WriterContext } from "../Writer";
import { resolveFuncFlatPack } from "./resolveFuncFlatPack";
import { resolveFuncFlatTypes } from "./resolveFuncFlatTypes";
import { resolveFuncTupledType } from "./resolveFuncTupledType";
import { resolveFuncType } from "./resolveFuncType";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";

export function writeAccessors(type: TypeDescription, ctx: WriterContext) {

    // Getters
    for (let f of type.fields) {
        ctx.fun(`__gen_${type.name}_get_${f.name}`, () => {
            ctx.append(`_ __gen_${type.name}_get_${f.name}(${resolveFuncType(type, ctx)} v) inline {`);
            ctx.inIndent(() => {
                ctx.append(`var (${type.fields.map((v) => `v'${v.name}`).join(', ')}) = v;`);
                ctx.append(`return v'${f.name};`);
            });
            ctx.append(`}`);
        });
    }

    // Unpack
    ctx.fun(`__gen_${type.name}_unpack`, () => {
        ctx.append(`(${resolveFuncType(type, ctx)}) __gen_${type.name}_unpack(${resolveFuncType(type, ctx)} v) asm "NOP";`);
    });

    // Not null
    ctx.fun(`__gen_${type.name}_not_null`, () => {
        ctx.append(`(${resolveFuncType(type, ctx)}) __gen_${type.name}_not_null(tuple v) inline {`);
        ctx.inIndent(() => {
            ctx.append(`throw_if(${contractErrors.null.id}, null?(v));`)
            let flatPack = resolveFuncFlatPack(type, 'vvv', ctx);
            let flatTypes = resolveFuncFlatTypes(type, ctx);
            if (flatPack.length !== flatTypes.length) throw Error('Flat pack and flat types length mismatch');
            let pairs = flatPack.map((v, i) => `${flatTypes[i]} ${v}`);
            ctx.used(`__tact_tuple_destroy_${flatPack.length}`);
            ctx.append(`var (${pairs.join(', ')}) = __tact_tuple_destroy_${flatPack.length}(v);`);
            ctx.append(`return ${resolveFuncTypeUnpack(type, 'vvv', ctx)};`);
        });
        ctx.append(`}`);
    });

    ctx.fun(`__gen_${type.name}_as_optional`, () => {
        ctx.append(`tuple __gen_${type.name}_as_optional((${resolveFuncType(type, ctx)}) v) inline {`);
        ctx.inIndent(() => {
            ctx.append(`var ${resolveFuncTypeUnpack(type, 'v', ctx)} = v;`);
            let flatPack = resolveFuncFlatPack(type, 'v', ctx);
            ctx.used(`__tact_tuple_create_${flatPack.length}`);
            ctx.append(`return __tact_tuple_create_${flatPack.length}(${flatPack.join(', ')});`);
        });
        ctx.append(`}`);
    });

    //
    // Convert to and from tupled representation
    //

    ctx.fun(`__gen_${type.name}_to_tuple`, () => {
        ctx.append(`tuple __gen_${type.name}_to_tuple((${resolveFuncType(type, ctx)}) v) {`);
        ctx.inIndent(() => {
            ctx.append(`var (${type.fields.map((v) => `v'${v.name}`).join(', ')}) = v;`);
            let vars: string[] = [];
            for (let f of type.fields) {
                if (f.type.kind === 'ref') {
                    let t = getType(ctx.ctx, f.type.name);
                    if (t.kind === 'struct') {
                        if (f.type.optional) {
                            vars.push(`__gen_${f.type.name}_opt_to_tuple(v'${f.name})`);
                        } else {
                            vars.push(`__gen_${f.type.name}_to_tuple(v'${f.name})`);
                        }
                        continue;
                    }
                }
                vars.push(`v'${f.name}`);
            }
            ctx.used(`__tact_tuple_create_${vars.length}`);
            ctx.append(`return __tact_tuple_create_${vars.length}(${vars.join(', ')});`);
        });
        ctx.append(`}`);
    });

    ctx.fun(`__gen_${type.name}_opt_to_tuple`, () => {
        ctx.append(`tuple __gen_${type.name}_opt_to_tuple(tuple v) inline {`);
        ctx.inIndent(() => {
            ctx.append(`if (null?(v)) { return null(); } `);
            ctx.used(`__gen_${type.name}_not_null`);
            ctx.used(`__gen_${type.name}_to_tuple`);
            ctx.append(`return __gen_${type.name}_to_tuple(__gen_${type.name}_not_null(v)); `);
        });
        ctx.append(`}`);
    });

    ctx.fun(`__gen_${type.name}_from_tuple`, () => {
        ctx.append(`(${type.fields.map((v) => resolveFuncType(v.type, ctx)).join(', ')}) __gen_${type.name}_from_tuple(tuple v) {`);
        ctx.inIndent(() => {

            // Resolve vars
            let vars: string[] = [];
            let out: string[] = [];
            for (let f of type.fields) {
                if (f.type.kind === 'ref') {
                    let t = getType(ctx.ctx, f.type.name);
                    if (t.kind === 'struct') {
                        vars.push(`tuple v'${f.name}`);
                        if (f.type.optional) {
                            ctx.used(`__gen_${f.type.name}_from_opt_tuple`);
                            out.push(`__gen_${f.type.name}_from_opt_tuple(v'${f.name})`);
                        } else {
                            ctx.used(`__gen_${f.type.name}_from_tuple`);
                            out.push(`__gen_${f.type.name}_from_tuple(v'${f.name})`);
                        }
                        continue;
                    }
                }
                vars.push(`${resolveFuncType(f.type, ctx)} v'${f.name}`);
                out.push(`v'${f.name}`);
            }
            ctx.used(`__tact_tuple_destroy_${vars.length}`);
            ctx.append(`var (${vars.join(', ')}) = __tact_tuple_destroy_${vars.length}(v);`);
            ctx.append(`return (${out.join(', ')});`);
        });
        ctx.append(`}`);
    });

    ctx.fun(`__gen_${type.name}_from_opt_tuple`, () => {
        ctx.append(`tuple __gen_${type.name}_from_opt_tuple(tuple v) {`);
        ctx.inIndent(() => {
            ctx.append(`if (null?(v)) { return null(); } `);
            ctx.used(`__gen_${type.name}_as_optional`);
            ctx.used(`__gen_${type.name}_from_tuple`);
            ctx.append(`return __gen_${type.name}_as_optional(__gen_${type.name}_from_tuple(v));`);
        });
        ctx.append(`}`);
    });

    //
    // Convert to and from external representation
    //

    ctx.fun(`__gen_${type.name}_to_external`, () => {
        ctx.append(`(${type.fields.map((v) => resolveFuncTupledType(v.type, ctx)).join(', ')}) __gen_${type.name}_to_external((${resolveFuncType(type, ctx)}) v) {`);
        ctx.inIndent(() => {
            ctx.append(`var (${type.fields.map((v) => `v'${v.name}`).join(', ')}) = v; `);
            let vars: string[] = [];
            for (let f of type.fields) {
                if (f.type.kind === 'ref') {
                    let t = getType(ctx.ctx, f.type.name);
                    if (t.kind === 'struct') {
                        if (f.type.optional) {
                            ctx.used(`__gen_${f.type.name}_opt_to_tuple`);
                            vars.push(`__gen_${f.type.name}_opt_to_tuple(v'${f.name})`);
                        } else {
                            ctx.used(`__gen_${f.type.name}_to_tuple`);
                            vars.push(`__gen_${f.type.name}_to_tuple(v'${f.name})`);
                        }
                        continue;
                    }
                }
                vars.push(`v'${f.name}`);
            }
            ctx.append(`return (${vars.join(', ')});`);
        });
        ctx.append(`}`);
    });

    ctx.fun(`__gen_${type.name}_opt_to_external`, () => {
        ctx.append(`tuple __gen_${type.name}_opt_to_external(tuple v) inline {`);
        ctx.inIndent(() => {
            ctx.used(`__gen_${type.name}_opt_to_tuple`);
            ctx.append(`var loaded = __gen_${type.name}_opt_to_tuple(v);`);
            ctx.append(`if (null?(loaded)) {`);
            ctx.inIndent(() => {
                ctx.append(`return null();`);
            });
            ctx.append(`} else {`)
            ctx.inIndent(() => {
                ctx.append(`return (loaded);`);
            });
            ctx.append(`}`);
        });
        ctx.append(`}`);
    });
}