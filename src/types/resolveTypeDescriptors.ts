import { ASTField } from "../ast/ast";
import { CompilerContext, createContextStore } from "../ast/context";
import { FieldDescription, TypeDescription } from "./TypeDescription";

let store = createContextStore<TypeDescription>();

export function resolveTypeDescriptors(ctx: CompilerContext) {
    let types: { [key: string]: TypeDescription } = {};

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
                fields: {}
            };
        } else if (a.kind === 'def_contract') {
            types[a.name] = {
                kind: 'contract',
                name: a.name,
                fields: {}
            };
        } else if (a.kind === 'def_struct') {
            types[a.name] = {
                kind: 'struct',
                name: a.name,
                fields: {}
            };
        }
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

    // Register types in context
    for (let t in types) {
        ctx = store.set(ctx, t, types[t]);
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