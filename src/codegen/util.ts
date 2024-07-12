import { getType } from "../types/resolveDescriptors";
import { CompilerContext } from "../context";
import { TypeRef } from "../types/types";
import { FuncAstExpr, FuncAstIdExpr } from "../func/syntax";
import { AstId, idText } from "../grammar/ast";

export namespace ops {
    export function extension(type: string, name: string): string {
        return `$${type}$_fun_${name}`;
    }
    export function global(name: string): string {
        return `$global_${name}`;
    }
    export function typeAsOptional(type: string) {
        return `$${type}$_as_optional`;
    }
    export function typeTensorCast(type: string) {
        return `$${type}$_tensor_cast`;
    }
    export function nonModifying(name: string) {
        return `${name}$not_mut`;
    }
}

/**
 * Wraps the expression in `<typename>_as_optional()` if needed.
 */
export function cast(
    ctx: CompilerContext,
    from: TypeRef,
    to: TypeRef,
    expr: FuncAstExpr,
): FuncAstExpr {
    if (from.kind === "ref" && to.kind === "ref") {
        if (from.name !== to.name) {
            throw Error(`Impossible: ${from.name} != ${to.name}`);
        }
        if (!from.optional && to.optional) {
            const type = getType(ctx, from.name);
            if (type.kind === "struct") {
                const fun = {
                    kind: "id_expr",
                    value: ops.typeAsOptional(type.name),
                } as FuncAstIdExpr;
                return { kind: "call_expr", fun, args: [expr] };
            }
        }
    }
    return expr;
}

export function funcIdOf(ident: AstId | string): string {
    return typeof ident === "string" ? `$${ident}` : `$${idText(ident)}`;
}
export function funcInitIdOf(ident: AstId | string): string {
    return typeof ident === "string" ? `$${ident}` : `$init`;
}
