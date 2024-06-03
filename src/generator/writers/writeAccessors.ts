import { contractErrors } from "../../abi/errors";
import { getType } from "../../types/resolveDescriptors";
import { TypeDescription, TypeOrigin } from "../../types/types";
import { WriterContext } from "../Writer";
import { ops } from "./ops";
import { resolveFuncFlatPack } from "./resolveFuncFlatPack";
import { resolveFuncFlatTypes } from "./resolveFuncFlatTypes";
import { resolveFuncTupleType } from "./resolveFuncTupleType";
import { resolveFuncType } from "./resolveFuncType";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";

export function writeAccessors(
    type: TypeDescription,
    origin: TypeOrigin,
    ctx: WriterContext,
) {
    // Getters
    for (const f of type.fields) {
        ctx.fun(ops.typeField(type.name, f.name, ctx), () => {
            ctx.signature(
                `_ ${ops.typeField(type.name, f.name, ctx)}(${resolveFuncType(type, ctx)} v)`,
            );
            ctx.flag("inline");
            ctx.context("type:" + type.name);
            ctx.body(() => {
                ctx.append(
                    `var (${type.fields.map((v) => `v'${v.name}`).join(", ")}) = v;`,
                );
                ctx.append(`return v'${f.name};`);
            });
        });
    }

    // Tensor cast
    ctx.fun(ops.typeTensorCast(type.name, ctx), () => {
        ctx.signature(
            `(${resolveFuncType(type, ctx)}) ${ops.typeTensorCast(type.name, ctx)}(${resolveFuncType(type, ctx)} v)`,
        );
        ctx.context("type:" + type.name);
        ctx.asm('asm "NOP"');
    });

    // Not null
    ctx.fun(ops.typeNotNull(type.name, ctx), () => {
        ctx.signature(
            `(${resolveFuncType(type, ctx)}) ${ops.typeNotNull(type.name, ctx)}(tuple v)`,
        );
        ctx.flag("inline");
        ctx.context("type:" + type.name);
        ctx.body(() => {
            ctx.append(`throw_if(${contractErrors.null.id}, null?(v));`);
            const flatPack = resolveFuncFlatPack(type, "vvv", ctx);
            const flatTypes = resolveFuncFlatTypes(type, ctx);
            if (flatPack.length !== flatTypes.length)
                throw Error("Flat pack and flat types length mismatch");
            const pairs = flatPack.map((v, i) => `${flatTypes[i]} ${v}`);
            ctx.used(`__tact_tuple_destroy_${flatPack.length}`);
            ctx.append(
                `var (${pairs.join(", ")}) = __tact_tuple_destroy_${flatPack.length}(v);`,
            );
            ctx.append(`return ${resolveFuncTypeUnpack(type, "vvv", ctx)};`);
        });
    });

    // As optional
    ctx.fun(ops.typeAsOptional(type.name, ctx), () => {
        ctx.signature(
            `tuple ${ops.typeAsOptional(type.name, ctx)}(${resolveFuncType(type, ctx)} v)`,
        );
        ctx.flag("inline");
        ctx.context("type:" + type.name);
        ctx.body(() => {
            ctx.append(`var ${resolveFuncTypeUnpack(type, "v", ctx)} = v;`);
            const flatPack = resolveFuncFlatPack(type, "v", ctx);
            ctx.used(`__tact_tuple_create_${flatPack.length}`);
            ctx.append(
                `return __tact_tuple_create_${flatPack.length}(${flatPack.join(", ")});`,
            );
        });
    });

    //
    // Convert to and from tuple representation
    //

    ctx.fun(ops.typeToTuple(type.name, ctx), () => {
        ctx.signature(
            `tuple ${ops.typeToTuple(type.name, ctx)}((${resolveFuncType(type, ctx)}) v)`,
        );
        ctx.flag("inline");
        ctx.context("type:" + type.name);
        ctx.body(() => {
            ctx.append(
                `var (${type.fields.map((v) => `v'${v.name}`).join(", ")}) = v;`,
            );
            const vars: string[] = [];
            for (const f of type.fields) {
                if (f.type.kind === "ref") {
                    const t = getType(ctx.ctx, f.type.name);
                    if (t.kind === "struct") {
                        if (f.type.optional) {
                            vars.push(
                                `${ops.typeToOptTuple(f.type.name, ctx)}(v'${f.name})`,
                            );
                        } else {
                            vars.push(
                                `${ops.typeToTuple(f.type.name, ctx)}(v'${f.name})`,
                            );
                        }
                        continue;
                    }
                }
                vars.push(`v'${f.name}`);
            }
            ctx.used(`__tact_tuple_create_${vars.length}`);
            ctx.append(
                `return __tact_tuple_create_${vars.length}(${vars.join(", ")});`,
            );
        });
    });

    ctx.fun(ops.typeToOptTuple(type.name, ctx), () => {
        ctx.signature(`tuple ${ops.typeToOptTuple(type.name, ctx)}(tuple v)`);
        ctx.flag("inline");
        ctx.context("type:" + type.name);
        ctx.body(() => {
            ctx.append(`if (null?(v)) { return null(); } `);
            ctx.append(
                `return ${ops.typeToTuple(type.name, ctx)}(${ops.typeNotNull(type.name, ctx)}(v)); `,
            );
        });
    });

    ctx.fun(ops.typeFromTuple(type.name, ctx), () => {
        ctx.signature(
            `(${type.fields.map((v) => resolveFuncType(v.type, ctx)).join(", ")}) ${ops.typeFromTuple(type.name, ctx)}(tuple v)`,
        );
        ctx.flag("inline");
        ctx.context("type:" + type.name);
        ctx.body(() => {
            // Resolve vars
            const vars: string[] = [];
            const out: string[] = [];
            for (const f of type.fields) {
                if (f.type.kind === "ref") {
                    const t = getType(ctx.ctx, f.type.name);
                    if (t.kind === "struct") {
                        vars.push(`tuple v'${f.name}`);
                        if (f.type.optional) {
                            out.push(
                                `${ops.typeFromOptTuple(f.type.name, ctx)}(v'${f.name})`,
                            );
                        } else {
                            out.push(
                                `${ops.typeFromTuple(f.type.name, ctx)}(v'${f.name})`,
                            );
                        }
                        continue;
                    } else if (t.kind === "primitive" && t.name === "Address") {
                        if (f.type.optional) {
                            vars.push(
                                `${resolveFuncType(f.type, ctx)} v'${f.name}`,
                            );
                            out.push(
                                `null?(v'${f.name}) ? null() : ${ctx.used(`__tact_verify_address`)}(v'${f.name})`,
                            );
                        } else {
                            vars.push(
                                `${resolveFuncType(f.type, ctx)} v'${f.name}`,
                            );
                            out.push(
                                `${ctx.used(`__tact_verify_address`)}(v'${f.name})`,
                            );
                        }
                        continue;
                    }
                }
                vars.push(`${resolveFuncType(f.type, ctx)} v'${f.name}`);
                out.push(`v'${f.name}`);
            }
            ctx.used(`__tact_tuple_destroy_${vars.length}`);
            ctx.append(
                `var (${vars.join(", ")}) = __tact_tuple_destroy_${vars.length}(v);`,
            );
            ctx.append(`return (${out.join(", ")});`);
        });
    });

    ctx.fun(ops.typeFromOptTuple(type.name, ctx), () => {
        ctx.signature(`tuple ${ops.typeFromOptTuple(type.name, ctx)}(tuple v)`);
        ctx.flag("inline");
        ctx.context("type:" + type.name);
        ctx.body(() => {
            ctx.append(`if (null?(v)) { return null(); } `);
            ctx.append(
                `return ${ops.typeAsOptional(type.name, ctx)}(${ops.typeFromTuple(type.name, ctx)}(v));`,
            );
        });
    });

    //
    // Convert to and from external representation
    //

    ctx.fun(ops.typeToExternal(type.name, ctx), () => {
        ctx.signature(
            `(${type.fields.map((v) => resolveFuncTupleType(v.type, ctx)).join(", ")}) ${ops.typeToExternal(type.name, ctx)}((${resolveFuncType(type, ctx)}) v)`,
        );
        ctx.flag("inline");
        ctx.context("type:" + type.name);
        ctx.body(() => {
            ctx.append(
                `var (${type.fields.map((v) => `v'${v.name}`).join(", ")}) = v; `,
            );
            const vars: string[] = [];
            for (const f of type.fields) {
                if (f.type.kind === "ref") {
                    const t = getType(ctx.ctx, f.type.name);
                    if (t.kind === "struct") {
                        if (f.type.optional) {
                            vars.push(
                                `${ops.typeToOptTuple(f.type.name, ctx)}(v'${f.name})`,
                            );
                        } else {
                            vars.push(
                                `${ops.typeToTuple(f.type.name, ctx)}(v'${f.name})`,
                            );
                        }
                        continue;
                    }
                }
                vars.push(`v'${f.name}`);
            }
            ctx.append(`return (${vars.join(", ")});`);
        });
    });

    ctx.fun(ops.typeToOptExternal(type.name, ctx), () => {
        ctx.signature(
            `tuple ${ops.typeToOptExternal(type.name, ctx)}(tuple v)`,
        );
        ctx.flag("inline");
        ctx.context("type:" + type.name);
        ctx.body(() => {
            ctx.append(
                `var loaded = ${ops.typeToOptTuple(type.name, ctx)}(v);`,
            );
            ctx.append(`if (null?(loaded)) {`);
            ctx.inIndent(() => {
                ctx.append(`return null();`);
            });
            ctx.append(`} else {`);
            ctx.inIndent(() => {
                ctx.append(`return (loaded);`);
            });
            ctx.append(`}`);
        });
    });
}
