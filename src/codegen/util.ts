import { getType } from "../types/resolveDescriptors";
import { CompilerContext } from "../context";
import { TypeRef } from "../types/types";
import { FuncAstExpression } from "../func/grammar";
import { id, call } from "../func/syntaxConstructors";
import { AstId, idText } from "../grammar/ast";

export const ops = {
    // Type operations
    writer: (type: string) => `$${type}$_store`,
    writerCell: (type: string) => `$${type}$_store_cell`,
    writerCellOpt: (type: string) => `$${type}$_store_opt`,
    reader: (type: string) => `$${type}$_load`,
    readerNonModifying: (type: string) => `$${type}$_load_not_mut`,
    readerBounced: (type: string) => `$${type}$_load_bounced`,
    readerOpt: (type: string) => `$${type}$_load_opt`,
    typeField: (type: string, name: string) => `$${type}$_get_${name}`,
    typeTensorCast: (type: string) => `$${type}$_tensor_cast`,
    typeNotNull: (type: string) => `$${type}$_not_null`,
    typeAsOptional: (type: string) => `$${type}$_as_optional`,
    typeToTuple: (type: string) => `$${type}$_to_tuple`,
    typeToOptTuple: (type: string) => `$${type}$_to_opt_tuple`,
    typeFromTuple: (type: string) => `$${type}$_from_tuple`,
    typeFromOptTuple: (type: string) => `$${type}$_from_opt_tuple`,
    typeToExternal: (type: string) => `$${type}$_to_external`,
    typeToOptExternal: (type: string) => `$${type}$_to_opt_external`,
    typeConstructor: (type: string, fields: string[]) =>
        `$${type}$_constructor_${fields.join("_")}`,

    // Contract operations
    contractInit: (type: string) => `$${type}$_contract_init`,
    contractInitChild: (type: string) => `$${type}$_init_child`,
    contractLoad: (type: string) => `$${type}$_contract_load`,
    contractStore: (type: string) => `$${type}$_contract_store`,
    contractRouter: (type: string, kind: "internal" | "external") =>
        `$${type}$_contract_router_${kind}`, // Not rendered as dependency

    // Router operations
    receiveEmpty: (type: string, kind: "internal" | "external") =>
        `%$${type}$_${kind}_empty`,
    receiveType: (type: string, kind: "internal" | "external", msg: string) =>
        `$${type}$_${kind}_binary_${msg}`,
    receiveAnyText: (type: string, kind: "internal" | "external") =>
        `$${type}$_${kind}_any_text`,
    receiveText: (type: string, kind: "internal" | "external", hash: string) =>
        `$${type}$_${kind}_text_${hash}`,
    receiveAny: (type: string, kind: "internal" | "external") =>
        `$${type}$_${kind}_any`,
    receiveTypeBounce: (type: string, msg: string) =>
        `$${type}$_receive_binary_bounce_${msg}`,
    receiveBounceAny: (type: string) => `$${type}$_receive_bounce`,

    // Functions
    extension: (type: string, name: string) => `$${type}$_fun_${name}`,
    global: (name: string) => `$global_${name}`,
    nonModifying: (name: string) => `${name}$not_mut`,

    // Constants
    str: (id: string) => `__gen_str_${id}`,
};

/**
 * Wraps the expression in `<typename>_as_optional()` if needed.
 */
export function cast(
    ctx: CompilerContext,
    from: TypeRef,
    to: TypeRef,
    expr: FuncAstExpression,
): FuncAstExpression {
    if (from.kind === "ref" && to.kind === "ref") {
        if (from.name !== to.name) {
            throw Error(`Impossible: ${from.name} != ${to.name}`);
        }
        if (!from.optional && to.optional) {
            const type = getType(ctx, from.name);
            if (type.kind === "struct") {
                return call(id(ops.typeAsOptional(type.name)), [expr]);
            }
        }
    }
    return expr;
}

export function funcIdOf(ident: AstId | string): string {
    return typeof ident === "string" ? `$${ident}` : `$${idText(ident)}`;
}
export function funcInitIdOf(ident: AstId | string): string {
    return typeof ident === "string"
        ? `${ident}$init`
        : idText(ident) + "$init";
}
