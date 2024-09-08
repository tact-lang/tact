import { WriterContext, Location } from "./context";
import { contractErrors } from "../abi/errors";
import { getType } from "../types/resolveDescriptors";
import { TypeDescription } from "../types/types";
import { FuncAstType } from "../func/grammar";
import { FuncPrettyPrinter } from "../func/prettyPrinter";
import { ops } from "./util";
import {
    resolveFuncTypeUnpack,
    resolveFuncFlatPack,
    resolveFuncFlatTypes,
    resolveFuncTupleType,
    resolveFuncType,
} from "./type";

export function writeAccessors(type: TypeDescription, ctx: WriterContext) {
    const parse = (code: string) =>
        ctx.parse(code, { context: Location.type(type.name) });
    const ppty = (ty: FuncAstType): string =>
        new FuncPrettyPrinter().prettyPrintType(ty);

    // Getters
    for (const f of type.fields) {
        parse(`_ ${ops.typeField(type.name, f.name)}(${ppty(resolveFuncType(ctx.ctx, type))} v) inline {
                    var (${type.fields.map((v) => `v'${v.name}`).join(", ")}) = v;
                    return v'${f.name};
                }
        `);
    }

    // Tensor cast
    parse(
        `(${ppty(resolveFuncType(ctx.ctx, type))}) ${ops.typeTensorCast(type.name)}(${ppty(resolveFuncType(ctx.ctx, type))} v) asm "NOP";`,
    );

    // Not null
    {
        const flatPack = resolveFuncFlatPack(ctx.ctx, type, "vvv");
        const flatTypes = resolveFuncFlatTypes(ctx.ctx, type);
        if (flatPack.length !== flatTypes.length)
            throw Error("Flat pack and flat types length mismatch");
        const pairs = flatPack.map((v, i) => `${ppty(flatTypes[i]!)} ${v}`);
        parse(`(${ppty(resolveFuncType(ctx.ctx, type))}) ${ops.typeNotNull(type.name)}(tuple v) inline {
            throw_if(${contractErrors.null.id}, null?(v));
            (${pairs.join(", ")}) = __tact_tuple_destroy_${flatPack.length}(v);
            return ${resolveFuncTypeUnpack(ctx.ctx, type, "vvv")};
        }`);
    }

    // As optional
    {
        const flatPack = resolveFuncFlatPack(ctx.ctx, type, "v");
        parse(`tuple ${ops.typeAsOptional(type.name)}(${ppty(resolveFuncType(ctx.ctx, type))} v) inline {
            var ${resolveFuncTypeUnpack(ctx.ctx, type, "v")} = v;
            return __tact_tuple_create_${flatPack.length}(${flatPack.join(", ")});
        }`);
    }

    //
    // Convert to and from tuple representation
    //

    {
        const vars: string[] = [];
        for (const f of type.fields) {
            if (f.type.kind === "ref") {
                const t = getType(ctx.ctx, f.type.name);
                if (t.kind === "struct") {
                    if (f.type.optional) {
                        vars.push(
                            `${ops.typeToOptTuple(f.type.name)}(v'${f.name})`,
                        );
                    } else {
                        vars.push(
                            `${ops.typeToTuple(f.type.name)}(v'${f.name})`,
                        );
                    }
                    continue;
                }
            }
            vars.push(`v'${f.name}`);
        }
        parse(`tuple ${ops.typeToTuple(type.name)}((${ppty(resolveFuncType(ctx.ctx, type))}) v) inline {
            var (${type.fields.map((v) => `v'${v.name}`).join(", ")}) = v;
            return __tact_tuple_create_${vars.length}(${vars.join(", ")});
        }`);
    }

    parse(`tuple ${ops.typeToOptTuple(type.name)}(tuple v) inline {
            if (null?(v)) { return null(); }
            return ${ops.typeToTuple(type.name)}(${ops.typeNotNull(type.name)}(v));
        }`);

    {
        const vars: string[] = [];
        const out: string[] = [];
        for (const f of type.fields) {
            if (f.type.kind === "ref") {
                const t = getType(ctx.ctx, f.type.name);
                if (t.kind === "struct") {
                    vars.push(`tuple v'${f.name}`);
                    if (f.type.optional) {
                        out.push(
                            `${ops.typeFromOptTuple(f.type.name)}(v'${f.name})`,
                        );
                    } else {
                        out.push(
                            `${ops.typeFromTuple(f.type.name)}(v'${f.name})`,
                        );
                    }
                    continue;
                } else if (
                    t.kind === "primitive_type_decl" &&
                    t.name === "Address"
                ) {
                    if (f.type.optional) {
                        vars.push(
                            `${ppty(resolveFuncType(ctx.ctx, f.type))} v'${f.name}`,
                        );
                        out.push(
                            `null?(v'${f.name}) ? null() : __tact_verify_address(v'${f.name})`,
                        );
                    } else {
                        vars.push(
                            `${ppty(resolveFuncType(ctx.ctx, f.type))} v'${f.name}`,
                        );
                        out.push(`__tact_verify_address(v'${f.name})`);
                    }
                    continue;
                }
            }
            vars.push(`${ppty(resolveFuncType(ctx.ctx, f.type))} v'${f.name}`);
            out.push(`v'${f.name}`);
        }
        parse(`(${type.fields.map((v) => `${ppty(resolveFuncType(ctx.ctx, v.type))}`).join(", ")}) ${ops.typeFromTuple(type.name)}(tuple v) inline {
            (${vars.join(", ")}) = __tact_tuple_destroy_${vars.length}(v);
            return (${out.join(", ")});
        }`);
    }

    parse(`tuple ${ops.typeFromOptTuple(type.name)}(tuple v) inline {
                if (null?(v)) { return null(); }
                return ${ops.typeAsOptional(type.name)}(${ops.typeFromTuple(type.name)}(v));
            }
    `);

    //
    // Convert to and from external representation
    //

    {
        const vars: string[] = [];
        for (const f of type.fields) {
            if (f.type.kind === "ref") {
                const t = getType(ctx.ctx, f.type.name);
                if (t.kind === "struct") {
                    if (f.type.optional) {
                        vars.push(
                            `${ops.typeToOptTuple(f.type.name)}(v'${f.name})`,
                        );
                    } else {
                        vars.push(
                            `${ops.typeToTuple(f.type.name)}(v'${f.name})`,
                        );
                    }
                    continue;
                }
            }
            vars.push(`v'${f.name}`);
        }
        parse(`(${type.fields
            .map((v) => resolveFuncTupleType(ctx.ctx, v.type))
            .map((ty) => `${ppty(ty)}`)
            .join(
                ", ",
            )}) ${ops.typeToExternal(type.name)}((${ppty(resolveFuncType(ctx.ctx, type))}) v) inline {
            var (${type.fields.map((v) => `v'${v.name}`).join(", ")}) = v;
            return (${vars.join(", ")});
        }`);
    }

    parse(`tuple ${ops.typeToOptExternal(type.name)}(tuple v) inline {
        var loaded = ${ops.typeToOptTuple(type.name)}(v);
        if (null?(loaded)) {
            return null();
        } else {
            return (loaded);
        }
    }`);
}
