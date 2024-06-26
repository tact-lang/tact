import { WriterContext } from "../Writer";

function used(name: string, ctx: WriterContext) {
    const c = ctx.currentContext();
    if (c) {
        ctx.used(name);
    }
    return name;
}

export const ops = {
    // Type operations
    writer: (type: string, ctx: WriterContext) => used(`$${type}$_store`, ctx),
    writerCell: (type: string, ctx: WriterContext) =>
        used(`$${type}$_store_cell`, ctx),
    writerCellOpt: (type: string, ctx: WriterContext) =>
        used(`$${type}$_store_opt`, ctx),
    reader: (type: string, ctx: WriterContext) => used(`$${type}$_load`, ctx),
    readerNonModifying: (type: string, ctx: WriterContext) =>
        used(`$${type}$_load_not_mut`, ctx),
    readerBounced: (type: string, ctx: WriterContext) =>
        used(`$${type}$_load_bounced`, ctx),
    readerOpt: (type: string, ctx: WriterContext) =>
        used(`$${type}$_load_opt`, ctx),
    typeField: (type: string, name: string, ctx: WriterContext) =>
        used(`$${type}$_get_${name}`, ctx),
    typeTensorCast: (type: string, ctx: WriterContext) =>
        used(`$${type}$_tensor_cast`, ctx),
    typeNotNull: (type: string, ctx: WriterContext) =>
        used(`$${type}$_not_null`, ctx),
    typeAsOptional: (type: string, ctx: WriterContext) =>
        used(`$${type}$_as_optional`, ctx),
    typeToTuple: (type: string, ctx: WriterContext) =>
        used(`$${type}$_to_tuple`, ctx),
    typeToOptTuple: (type: string, ctx: WriterContext) =>
        used(`$${type}$_to_opt_tuple`, ctx),
    typeFromTuple: (type: string, ctx: WriterContext) =>
        used(`$${type}$_from_tuple`, ctx),
    typeFromOptTuple: (type: string, ctx: WriterContext) =>
        used(`$${type}$_from_opt_tuple`, ctx),
    typeToExternal: (type: string, ctx: WriterContext) =>
        used(`$${type}$_to_external`, ctx),
    typeToOptExternal: (type: string, ctx: WriterContext) =>
        used(`$${type}$_to_opt_external`, ctx),
    typeConstructor: (type: string, fields: string[], ctx: WriterContext) =>
        used(`$${type}$_constructor_${fields.join("_")}`, ctx),

    // Contract operations
    contractInit: (type: string, ctx: WriterContext) =>
        used(`$${type}$_contract_init`, ctx),
    contractInitChild: (type: string, ctx: WriterContext) =>
        used(`$${type}$_init_child`, ctx),
    contractLoad: (type: string, ctx: WriterContext) =>
        used(`$${type}$_contract_load`, ctx),
    contractStore: (type: string, ctx: WriterContext) =>
        used(`$${type}$_contract_store`, ctx),
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
    str: (id: string, ctx: WriterContext) => used(`__gen_str_${id}`, ctx),
};
