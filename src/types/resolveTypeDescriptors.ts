import { ASTField, ASTFunction, ASTInitFunction, ASTNativeFunction, ASTTypeRef, throwError } from "../ast/ast";
import { CompilerContext, createContextStore } from "../ast/context";
import { FieldDescription, FunctionArgument, FunctionDescription, InitDescription, TypeDescription, TypeRef } from "./types";

let store = createContextStore<TypeDescription>();
let staticFunctionsStore = createContextStore<FunctionDescription>();

export function resolveTypeDescriptors(ctx: CompilerContext) {
    let types: { [key: string]: TypeDescription } = {};
    let staticFunctions: { [key: string]: FunctionDescription } = {};

    // Register types
    for (let t in ctx.astTypes) {
        let a = ctx.astTypes[t];
        if (types[a.name]) {
            throwError(`Type ${a.name} already exists`, a.ref);
        }
        if (a.kind === 'primitive') {
            types[a.name] = {
                kind: 'primitive',
                name: a.name,
                fields: [],
                functions: [],
                init: null
            };
        } else if (a.kind === 'def_contract') {
            types[a.name] = {
                kind: 'contract',
                name: a.name,
                fields: [],
                functions: [],
                init: null
            };
        } else if (a.kind === 'def_struct') {
            types[a.name] = {
                kind: 'struct',
                name: a.name,
                fields: [],
                functions: [],
                init: null
            };
        }
    }

    function resolveTypeRef(src: ASTTypeRef): TypeRef {
        if (!types[src.name]) {
            throwError('Type ' + src.name + ' not found', src.ref);
        }
        if (src.optional) {
            return {
                kind: 'optional',
                inner: {
                    kind: 'direct',
                    name: src.name
                }
            };
        } else {
            return {
                kind: 'direct',
                name: src.name
            }
        }
    }

    function resolveFunctionDescriptor(self: TypeDescription | null, a: ASTFunction | ASTNativeFunction): FunctionDescription {

        // Resolve return
        let returns: TypeRef | null = null;
        if (a.return) {
            returns = resolveTypeRef(a.return);
        }

        // Resolve args
        let args: FunctionArgument[] = [];
        for (let r of a.args) {
            args.push({
                name: r.name,
                type: resolveTypeRef(r.type),
                as: null
            });
        }

        // Register function
        return {
            name: a.name,
            self,
            args,
            returns,
            ast: a,
            isPublic: a.kind === 'def_function' ? a.attribute.some(a => a.type === 'public') : false,
            isGetter: a.kind === 'def_function' ? a.attribute.some(a => a.type === 'get') : false,
        };
    }

    function resolveInitFunction(a: ASTInitFunction): InitDescription {
        let args: FunctionArgument[] = [];
        for (let r of a.args) {
            args.push({
                name: r.name,
                type: resolveTypeRef(r.type),
                as: null
            });
        }
        return {
            args,
            ast: a
        }
    }

    // Resolve static functions
    for (let f in ctx.astFunctionStatic) {
        let a = ctx.astFunctionStatic[f];
        if (staticFunctions[a.name]) {
            throw Error('Function ' + a.name + ' already exists');
        }

        // Register function
        staticFunctions[a.name] = resolveFunctionDescriptor(null, a);
    }

    // Resolve fields
    function resolveField(src: ASTField, index: number): FieldDescription {
        return { name: src.name, type: resolveTypeRef(src.type), index, as: src.as };
    }
    for (let t in ctx.astTypes) {
        let a = ctx.astTypes[t];

        // Contract
        if (a.kind === 'def_contract') {
            for (const f of a.declarations) {
                if (f.kind !== 'def_field') {
                    continue;
                }
                if (types[a.name].fields.find((v) => v.name === f.name)) {
                    throw Error('Field ' + f.name + ' already exists');
                }
                types[a.name].fields.push(resolveField(f, types[a.name].fields.length));
            }
        }

        // Struct
        if (a.kind === 'def_struct') {
            for (let f of a.fields) {
                if (types[a.name].fields.find((v) => v.name === f.name)) {
                    throw Error('Field ' + f.name + ' already exists');
                }
                types[a.name].fields.push(resolveField(f, types[a.name].fields.length));
            }
        }
    }

    // Resolve contract functions
    for (let t in ctx.astTypes) {
        let a = ctx.astTypes[t];
        if (a.kind === 'def_contract') {
            let s = types[a.name];
            for (let d of a.declarations) {
                if (d.kind === 'def_function') {
                    s.functions.push(resolveFunctionDescriptor(s, d));
                }
                if (d.kind === 'def_init_function') {
                    if (s.init) {
                        throw Error('Init function already exists');
                    }
                    s.init = resolveInitFunction(d);
                }
            }
        }
    }

    // Register types in context
    for (let t in types) {
        ctx = store.set(ctx, t, types[t]);
    }
    for (let t in staticFunctions) {
        ctx = staticFunctionsStore.set(ctx, t, staticFunctions[t]);
    }

    return ctx;
}

export function getType(ctx: CompilerContext, name: string): TypeDescription {
    let r = store.get(ctx, name);
    if (!r) {
        throw Error('Type ' + name + ' not found');
    }
    return r;
}

export function getAllTypes(ctx: CompilerContext) {
    return store.all(ctx);
}

export function getStaticFunction(ctx: CompilerContext, name: string): FunctionDescription {
    let r = staticFunctionsStore.get(ctx, name);
    if (!r) {
        throw Error('Static function ' + name + ' not found');
    }
    return r;
}

export function getAllStaticFunctions(ctx: CompilerContext) {
    return staticFunctionsStore.all(ctx);
}