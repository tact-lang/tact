import { contractErrors } from "../../abi/errors";
import { TypeDescription } from "../../types/types";
import { WriterContext } from "../Writer";
import { resolveFuncType } from "./resolveFuncType";

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
        });;
    }

    // Unpack
    ctx.fun(`__gen_${type.name}_unpack`, () => {
        ctx.append(`(${resolveFuncType(type, ctx)}) __gen_${type.name}_unpack(${resolveFuncType(type, ctx)} v) asm "NOP";`);
    });;

    // Not null
    ctx.fun(`__gen_${type.name}_not_null`, () => {
        ctx.append(`(${resolveFuncType(type, ctx)}) __gen_${type.name}_not_null(tuple v) {`);
        ctx.inIndent(() => {
            ctx.append(`throw_if(${contractErrors.null.id}, null?(v));`)
            ctx.used(`__tact_tuple_destroy_${type.fields.length}`);
            ctx.append(`return __tact_tuple_destroy_${type.fields.length}(v);`);
        });
        ctx.append(`}`);
    });;

    ctx.fun(`__gen_${type.name}_as_optional`, () => {
        ctx.append(`tuple __gen_${type.name}_as_optional((${resolveFuncType(type, ctx)}) v) {`);
        ctx.inIndent(() => {
            ctx.used(`__tact_tuple_create_${type.fields.length}`);
            ctx.append(`return __tact_tuple_create_${type.fields.length}(v);`);
        });
        ctx.append(`}`);
    });;
}