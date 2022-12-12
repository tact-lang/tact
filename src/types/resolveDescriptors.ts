import { ASTField, ASTFunction, ASTInitFunction, ASTNativeFunction, ASTNode, ASTTypeRef, throwError, traverse } from "../grammar/ast";
import { CompilerContext, createContextStore } from "../context";
import { FieldDescription, FunctionArgument, FunctionDescription, InitDescription, printTypeRef, ReceiverSelector, TypeDescription, TypeRef, typeRefEquals } from "./types";
import { getRawAST } from "../grammar/store";
import { cloneNode } from "../grammar/clone";
import { crc16 } from "../utils/crc16";

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

        // Resolve unique typeid from crc16
        let uid = crc16(a.name);
        while (Object.values(types).find((v) => v.uid === uid)) {
            uid = (uid + 1) % 65536;
        }

        if (a.kind === 'primitive') {
            types[a.name] = {
                kind: 'primitive',
                name: a.name,
                uid,
                fields: [],
                traits: [],
                functions: {},
                receivers: [],
                dependsOn: [],
                init: null,
                ast: a
            };
        } else if (a.kind === 'def_contract') {
            types[a.name] = {
                kind: 'contract',
                name: a.name,
                uid,
                fields: [],
                traits: [],
                functions: {},
                receivers: [],
                dependsOn: [],
                init: null,
                ast: a
            };
        } else if (a.kind === 'def_struct') {
            types[a.name] = {
                kind: 'struct',
                name: a.name,
                uid,
                fields: [],
                traits: [],
                functions: {},
                receivers: [],
                dependsOn: [],
                init: null,
                ast: a
            };
        } else if (a.kind === 'def_trait') {
            types[a.name] = {
                kind: 'trait',
                name: a.name,
                uid,
                fields: [],
                traits: [],
                functions: {},
                receivers: [],
                dependsOn: [],
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
            for (const f of a.fields) {
                if (types[a.name].fields.find((v) => v.name === f.name)) {
                    throwError(`Field ${f.name} already exists`, f.ref);
                }
                types[a.name].fields.push(buildFieldDescription(f, types[a.name].fields.length));
            }
        }

        // Trait
        if (a.kind === 'def_trait') {
            for (const f of a.declarations) {
                if (f.kind !== 'def_field') {
                    continue;
                }
                if (types[a.name].fields.find((v) => v.name === f.name)) {
                    throwError(`Field ${f.name} already exists`, f.ref);
                }
                if (f.as) {
                    throwError(`Trait field cannot have serialization specifier`, f.ref);
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

        if (a.kind === 'def_contract' || a.kind === 'def_trait') {
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

                    if (d.selector.kind === 'simple') {
                        const arg = d.selector.arg;

                        // Check argument type
                        if (arg.type.kind !== 'type_ref_simple') {
                            throwError('Receive function can only accept message', d.ref);
                        }
                        if (arg.type.optional) {
                            throwError('Receive function cannot have optional argument', d.ref);
                        }

                        // Check resolved argument type
                        let t = types[arg.type.name];
                        if (!t) {
                            throwError('Type ' + arg.type.name + ' not found', d.ref);
                        }

                        // Raw receiver
                        if (t.kind === 'primitive' && t.name === 'Slice') {

                            // Check for existing receiver
                            if (s.receivers.find((v) => v.selector.kind === 'internal-fallback')) {
                                throwError(`Fallback receive function already exists`, d.ref);
                            }

                            // Persist receiver
                            s.receivers.push({
                                selector: {
                                    kind: 'internal-fallback',
                                    name: arg.type.name
                                },
                                ast: d
                            });
                        } else {

                            // Check type
                            if (t.kind !== 'struct') {
                                throwError('Receive function can only accept message', d.ref);
                            }
                            if (t.ast.kind !== 'def_struct') {
                                throwError('Receive function can only accept message', d.ref);
                            }
                            if (!t.ast.message) {
                                throwError('Receive function can only accept message', d.ref);
                            }

                            // Check for duplicate
                            const n = arg.type.name;
                            if (s.receivers.find((v) => v.selector.kind === 'internal-binary' && v.selector.name === n)) {
                                throwError(`Receive function for ${arg.type.name} already exists`, d.ref);
                            }

                            // Persist receiver
                            s.receivers.push({
                                selector: {
                                    kind: 'internal-binary', name: arg.name,
                                    type: arg.type.name,
                                },
                                ast: d
                            });
                        }
                    } else if (d.selector.kind === 'comment') {
                        if (Buffer.from(d.selector.comment.value).length > 120 || d.selector.comment.value === '') {
                            throwError('Comment length should be positive and less or equals to 120 bytes', d.ref);
                        }
                        let c = d.selector.comment.value;
                        if (s.receivers.find((v) => v.selector.kind === 'internal-comment' && v.selector.comment === c)) {
                            throwError(`Receive function for "${c}" already exists`, d.ref);
                        }
                        s.receivers.push({
                            selector: { kind: 'internal-comment', comment: c },
                            ast: d
                        });
                    } else if (d.selector.kind === 'fallback') {
                        // Handle empty
                        if (s.receivers.find((v) => v.selector.kind === 'internal-empty')) {
                            throwError('Empty receive function already exists', d.ref);
                        }
                        s.receivers.push({
                            selector: { kind: 'internal-empty' },
                            ast: d
                        });
                    } else if (d.selector.kind === 'bounce') {
                        const arg = d.selector.arg;

                        if (arg.type.kind !== 'type_ref_simple') {
                            throwError('Receive function can only accept message', d.ref);
                        }
                        if (arg.type.optional) {
                            throwError('Receive function cannot have optional argument', d.ref);
                        }

                        // Check resolved argument type
                        let t = types[arg.type.name];
                        if (t.kind !== 'primitive' || t.name !== 'Slice') {
                            throwError('Bounce receive function can only accept message', d.ref);
                        }

                        if (s.receivers.find((v) => v.selector.kind === 'internal-bounce')) {
                            throwError('Bounce receive function already exists', d.ref);
                        }
                        s.receivers.push({
                            selector: { kind: 'internal-bounce', name: arg.name },
                            ast: d
                        });
                    }
                }
            }
        }
    }

    //
    // Flatten and resolve traits
    //

    for (let k in types) {
        let t = types[k];
        if (t.ast.kind === 'def_trait' || t.ast.kind === 'def_contract') {

            // Flatten traits
            let traits: TypeDescription[] = [];
            let visited = new Set<string>();
            visited.add(t.name);
            function visit(name: string) {
                if (visited.has(name)) {
                    return;
                }
                let tt = types[name];
                visited.add(name);
                traits.push(tt);
                if (tt.ast.kind === 'def_trait') {
                    for (let s of tt.ast.traits) {
                        visit(s.value);
                    }
                    for (let f of tt.traits) {
                        visit(f.name);
                    }
                } else {
                    throw Error('Unexpected type: ' + tt.ast.kind);
                }
            }
            for (let s of t.ast.traits) {
                visit(s.value);
            }

            // Assign traits
            t.traits = traits;
        }
    }

    //
    // Verify trait fields
    //

    for (let k in types) {
        let t = types[k];

        for (let tr of t.traits) {

            // Check that trait is valid
            if (!types[tr.name]) {
                throwError('Trait ' + tr.name + ' not found', t.ast.ref);
            }
            if (types[tr.name].kind !== 'trait') {
                throwError('Type ' + tr.name + ' is not a trait', t.ast.ref);
            }

            // Check that trait has all required fields
            let ttr = types[tr.name];
            for (let f of ttr.fields) {

                // Check if field exists
                let ex = t.fields.find((v) => v.name === f.name);
                if (!ex) {
                    throwError(`Trait ${tr.name} requires field ${f.name}`, t.ast.ref);
                }

                // Check type
                if (!typeRefEquals(f.type, ex.type)) {
                    throwError(`Trait ${tr.name} requires field ${f.name} of type ${printTypeRef(f.type)}`, t.ast.ref);
                }
            }
        }
    }

    //
    // Copy Trait functions
    //

    function copyTraits(t: TypeDescription) {
        for (let tr of t.traits) {

            // Copy functions
            for (let f of Object.values(tr.functions)) {
                if (t.functions[f.name]) {
                    throwError(`Function ${f.name} already exist in ${t.name}`, t.ast.ref);
                }
                t.functions[f.name] = {
                    ...f,
                    self: t.name,
                    ast: cloneNode(f.ast)
                };
            }

            // Copy receivers
            for (let f of tr.receivers) {
                function sameReceiver(a: ReceiverSelector, b: ReceiverSelector) {
                    if (a.kind === 'internal-comment' && b.kind === 'internal-comment') {
                        return a.comment === b.comment;
                    }
                    if (a.kind === 'internal-binary' && b.kind === 'internal-binary') {
                        return a.type === b.type;
                    }
                    if (a.kind === 'internal-bounce' && b.kind === 'internal-bounce') {
                        return true;
                    }
                    if (a.kind === 'internal-empty' && b.kind === 'internal-empty') {
                        return true;
                    }
                    if (a.kind === 'internal-fallback' && b.kind === 'internal-fallback') {
                        return true;
                    }
                    return false;
                }
                if (t.receivers.find((v) => sameReceiver(v.selector, f.selector))) {
                    throwError(`Receive function for "${f.selector}" already exists`, t.ast.ref);
                }
                t.receivers.push({
                    selector: f.selector,
                    ast: cloneNode(f.ast)
                });
            }
        }
    }

    // Copy to non-traits to avoid duplicates
    for (let k in types) {
        let t = types[k];
        if (t.kind === 'trait') {
            continue;
        }
        copyTraits(t);
    }

    // Copy to traits to traits
    for (let k in types) {
        let t = types[k];
        if (t.kind !== 'trait') {
            continue;
        }
        copyTraits(t);
    }

    //
    // Register dependencies
    //

    for (let k in types) {
        let t = types[k];
        let dependsOn = new Set<string>();
        let handler = (src: ASTNode) => {
            if (src.kind === 'init_of') {
                dependsOn.add(src.name);
            }
        }

        // Traverse functions
        for (let f of Object.values(t.functions)) {
            traverse(f.ast, handler);
        }
        for (let f of t.receivers) {
            traverse(f.ast, handler);
        }

        // Add dependencies
        for (let s of dependsOn) {
            if (!types[s]) {
                throwError(`Type ${s} not found`, t.ast.ref);
            }
            t.dependsOn.push(types[s]);
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