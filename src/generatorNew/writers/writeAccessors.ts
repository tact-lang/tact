import { contractErrors } from "../../abi/errors";
import { maxTupleSize } from "../../bindings/typescript/writeStruct";
import { ItemOrigin } from "../../grammar/grammar";
import { getType } from "../../types/resolveDescriptors";
import { TypeDescription } from "../../types/types";
import { WriterContext } from "../Writer";
import { ops } from "./ops";
import { resolveFuncFlatPack } from "./resolveFuncFlatPack";
import { resolveFuncFlatTypes } from "./resolveFuncFlatTypes";
import { resolveFuncType } from "./resolveFuncType";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";

function chainVars(vars: string[]): string[] {
    // let's say we have vars = ['v1', 'v2, ..., 'v32']
    // we need to split it into chunks of size maxTupleSize - 1
    const chunks: string[][] = [];
    while (vars.length > 0) {
        chunks.push(vars.splice(0, maxTupleSize - 1));
    }
    // and now chain them into a string like this: [v1, v2, ..., v14, [v15, v16, ..., v28, [v29, v30, ..., v32]]
    while (chunks.length > 1) {
        const a = chunks.pop()!;
        chunks[chunks.length - 1]!.push(`[${a.join(", ")}]`);
    }
    return chunks[0]!;
}

export function writeAccessors(
    type: TypeDescription,
    origin: ItemOrigin,
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
        ctx.asm("", "NOP");
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
            if (flatPack.length <= maxTupleSize) {
                ctx.used(`__tact_tuple_destroy_${flatPack.length}`);
                ctx.append(
                    `var (${pairs.join(", ")}) = __tact_tuple_destroy_${flatPack.length}(v);`,
                );
            } else {
                flatPack.splice(0, maxTupleSize - 1);
                const pairsBatch = pairs.splice(0, maxTupleSize - 1);
                ctx.used(`__tact_tuple_destroy_${maxTupleSize}`);
                ctx.append(
                    `var (${pairsBatch.join(", ")}, next) = __tact_tuple_destroy_${maxTupleSize}(v);`,
                );
                while (flatPack.length >= maxTupleSize) {
                    flatPack.splice(0, maxTupleSize - 1);
                    const pairsBatch = pairs.splice(0, maxTupleSize - 1);
                    ctx.append(
                        `var (${pairsBatch.join(", ")}, next) = __tact_tuple_destroy_${maxTupleSize}(next);`,
                    );
                }
                ctx.used(`__tact_tuple_destroy_${flatPack.length}`);
                ctx.append(
                    `var (${pairs.join(", ")}) = __tact_tuple_destroy_${flatPack.length}(next);`,
                );
            }
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
            if (flatPack.length <= maxTupleSize) {
                ctx.used(`__tact_tuple_create_${flatPack.length}`);
                ctx.append(
                    `return __tact_tuple_create_${flatPack.length}(${flatPack.join(", ")});`,
                );
            } else {
                const longTupleFlatPack = chainVars(flatPack);
                ctx.used(`__tact_tuple_create_${longTupleFlatPack.length}`);
                ctx.append(
                    `return __tact_tuple_create_${longTupleFlatPack.length}(${longTupleFlatPack.join(", ")});`,
                );
            }
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
            if (vars.length <= maxTupleSize) {
                ctx.used(`__tact_tuple_create_${vars.length}`);
                ctx.append(
                    `return __tact_tuple_create_${vars.length}(${vars.join(", ")});`,
                );
            } else {
                const longTupleVars = chainVars(vars);
                ctx.used(`__tact_tuple_create_${longTupleVars.length}`);
                ctx.append(
                    `return __tact_tuple_create_${longTupleVars.length}(${longTupleVars.join(", ")});`,
                );
            }
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
                    } else if (
                        t.kind === "primitive_type_decl" &&
                        t.name === "Address"
                    ) {
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
            if (vars.length <= maxTupleSize) {
                ctx.used(`__tact_tuple_destroy_${vars.length}`);
                ctx.append(
                    `var (${vars.join(", ")}) = __tact_tuple_destroy_${vars.length}(v);`,
                );
            } else {
                const batch = vars.splice(0, maxTupleSize - 1);
                ctx.used(`__tact_tuple_destroy_${maxTupleSize}`);
                ctx.append(
                    `var (${batch.join(", ")}, next) = __tact_tuple_destroy_${maxTupleSize}(v);`,
                );
                while (vars.length >= maxTupleSize) {
                    const batch = vars.splice(0, maxTupleSize - 1);
                    ctx.used(`__tact_tuple_destroy_${maxTupleSize}`);
                    ctx.append(
                        `var (${batch.join(", ")}, next) = __tact_tuple_destroy_${maxTupleSize}(next);`,
                    );
                }
                ctx.used(`__tact_tuple_destroy_${vars.length}`);
                ctx.append(
                    `var (${batch.join(", ")}) = __tact_tuple_destroy_${vars.length}(next);`,
                );
            }
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
            `(${type.fields.map((f) => resolveFuncType(f.type, ctx)).join(", ")}) ${ops.typeToExternal(type.name, ctx)}((${resolveFuncType(type, ctx)}) v)`,
        );
        ctx.flag("inline");
        ctx.context("type:" + type.name);
        ctx.body(() => {
            ctx.append(
                `var (${type.fields.map((v) => `v'${v.name}`).join(", ")}) = v; `,
            );
            const vars: string[] = [];
            for (const f of type.fields) {
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
