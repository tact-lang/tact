import { ASTField, ASTFunction, ASTInitFunction, ASTNativeFunction, ASTTypeRef, throwError } from "../grammar/ast";
import { CompilerContext, createContextStore } from "../context";
import { FieldDescription, FunctionArgument, FunctionDescription, InitDescription, TypeDescription, TypeRef } from "./types";
import { getRawAST } from "../grammar/store";

let store = createContextStore<TypeDescription>();
let staticFunctionsStore = createContextStore<FunctionDescription>();

export function resolveTypeRef(ctx: CompilerContext, src: ASTTypeRef): TypeRef {
    if (src.kind === 'type_ref_simple') {
        let n = getType(ctx, src.name).name; // TODO: Check
        return {
            kind: 'ref',
            name: n,
            optional: src.optional
        };
    }
    if (src.kind === 'type_ref_map') {
        let k = getType(ctx, src.key).name;
        let v = getType(ctx, src.value).name;
        return {
            kind: 'map',
            key: k,
            value: v
        };
    }
    throw Error('Invalid type ref');
}

function buildTypeRef(src: ASTTypeRef, types: { [key: string]: TypeDescription }): TypeRef {
    if (src.kind === 'type_ref_simple') {
        if (!types[src.name]) {
            throwError('Type ' + src.name + ' not found', src.ref);
        }
        return {
            kind: 'ref',
            name: src.name,
            optional: src.optional
        };
    }
    if (src.kind === 'type_ref_map') {
        if (!types[src.key]) {
            throwError('Type ' + src.key + ' not found', src.ref);
        }
        if (!types[src.value]) {
            throwError('Type ' + src.value + ' not found', src.ref);
        }
        return {
            kind: 'map',
            key: src.key,
            value: src.value
        };
    }

    throw Error('Unknown type ref');
}

