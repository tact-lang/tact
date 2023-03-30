import { WriterContext } from "../Writer";


function used(name: string, ctx: WriterContext) {
    let c = ctx.currentContext();
    if (c) {
        ctx.used(name);
    }
    return name;
}

export const ops = {

    // Type operations
    writer: (type: string, ctx: WriterContext) => used(`$${type}$_store`, ctx),
    writerCell: (type: string, ctx: WriterContext) => used(`$${type}$_store_cell`, ctx),
    writerCellOpt: (type: string, ctx: WriterContext) => used(`$${type}$_store_opt`, ctx),
    reader: (type: string, ctx: WriterContext) => used(`$${type}$_load`, ctx),
    readerOpt: (type: string, ctx: WriterContext) => used(`$${type}$_load_opt`, ctx),
    typeField: (type: string, name: string, ctx: WriterContext) => used(`$${type}$_get_${name}`, ctx),
    typeTensorCast: (type: string, ctx: WriterContext) => used(`$${type}$_tensor_cast`, ctx),
    typeNotNull: (type: string, ctx: WriterContext) => used(`$${type}$_not_null`, ctx),
    typeAsOptional: (type: string, ctx: WriterContext) => used(`$${type}$_as_optional`, ctx),
    typeToTuple: (type: string, ctx: WriterContext) => used(`$${type}$_to_tuple`, ctx),
    typeToOptTuple: (type: string, ctx: WriterContext) => used(`$${type}$_to_opt_tuple`, ctx),
    typeFromTuple: (type: string, ctx: WriterContext) => used(`$${type}$_from_tuple`, ctx),
    typeFromOptTuple: (type: string, ctx: WriterContext) => used(`$${type}$_from_opt_tuple`, ctx),
    typeToExternal: (type: string, ctx: WriterContext) => used(`$${type}$_to_external`, ctx),
    typeToOptExternal: (type: string, ctx: WriterContext) => used(`$${type}$_to_opt_external`, ctx),
    typeContsturctor: (type: string, fields: string[], ctx: WriterContext) => used(`$${type}$_constructor_${fields.join('_')}`, ctx),

    // Contract operations
    contractInit: (type: string, ctx: WriterContext) => used(`$${type}$_contract_init`, ctx),
    contractInitChild: (type: string, ctx: WriterContext) => used(`$${type}$_init_child`, ctx),
    contractLoad: (type: string, ctx: WriterContext) => used(`$${type}$_contract_load`, ctx),
    contractStore: (type: string, ctx: WriterContext) => used(`$${type}$_contract_store`, ctx),
    contractRouter: (type: string) => `$${type}$_contract_router`, // Not rendered as dependency

    // Router operations
    receiveEmpty: (type: string) => `%$${type}$_receive_empty`,
    receiveType: (type: string, msg: string) => `$${type}$_receive_binary_${msg}`,
    receiveAnyText: (type: string) => `$${type}$_receive_any_text`,
    receiveText: (type: string, hash: string) => `$${type}$_receive_text_${hash}`,
    receiveAny: (type: string) => `$${type}$_receive_any`,
    receiveBounce: (type: string, msg: string) => `$${type}$_receive_bounce_${msg}`,

    // Functions
    extension: (type: string, name: string) => `$${type}$_fun_${name}`,
    global: (name: string) => `$global_${name}`,

    // Constants
    str: (id: string, ctx: WriterContext) => used(`__gen_str_${id}`, ctx)
};