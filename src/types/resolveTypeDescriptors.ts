import { ASTField, ASTFunction } from "../ast/ast";
import { CompilerContext, createContextStore } from "../ast/context";
import { FieldDescription, FunctionArgument, FunctionDescription, TypeDescription } from "./TypeDescription";

let store = createContextStore<TypeDescription>();
let staticFunctionsStore = createContextStore<FunctionDescription>();

export function resolveTypeDescriptors(ctx: CompilerContext) {
    let types: { [key: string]: TypeDescription } = {};
    let staticFunctions: { [key: string]: FunctionDescription } = {};

    // Register types
    for (let t in ctx.astTypes) {
        let a = ctx.astTypes[t];
        if (types[a.name]) {
            throw Error('Type ' + a.name + ' already exists');
        }
        if (a.kind === 'primitive') {
            types[a.name] = {
                kind: 'primitive',
                name: a.name,
                fields: {},
                functions: {}
            };
        } else if (a.kind === 'def_contract') {
            types[a.name] = {
                kind: 'contract',
                name: a.name,
                fields: {},
                functions: {}
            };
        } else if (a.kind === 'def_struct') {
            types[a.name] = {
                kind: 'struct',
                name: a.name,
                fields: {},
                functions: {}
            };
        }
    }

    function getType(type: string) {
        let t = types[type];
        if (!t) {
            throw Error('Type ' + type + ' not found');
        }
        return t;
    }

    function resolveFunctionDescriptor(self: TypeDescription | null, a: ASTFunction) {
        // Resolve return
        let returns = a.return ? getType(a.return) : null;

        // Resolve args
        let args: FunctionArgument[] = [];
        for (let r of a.args) {
            args.push({
                name: r.name,
                type: getType(r.type)
            });
        }

        // Register function
        return {
            name: a.name,
            self,
            args,
            returns,
            ast: a
        };
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
    function resolveField(src: ASTField): FieldDescription {
        let t = types[src.type];
        if (!t) {
            throw Error('Type ' + src.type + ' not found');
        }
        return { name: src.name, type: t };
    }
    for (let t in ctx.astTypes) {
        let a = ctx.astTypes[t];

        // Contract
        if (a.kind === 'def_contract') {
            for (let f of a.declarations) {
                if (f.kind !== 'def_field') {
                    continue;
                }
                types[a.name].fields[f.name] = resolveField(f);
            }
        }

        // Struct
        if (a.kind === 'def_struct') {
            for (let f of a.fields) {
                types[a.name].fields[f.name] = resolveField(f);
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
                    s.functions[d.name] = resolveFunctionDescriptor(s, d);
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