export function resolveDescriptors(ctx: CompilerContext) {
    let types: { [key: string]: TypeDescription } = {};
    let staticFunctions: { [key: string]: FunctionDescription } = {};
    let ast = getRawAST(ctx);

    //
    // Register types
    //

    for (let a of ast.types) {
        if (types[a.name]) {
            throwError(`Type ${a.name} already exists`, a.ref);
        }
        if (a.kind === 'primitive') {
            types[a.name] = {
                kind: 'primitive',
                name: a.name,
                fields: [],
                functions: {},
                receivers: {},
                init: null,
                ast: a
            };
        } else if (a.kind === 'def_contract') {
            types[a.name] = {
                kind: 'contract',
                name: a.name,
                fields: [],
                functions: {},
                receivers: {},
                init: null,
                ast: a
            };
        } else if (a.kind === 'def_struct') {
            types[a.name] = {
                kind: 'struct',
                name: a.name,
                fields: [],
                functions: {},
                receivers: {},
                init: null,
                ast: a
            };
        }
    }

    //
    // Resolve fields
    //

    function buildFieldDescription(src: ASTField, index: number): FieldDescription {
        return { name: src.name, type: buildTypeRef(src.type, types), index, as: src.as, default: src.init, ref: src.ref };
    }
    for (let a of ast.types) {

        // Contract
        if (a.kind === 'def_contract') {
            for (const f of a.declarations) {
                if (f.kind !== 'def_field') {
                    continue;
                }
                if (types[a.name].fields.find((v) => v.name === f.name)) {
                    throwError(`Field ${f.name} already exists`, f.ref);
                }
                types[a.name].fields.push(buildFieldDescription(f, types[a.name].fields.length));
            }
        }

        // Struct
        if (a.kind === 'def_struct') {
            for (let f of a.fields) {
                if (types[a.name].fields.find((v) => v.name === f.name)) {
                    throwError(`Field ${f.name} already exists`, f.ref);
                }
                types[a.name].fields.push(buildFieldDescription(f, types[a.name].fields.length));
            }
        }
    }

    function resolveFunctionDescriptor(sself: string | null, a: ASTFunction | ASTNativeFunction): FunctionDescription {

        let self = sself;

        // Resolve return
        let returns: TypeRef = { kind: 'void' };
        if (a.return) {
            returns = buildTypeRef(a.return, types);
        }

        // Resolve args
        let args: FunctionArgument[] = [];
        for (let r of a.args) {
            args.push({
                name: r.name,
                type: buildTypeRef(r.type, types),
                as: null,
                ref: r.ref
            });
        }

        // Resolve flags
        let isPublic = a.attributes.find(a => a.type === 'public');
        let isGetter = a.attributes.find(a => a.type === 'get');
        let isMutating = a.attributes.find(a => a.type === 'mutates');
        let isExtends = a.attributes.find(a => a.type === 'extends');

        // Check for native
        if (a.kind === 'def_native_function') {
            if (isPublic) {
                throwError('Native functions cannot be public', isPublic.ref);
            }
            if (isGetter) {
                throwError('Native functions cannot be getters', isGetter.ref);
            }
            if (self) {
                throwError('Native functions cannot be delated within a contract', a.ref);
            }
        }

        // Check for common
        if (a.kind === 'def_function') {
            if (isPublic && !self) {
                throwError('Public functions must be defined within a contract', isPublic.ref);
            }
            if (isGetter && !self) {
                throwError('Getters must be defined within a contract', isGetter.ref);
            }
        }

        // Common checks
        if (isPublic && isGetter) {
            throwError('Functions cannot be both public and getters', isPublic.ref);
        }

        // Validate mutating
        if (isExtends) {

            // Validate arguments
            if (self) {
                throwError('Extend functions cannot be defined within a contract', isExtends.ref);
            }
            if (args.length === 0) {
                throwError('Extend functions must have at least one argument', isExtends.ref);
            }
            if (args[0].name !== 'self') {
                throwError('Extend function must have first argument named "self"', args[0].ref);
            }
            if (args[0].type.kind !== 'ref') {
                throwError('Extend functions must have a reference type as the first argument', args[0].ref);
            }
            if (args[0].type.optional) {
                throwError('Extend functions must have a non-optional type as the first argument', args[0].ref);
            }
            if (!types[args[0].type.name]) {
                throwError('Type ' + args[0].type.name + ' not found', args[0].ref);
            }

            // Update self and remove first argument
            self = args[0].type.name;
            args.shift();
        }

        // Check for mutating and extends
        if (isMutating && !isExtends) {
            throwError('Mutating functions must be extend functions', isMutating.ref);
        }

        // Check argumen names
        let exNames = new Set<string>();
        for (let arg of args) {
            if (arg.name === 'self') {
                throwError('Argument name "self" is reserved', arg.ref);
            }
            if (exNames.has(arg.name)) {
                throwError('Argument name "' + arg.name + '" is already used', arg.ref);
            }
            exNames.add(arg.name);
        }

        // Register function
        return {
            name: a.name,
            self: self,
            args,
            returns,
            ast: a,
            isMutating: !!isMutating || (!!sself && !isGetter), // Mark all contract functions as mutating
            isPublic: !!isPublic,
            isGetter: !!isGetter
        };
    }

    function resolveInitFunction(ast: ASTInitFunction): InitDescription {
        let args: FunctionArgument[] = [];
        for (let r of ast.args) {
            args.push({
                name: r.name,
                type: buildTypeRef(r.type, types),
                as: null,
                ref: r.ref
            });
        }
        return {
            args,
            ast
        };
    }

    //
    // Resolve static functions
    //

    for (let a of ast.functions) {
        let r = resolveFunctionDescriptor(null, a);
        if (r.self) {
            if (types[r.self].functions[r.name]) {
                throwError(`Function ${r.name} already exists in type ${r.self}`, r.ast.ref);
            }
            types[r.self].functions[r.name] = r;
        } else {
            if (staticFunctions[r.name]) {
                throwError(`Static function ${r.name} already exists`, r.ast.ref);
            }
            staticFunctions[r.name] = r;
        }
    }

    //
    // Resolve contract functions
    //

    for (const a of ast.types) {

        if (a.kind === 'def_contract') {
            const s = types[a.name];
            for (const d of a.declarations) {
                if (d.kind === 'def_function') {
                    let f = resolveFunctionDescriptor(s.name, d);
                    if (f.self !== s.name) {
                        throw Error('Function self must be ' + s.name); // Impossible
                    }
                    if (s.functions[f.name]) {
                        throwError(`Static function ${f.name} already exists in type ${s.name}`, s.ast.ref);
                    }
                    s.functions[f.name] = f;
                }
                if (d.kind === 'def_init_function') {
                    if (s.init) {
                        throwError('Init function already exists', d.ref);
                    }
                    s.init = resolveInitFunction(d);
                }
                if (d.kind === 'def_receive') {

                    // Check argument type
                    if (d.arg.type.kind !== 'type_ref_simple') {
                        throwError('Receive function can only accept message', d.arg.ref);
                    }
                    if (d.arg.type.optional) {
                        throwError('Receive function cannot have optional argument', d.arg.ref);
                    }

                    // Check resolved argument type
                    let t = types[d.arg.type.name];
                    if (t.kind !== 'struct') {
                        throwError('Receive function can only accept message', d.arg.ref);
                    }
                    if (t.ast.kind !== 'def_struct') {
                        throwError('Receive function can only accept message', d.arg.ref);
                    }
                    if (!t.ast.message) {
                        throwError('Receive function can only accept message', d.arg.ref);
                    }

                    // Check for duplicate
                    if (s.receivers[d.arg.type.name]) {
                        throwError(`Receive function for ${d.arg.type.name} already exists`, d.arg.ref);
                    }

                    // Persist receiver
                    s.receivers[d.arg.type.name] = {
                        name: d.arg.name,
                        type: d.arg.type.name,
                        ast: d
                    };
                }
            }
        }
    }

    //
    // Register types and functions in context
    //

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

export function hasStaticFunction(ctx: CompilerContext, name: string) {
    return !!staticFunctionsStore.get(ctx, name);
}

export function getAllStaticFunctions(ctx: CompilerContext) {
    return staticFunctionsStore.all(ctx);
}