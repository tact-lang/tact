import { ASTConstant, ASTField, ASTFunction, ASTInitFunction, ASTNativeFunction, ASTNode, ASTRef, ASTTypeRef, throwError, traverse } from "../grammar/ast";
import { CompilerContext, createContextStore } from "../context";
import { ConstantDescription, FieldDescription, FunctionArgument, FunctionDescription, InitArgument, InitDescription, printTypeRef, ReceiverSelector, TypeDescription, TypeOrigin, TypeRef, typeRefEquals } from "./types";
import { getRawAST } from "../grammar/store";
import { cloneNode } from "../grammar/clone";
import { crc16 } from "../utils/crc16";
import { resolveConstantValue } from "./resolveConstantValue";
import { resolveABIType } from "./resolveABITypeRef";
import { Address, Cell } from "@ton/core";
import { enabledExternals } from "../config/features";
import { isRuntimeType } from "./isRuntimeType";

const store = createContextStore<TypeDescription>();
const staticFunctionsStore = createContextStore<FunctionDescription>();
const staticConstantsStore = createContextStore<ConstantDescription>();

function verifyMapType(key: string, keyAs: string | null, value: string, valueAs: string | null, ref: ASTRef) {
    if (!keyAs && !valueAs) {
        return;
    }

    // keyAs
    if (keyAs) {
        if (key === 'Int') {
            if (![
                'int8',
                'int16',
                'int32',
                'int64',
                'int128',
                'int256',
                'int257',
                'uint8',
                'uint16',
                'uint32',
                'uint64',
                'uint128',
                'uint256',
            ].includes(keyAs)) {
                throwError('Invalid key type for map', ref);
            }
        } else {
            throwError('Invalid key type for map', ref);
        }
    }

    // valueAs
    if (valueAs) {
        if (value === 'Int') {
            if (![
                'int8',
                'int16',
                'int32',
                'int64',
                'int128',
                'int256',
                'int257',
                'uint8',
                'uint16',
                'uint32',
                'uint64',
                'uint128',
                'uint256',
                'coins'
            ].includes(valueAs)) {
                throwError('Invalid value type for map', ref);
            }
        } else {
            throwError('Invalid value type for map', ref);
        }
    }
}

export const toBounced = (type: string) => `${type}%%BOUNCED%%`;

export function resolveTypeRef(ctx: CompilerContext, src: ASTTypeRef): TypeRef {
    if (src.kind === 'type_ref_simple') {
        const t = getType(ctx, src.name);
        return {
            kind: 'ref',
            name: t.name,
            optional: src.optional
        };
    }
    if (src.kind === 'type_ref_map') {
        const k = getType(ctx, src.key).name;
        const v = getType(ctx, src.value).name;
        verifyMapType(k, src.keyAs, v, src.valueAs, src.ref);
        return {
            kind: 'map',
            key: k,
            keyAs: src.keyAs,
            value: v,
            valueAs: src.valueAs
        };
    }
    if (src.kind === 'type_ref_bounced') {
        const t = getType(ctx, src.name);
        return {
            kind: 'ref_bounced',
            name: t.name,
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
            keyAs: src.keyAs,
            value: src.value,
            valueAs: src.valueAs
        };
    }
    if (src.kind === 'type_ref_bounced') {
        return {
            kind: 'ref_bounced',
            name: src.name,
        };
    }

    throw Error('Unknown type ref');
}

function uidForName(name: string, types: { [key: string]: TypeDescription }) {
    // Resolve unique typeid from crc16
    let uid = crc16(name);
    while (Object.values(types).find((v) => v.uid === uid)) {
        uid = (uid + 1) % 65536;
    }
    return uid;
}

export function resolveDescriptors(ctx: CompilerContext) {
    const types: { [key: string]: TypeDescription } = {};
    const staticFunctions: { [key: string]: FunctionDescription } = {};
    const staticConstants: { [key: string]: ConstantDescription } = {};
    const ast = getRawAST(ctx);

    //
    // Register types
    //

    for (const a of ast.types) {
        if (types[a.name]) {
            throwError(`Type ${a.name} already exists`, a.ref);
        }

        const uid = uidForName(a.name, types);

        if (a.kind === 'primitive') {
            types[a.name] = {
                kind: 'primitive',
                origin: a.origin,
                name: a.name,
                uid,
                fields: [],
                traits: [],
                header: null,
                tlb: null,
                signature: null,
                functions: new Map(),
                receivers: [],
                dependsOn: [],
                init: null,
                ast: a,
                interfaces: [],
                constants: [],
                partialFieldCount: 0
            };
        } else if (a.kind === 'def_contract') {
            types[a.name] = {
                kind: 'contract',
                origin: a.origin,
                name: a.name,
                uid,
                header: null,
                tlb: null,
                fields: [],
                traits: [],
                signature: null,
                functions: new Map(),
                receivers: [],
                dependsOn: [],
                init: null,
                ast: a,
                interfaces: a.attributes.filter((v) => v.type === 'interface').map((v) => v.name.value),
                constants: [],
                partialFieldCount: 0
            };
        } else if (a.kind === 'def_struct') {
            types[a.name] = {
                kind: 'struct',
                origin: a.origin,
                name: a.name,
                uid,
                header: null,
                tlb: null,
                signature: null,
                fields: [],
                traits: [],
                functions: new Map(),
                receivers: [],
                dependsOn: [],
                init: null,
                ast: a,
                interfaces: [],
                constants: [],
                partialFieldCount: 0
            };
        } else if (a.kind === 'def_trait') {
            types[a.name] = {
                kind: 'trait',
                origin: a.origin,
                name: a.name,
                uid,
                header: null,
                tlb: null,
                signature: null,
                fields: [],
                traits: [],
                functions: new Map(),
                receivers: [],
                dependsOn: [],
                init: null,
                ast: a,
                interfaces: a.attributes.filter((v) => v.type === 'interface').map((v) => v.name.value),
                constants: [],
                partialFieldCount: 0
            };
        }
    }

    //
    // Resolve fields
    //

    function buildFieldDescription(src: ASTField, index: number): FieldDescription {
        const tr = buildTypeRef(src.type, types);

        // Check if field is runtime type
        if (isRuntimeType(tr)) {
            throwError(printTypeRef(tr) + ' is a runtime only type and can\'t be used as field', src.ref);
        }

        // Resolve default value
        let d: bigint | boolean | string | null | Address | Cell | undefined = undefined;
        if (src.init) {
            d = resolveConstantValue(tr, src.init, ctx);
        }

        // Resolve abi type
        const type = resolveABIType(src);

        return { name: src.name, type: tr, index, as: src.as, default: d, ref: src.ref, ast: src, abi: { name: src.name, type } };
    }

    function buildConstantDescription(src: ASTConstant): ConstantDescription {
        const tr = buildTypeRef(src.type, types);
        const d = resolveConstantValue(tr, src.value, ctx);
        return { name: src.name, type: tr, value: d, ref: src.ref, ast: src };
    }

    for (const a of ast.types) {

        // Contract
        if (a.kind === 'def_contract') {
            for (const f of a.declarations) {
                if (f.kind === 'def_field') {
                    if (types[a.name].fields.find((v) => v.name === f.name)) {
                        throwError(`Field ${f.name} already exists`, f.ref);
                    }
                    if (types[a.name].constants.find((v) => v.name === f.name)) {
                        throwError(`Constant ${f.name} already exists`, f.ref);
                    }
                    types[a.name].fields.push(buildFieldDescription(f, types[a.name].fields.length));
                } else if (f.kind === 'def_constant') {
                    if (types[a.name].fields.find((v) => v.name === f.name)) {
                        throwError(`Field ${f.name} already exists`, f.ref);
                    }
                    if (types[a.name].constants.find((v) => v.name === f.name)) {
                        throwError(`Constant ${f.name} already exists`, f.ref);
                    }
                    if (f.attributes.find((v) => v.type !== 'overrides')) {
                        throwError(`Constant can be only overridden`, f.ref);
                    }
                    types[a.name].constants.push(buildConstantDescription(f));
                }
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
            if (a.fields.length === 0 && !a.message) {
                throwError(`Struct ${a.name} must have at least one field`, a.ref);
            }
        }

        // Trait
        if (a.kind === 'def_trait') {
            for (const f of a.declarations) {
                if (f.kind === 'def_field') {
                    if (types[a.name].fields.find((v) => v.name === f.name)) {
                        throwError(`Field ${f.name} already exists`, f.ref);
                    }
                    if (f.as) {
                        throwError(`Trait field cannot have serialization specifier`, f.ref);
                    }
                    types[a.name].fields.push(buildFieldDescription(f, types[a.name].fields.length));
                } else if (f.kind === 'def_constant') {
                    if (types[a.name].fields.find((v) => v.name === f.name)) {
                        throwError(`Field ${f.name} already exists`, f.ref);
                    }
                    if (types[a.name].constants.find((v) => v.name === f.name)) {
                        throwError(`Constant ${f.name} already exists`, f.ref);
                    }
                    if (f.attributes.find((v) => v.type === 'overrides')) {
                        throwError(`Trait constant cannot be overridden`, f.ref);
                    }
                    // if (f.attributes.find((v) => v.type === 'abstract')) {
                    //     continue; // Do not materialize abstract constants
                    // }
                    types[a.name].constants.push(buildConstantDescription(f));
                }
            }
        }
    }

    //
    // Populate partial serialization info
    //

    for (const t in types) {
        types[t].partialFieldCount = resolvePartialFields(ctx, types[t])
    }

    //
    // Resolve contract functions
    //

    function resolveFunctionDescriptor(sself: string | null, a: ASTFunction | ASTNativeFunction, origin: TypeOrigin): FunctionDescription {

        let self = sself;

        // Resolve return
        let returns: TypeRef = { kind: 'void' };
        if (a.return) {
            returns = buildTypeRef(a.return, types);
        }

        // Resolve args
        let args: FunctionArgument[] = [];
        for (const r of a.args) {
            args.push({
                name: r.name,
                type: buildTypeRef(r.type, types),
                ref: r.ref
            });
        }

        // Resolve flags
        const isGetter = a.attributes.find(a => a.type === 'get');
        const isMutating = a.attributes.find(a => a.type === 'mutates');
        const isExtends = a.attributes.find(a => a.type === 'extends');
        const isVirtual = a.attributes.find(a => a.type === 'virtual');
        const isOverrides = a.attributes.find(a => a.type === 'overrides');
        const isInline = a.attributes.find(a => a.type === 'inline');
        const isAbstract = a.attributes.find(a => a.type === 'abstract');

        // Check for native
        if (a.kind === 'def_native_function') {
            if (isGetter) {
                throwError('Native functions cannot be getters', isGetter.ref);
            }
            if (self) {
                throwError('Native functions cannot be delated within a contract', a.ref);
            }
            if (isVirtual) {
                throwError('Native functions cannot be virtual', isVirtual.ref);
            }
            if (isOverrides) {
                throwError('Native functions cannot be overrides', isOverrides.ref);
            }
        }

        // Check virtual and overrides
        if (isVirtual && isExtends) {
            throwError('Extend functions cannot be virtual', isVirtual.ref);
        }
        if (isOverrides && isExtends) {
            throwError('Extend functions cannot be overrides', isOverrides.ref);
        }
        if (isAbstract && isExtends) {
            throwError('Extend functions cannot be abstract', isAbstract.ref);
        }
        if (!self && isVirtual) {
            throwError('Virtual functions must be defined within a contract or a trait', isVirtual.ref);
        }
        if (!self && isOverrides) {
            throwError('Overrides functions must be defined within a contract or a trait', isOverrides.ref);
        }
        if (!self && isAbstract) {
            throwError('Abstract functions must be defined within a trait', isAbstract.ref);
        }
        if (isVirtual && isAbstract) {
            throwError('Abstract functions cannot be virtual', isAbstract.ref);
        }
        if (isVirtual && isOverrides) {
            throwError('Overrides functions cannot be virtual', isOverrides.ref);
        }
        if (isAbstract && isOverrides) {
            throwError('Overrides functions cannot be abstract', isOverrides.ref);
        }

        // Check virtual
        if (isVirtual) {
            const t = types[self!]!;
            if (t.kind !== 'trait') {
                throwError('Virtual functions must be defined within a trait', isVirtual.ref);
            }
        }

        // Check abstract
        if (isAbstract) {
            const t = types[self!]!;
            if (t.kind !== 'trait') {
                throwError('Abstract functions must be defined within a trait', isAbstract.ref);
            }
        }

        // Check overrides
        if (isOverrides) {
            const t = types[self!]!;
            if (t.kind !== 'contract') {
                throwError('Overrides functions must be defined within a contract', isOverrides.ref);
            }
        }

        // Check for common
        if (a.kind === 'def_function') {
            if (isGetter && !self) {
                throwError('Getters must be defined within a contract', isGetter.ref);
            }
        }

        // Check for getter
        if (isInline && isGetter) {
            throwError('Getters cannot be inline', isInline.ref);
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
            args = args.slice(1);
        }

        // Check for mutating and extends
        if (isMutating && !isExtends) {
            throwError('Mutating functions must be extend functions', isMutating.ref);
        }

        // Check argument names
        const exNames = new Set<string>();
        for (const arg of args) {
            if (arg.name === 'self') {
                throwError('Argument name "self" is reserved', arg.ref);
            }
            if (exNames.has(arg.name)) {
                throwError('Argument name "' + arg.name + '" is already used', arg.ref);
            }
            exNames.add(arg.name);
        }

        // Check for runtime types in getters
        if (isGetter) {
            for (const arg of args) {
                if (isRuntimeType(arg.type)) {
                    throwError(printTypeRef(arg.type) + ' is a runtime-only type and can\'t be used as a getter argument', arg.ref);
                }
            }
            if (isRuntimeType(returns)) {
                throwError(printTypeRef(returns) + ' is a runtime-only type and can\'t be used as getter return type', a.ref);
            }
        }

        // Register function
        return {
            name: a.name,
            self: self,
            origin,
            args,
            returns,
            ast: a,
            isMutating: !!isMutating || (!!sself /* && !isGetter */), // Mark all contract functions as mutating
            isGetter: !!isGetter,
            isVirtual: !!isVirtual,
            isOverrides: !!isOverrides,
            isInline: !!isInline,
            isAbstract: !!isAbstract
        };
    }

    function resolveInitFunction(ast: ASTInitFunction): InitDescription {
        const args: InitArgument[] = [];
        for (const r of ast.args) {
            args.push({
                name: r.name,
                type: buildTypeRef(r.type, types),
                as: null,
                ref: r.ref
            });
        }

        // Check if runtime types are used
        for (const a of args) {
            if (isRuntimeType(a.type)) {
                throwError(printTypeRef(a.type) + ' is a runtime-only type and can\'t be used as a init function argument', a.ref);
            }
        }

        return {
            args,
            ast
        };
    }

    for (const a of ast.types) {
        if (a.kind === 'def_contract' || a.kind === 'def_trait') {
            const s = types[a.name];
            for (const d of a.declarations) {
                if (d.kind === 'def_function') {
                    const f = resolveFunctionDescriptor(s.name, d, s.origin);
                    if (f.self !== s.name) {
                        throw Error('Function self must be ' + s.name); // Impossible
                    }
                    if (s.functions.has(f.name)) {
                        throwError(`Function ${f.name} already exists in type ${s.name}`, s.ast.ref);
                    }
                    s.functions.set(f.name, f);
                }
                if (d.kind === 'def_init_function') {
                    if (s.init) {
                        throwError('Init function already exists', d.ref);
                    }
                    s.init = resolveInitFunction(d);
                }
                if (d.kind === 'def_receive') {

                    // Check if externals are enabled
                    if (d.selector.kind.startsWith('external-') && !enabledExternals(ctx)) {
                        throwError('External functions are not enabled', d.ref);
                    }

                    if (d.selector.kind === 'internal-simple' || d.selector.kind === 'external-simple') {
                        const arg = d.selector.arg;
                        const internal = d.selector.kind === 'internal-simple';

                        // Check argument type
                        if (arg.type.kind !== 'type_ref_simple') {
                            throwError('Receive function can only accept message', d.ref);
                        }
                        if (arg.type.optional) {
                            throwError('Receive function cannot have optional argument', d.ref);
                        }

                        // Check resolved argument type
                        const t = types[arg.type.name];
                        if (!t) {
                            throwError('Type ' + arg.type.name + ' not found', d.ref);
                        }

                        // Raw receiver
                        if (t.kind === 'primitive') {

                            if (t.name === 'Slice') {

                                // Check for existing receiver
                                if (s.receivers.find((v) => v.selector.kind === (internal ? 'internal-fallback' : 'external-fallback'))) {
                                    throwError(`Fallback receive function already exists`, d.ref);
                                }

                                // Persist receiver
                                s.receivers.push({
                                    selector: {
                                        kind: internal ? 'internal-fallback' : 'external-fallback',
                                        name: arg.name
                                    },
                                    ast: d
                                });

                            } else if (t.name === 'String') {

                                // Check for existing receiver
                                if (s.receivers.find((v) => v.selector.kind === (internal ? 'internal-comment-fallback' : 'external-comment-fallback'))) {
                                    throwError('Comment fallback receive function already exists', d.ref);
                                }

                                // Persist receiver
                                s.receivers.push({
                                    selector: {
                                        kind: (internal ? 'internal-comment-fallback' : 'external-comment-fallback'),
                                        name: arg.name
                                    },
                                    ast: d
                                });
                            } else {
                                throwError('Receive function can only accept message, Slice or String', d.ref);
                            }
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
                            if (s.receivers.find((v) => v.selector.kind === (internal ? 'internal-binary' : 'external-binary') && v.selector.name === n)) {
                                throwError(`Receive function for ${arg.type.name} already exists`, d.ref);
                            }

                            // Persist receiver
                            s.receivers.push({
                                selector: {
                                    kind: (internal ? 'internal-binary' : 'external-binary'),
                                    name: arg.name,
                                    type: arg.type.name,
                                },
                                ast: d
                            });
                        }
                    } else if (d.selector.kind === 'internal-comment' || d.selector.kind === 'external-comment') {
                        const internal = d.selector.kind === 'internal-comment';
                        if (d.selector.comment.value === '') {
                            throwError('To use empty comment receiver, just remove argument instead of passing empty string', d.ref);
                        }
                        const c = d.selector.comment.value;
                        if (s.receivers.find((v) => v.selector.kind === (internal ? 'internal-comment' : 'external-comment') && v.selector.comment === c)) {
                            throwError(`Receive function for "${c}" already exists`, d.ref);
                        }
                        s.receivers.push({
                            selector: {
                                kind: (internal ? 'internal-comment' : 'external-comment'),
                                comment: c
                            },
                            ast: d
                        });
                    } else if (d.selector.kind === 'internal-fallback') {
                        const internal = d.selector.kind === 'internal-fallback';
                        // Handle empty
                        if (s.receivers.find((v) => v.selector.kind === (internal ? 'internal-empty' : 'external-empty'))) {
                            throwError('Empty receive function already exists', d.ref);
                        }
                        s.receivers.push({
                            selector: {
                                kind: (internal ? 'internal-empty' : 'external-empty')
                            },
                            ast: d
                        });
                    } else if (d.selector.kind === 'bounce') {
                        const arg = d.selector.arg;

                        // If argument is a direct reference
                        if (arg.type.kind === "type_ref_simple") {

                            if (arg.type.optional) {
                                throwError('Bounce receive function cannot have optional argument', d.ref);
                            }

                            if (arg.type.name === "Slice") {

                                if (s.receivers.find((v) => v.selector.kind === 'bounce-fallback')) {
                                    throwError(`Fallback bounce receive function already exists`, d.ref);
                                }

                                s.receivers.push({
                                    selector: { kind: 'bounce-fallback', name: arg.name },
                                    ast: d
                                });
                            } else {
                                const type = types[arg.type.name];
                                if (type.ast.kind !== 'def_struct' || !type.ast.message) {
                                    throwError('Bounce receive function can only accept bounced message, message or Slice', d.ref);
                                }
                                if (type.fields.length !== type.partialFieldCount) {
                                    throwError('This message is too big for bounce receiver, you need to wrap it to a bounced<' + arg.type.name + '>.', d.ref);
                                }
                                if (s.receivers.find((v) => v.selector.kind === 'bounce-binary' && v.selector.name === type.name)) {
                                    throwError(`Bounce receive function for ${arg.type.name} already exists`, d.ref);
                                }
                                s.receivers.push({
                                    selector: {
                                        kind: 'bounce-binary',
                                        name: arg.name,
                                        type: arg.type.name,
                                        bounced: false
                                    },
                                    ast: d
                                });
                            }

                        } else if (arg.type.kind === "type_ref_bounced") {
                            const t = types[arg.type.name];
                            if (t.kind !== 'struct') {
                                throwError('Bounce receive function can only accept bounced<T> struct types', d.ref);
                            }
                            if (t.ast.kind !== 'def_struct') {
                                throwError('Bounce receive function can only accept bounced<T> struct types', d.ref);
                            }
                            if (!t.ast.message) {
                                throwError('Bounce receive function can only accept bounced message, message or Slice', d.ref);
                            }
                            if (s.receivers.find((v) => v.selector.kind === 'bounce-binary' && v.selector.type === t.name)) {
                                throwError(`Bounce receive function for ${t.name} already exists`, d.ref);
                            }
                            if (t.fields.length === t.partialFieldCount) {
                                throwError('This message is small enough for bounce receiver, you need to remove bounced modifier.', d.ref);
                            }
                            s.receivers.push({
                                selector: {
                                    kind: 'bounce-binary',
                                    name: arg.name,
                                    type: arg.type.name,
                                    bounced: true
                                },
                                ast: d
                            });
                        } else {
                            throwError('Bounce receive function can only accept bounced<T> struct args or Slice', d.ref);
                        }
                    } else {
                        throwError('Invalid receive function selector', d.ref);
                    }
                }
            }
        }
    }

    //
    // Check for missing init methods
    //

    for (const k in types) {
        const t = types[k];
        if (t.kind === 'contract') {
            if (!t.init) {
                throwError('Contract ' + t.name + ' does not have init method', t.ast.ref);
            }
        }
    }

    //
    // Flatten and resolve traits
    //

    for (const k in types) {
        const t = types[k];
        if (t.ast.kind === 'def_trait' || t.ast.kind === 'def_contract') {

            // Flatten traits
            const traits: TypeDescription[] = [];
            const visited = new Set<string>();
            visited.add(t.name);
            // eslint-disable-next-line no-inner-declarations
            function visit(name: string) {
                if (visited.has(name)) {
                    return;
                }
                const tt = types[name];
                if (!tt) {
                    throwError('Trait ' + name + ' not found', t.ast.ref)
                }
                visited.add(name);
                traits.push(tt);
                if (tt.ast.kind === 'def_trait') {
                    for (const s of tt.ast.traits) {
                        visit(s.value);
                    }
                    for (const f of tt.traits) {
                        visit(f.name);
                    }
                } else {
                    throwError('Type ' + name + ' is not a trait', t.ast.ref);
                }
            }
            visit('BaseTrait');
            for (const s of t.ast.traits) {
                visit(s.value);
            }

            // Assign traits
            t.traits = traits;
        }
    }

    //
    // Verify trait fields
    //

    for (const k in types) {
        const t = types[k];

        for (const tr of t.traits) {

            // Check that trait is valid
            if (!types[tr.name]) {
                throwError('Trait ' + tr.name + ' not found', t.ast.ref);
            }
            if (types[tr.name].kind !== 'trait') {
                throwError('Type ' + tr.name + ' is not a trait', t.ast.ref);
            }

            // Check that trait has all required fields
            const ttr = types[tr.name];
            for (const f of ttr.fields) {

                // Check if field exists
                const ex = t.fields.find((v) => v.name === f.name);
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
    // Copy Trait functions and constants
    //

    function copyTraits(t: TypeDescription) {
        for (const tr of t.traits) {

            // Copy functions
            for (const f of tr.functions.values()) {
                const ex = t.functions.get(f.name);
                if (!ex && f.isAbstract) {
                    throwError(`Trait ${tr.name} requires function ${f.name}`, t.ast.ref);
                }

                // Check overrides
                if (ex && ex.isOverrides) {
                    if (f.isGetter) {
                        throwError(`Overridden function ${f.name} can not be a getter`, ex.ast.ref);
                    }
                    if (f.isMutating !== ex.isMutating) {
                        throwError(`Overridden function ${f.name} should have same mutability`, ex.ast.ref);
                    }
                    if (!typeRefEquals(f.returns, ex.returns)) {
                        throwError(`Overridden function ${f.name} should have same return type`, ex.ast.ref);
                    }
                    if (f.args.length !== ex.args.length) {
                        throwError(`Overridden function ${f.name} should have same number of arguments`, ex.ast.ref);
                    }
                    for (let i = 0; i < f.args.length; i++) {
                        const a = ex.args[i];
                        const b = f.args[i];
                        if (!typeRefEquals(a.type, b.type)) {
                            throwError(`Overridden function ${f.name} should have same argument types`, ex.ast.ref);
                        }
                    }
                    continue; // Ignore overridden functions
                }

                // Check duplicates
                if (ex) {
                    throwError(`Function ${f.name} already exist in ${t.name}`, t.ast.ref);
                }

                // Register function
                t.functions.set(f.name, {
                    ...f,
                    self: t.name,
                    ast: cloneNode(f.ast)
                });
            }

            // Copy constants
            for (const f of tr.constants) {
                const ex = t.constants.find((v) => v.name === f.name);
                if (!ex && f.ast.attributes.find((v) => v.type === 'abstract')) {
                    throwError(`Trait ${tr.name} requires constant ${f.name}`, t.ast.ref);
                }

                // Check overrides
                if (ex && ex.ast.attributes.find((v) => v.type === 'overrides')) {
                    if (!typeRefEquals(f.type, ex.type)) {
                        throwError(`Overridden constant ${f.name} should have same type`, ex.ast.ref);
                    }
                    continue;
                }

                // Check duplicates
                if (ex) {
                    throwError(`Constant ${f.name} already exist in ${t.name}`, t.ast.ref);
                }

                // Register constant
                t.constants.push({
                    ...f,
                    ast: cloneNode(f.ast)
                });
            }

            // Copy receivers
            for (const f of tr.receivers) {
                // eslint-disable-next-line no-inner-declarations
                function sameReceiver(a: ReceiverSelector, b: ReceiverSelector) {
                    if (a.kind === 'internal-comment' && b.kind === 'internal-comment') {
                        return a.comment === b.comment;
                    }
                    if (a.kind === 'internal-binary' && b.kind === 'internal-binary') {
                        return a.type === b.type;
                    }
                    if (a.kind === 'bounce-fallback' && b.kind === 'bounce-fallback') {
                        return true; // Could be only one
                    }
                    if (a.kind === 'bounce-binary' && b.kind === 'bounce-binary') {
                        return a.type === b.type;
                    }
                    if (a.kind === 'internal-empty' && b.kind === 'internal-empty') {
                        return true;
                    }
                    if (a.kind === 'internal-fallback' && b.kind === 'internal-fallback') {
                        return true;
                    }
                    if (a.kind === 'internal-comment-fallback' && b.kind === 'internal-comment-fallback') {
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

            // Copy interfaces
            for (const i of tr.interfaces) {
                if (!t.interfaces.find((v) => v === i)) {
                    t.interfaces.push(i);
                }
            }
        }
    }

    // Copy to non-traits to avoid duplicates

    const processed = new Set<string>();
    const processing = new Set<string>();

    function processType(name: string) {

        // Check if processed
        if (processed.has(name)) {
            return;
        }
        if (processing.has(name)) {
            throwError(`Circular dependency detected for type ${name}`, types[name].ast.ref);
        }
        processing.has(name);

        // Process dependencies first
        const dependencies = Object.values(types).filter((v) => v.traits.find((v2) => v2.name === name));
        for (const d of dependencies) {
            processType(d.name);
        }

        // Copy traits
        copyTraits(types[name]);

        // Mark as processed
        processed.add(name);
        processing.delete(name);
    }
    for (const k in types) {
        processType(k);
    }

    //
    // Register dependencies
    //

    for (const k in types) {
        const t = types[k];
        const dependsOn = new Set<string>();
        const handler = (src: ASTNode) => {
            if (src.kind === 'init_of') {
                if (!types[src.name]) {
                    throwError(`Type ${src.name} not found`, src.ref);
                }
                dependsOn.add(src.name);
            }
        }

        // Traverse functions
        for (const f of t.functions.values()) {
            traverse(f.ast, handler);
        }
        for (const f of t.receivers) {
            traverse(f.ast, handler);
        }

        // Add dependencies
        for (const s of dependsOn) {
            if (s !== k) {
                t.dependsOn.push(types[s]!);
            }
        }
    }

    //
    // Register transient dependencies
    //

    function collectTransient(name: string, to: Set<string>) {
        const t = types[name];
        for (const d of t.dependsOn) {
            if (to.has(d.name)) {
                continue;
            }
            to.add(d.name);
            collectTransient(d.name, to);
        }
    }
    for (const k in types) {
        const dependsOn = new Set<string>();
        dependsOn.add(k);
        collectTransient(k, dependsOn);
        for (const s of dependsOn) {
            if (s !== k && !types[k].dependsOn.find((v) => v.name === s)) {
                types[k].dependsOn.push(types[s]!);
            }
        }
    }

    //
    // Resolve static functions
    //

    for (const a of ast.functions) {
        const r = resolveFunctionDescriptor(null, a, a.origin);
        if (r.self) {
            if (types[r.self].functions.has(r.name)) {
                throwError(`Function ${r.name} already exists in type ${r.self}`, r.ast.ref);
            }
            types[r.self].functions.set(r.name, r);
        } else {
            if (staticFunctions[r.name]) {
                throwError(`Static function ${r.name} already exists`, r.ast.ref);
            }
            if (staticConstants[r.name]) {
                throwError(`Static constant ${r.name} already exists`, a.ref);
            }
            staticFunctions[r.name] = r;
        }
    }

    //
    // Resolve static constants
    //

    for (const a of ast.constants) {
        if (staticConstants[a.name]) {
            throwError(`Static constant ${a.name} already exists`, a.ref);
        }
        if (staticFunctions[a.name]) {
            throwError(`Static function ${a.name} already exists`, a.ref);
        }
        staticConstants[a.name] = buildConstantDescription(a);
    }

    //
    // Register types and functions in context
    //

    for (const t in types) {
        ctx = store.set(ctx, t, types[t]);
    }
    for (const t in staticFunctions) {
        ctx = staticFunctionsStore.set(ctx, t, staticFunctions[t]);
    }
    for (const t in staticConstants) {
        ctx = staticConstantsStore.set(ctx, t, staticConstants[t]);
    }

    return ctx;
}

export function getType(ctx: CompilerContext, name: string): TypeDescription {
    const r = store.get(ctx, name);
    if (!r) {
        throw Error('Type ' + name + ' not found');
    }
    return r;
}

export function getAllTypes(ctx: CompilerContext) {
    return store.all(ctx);
}

export function getContracts(ctx: CompilerContext) {
    return Object.values(getAllTypes(ctx)).filter((v) => v.kind === 'contract').map((v) => v.name);
}

export function getStaticFunction(ctx: CompilerContext, name: string): FunctionDescription {
    const r = staticFunctionsStore.get(ctx, name);
    if (!r) {
        throw Error('Static function ' + name + ' not found');
    }
    return r;
}

export function hasStaticFunction(ctx: CompilerContext, name: string) {
    return !!staticFunctionsStore.get(ctx, name);
}

export function getStaticConstant(ctx: CompilerContext, name: string): ConstantDescription {
    const r = staticConstantsStore.get(ctx, name);
    if (!r) {
        throw Error('Static constant ' + name + ' not found');
    }
    return r;
}

export function hasStaticConstant(ctx: CompilerContext, name: string) {
    return !!staticConstantsStore.get(ctx, name);
}

export function getAllStaticFunctions(ctx: CompilerContext) {
    return staticFunctionsStore.all(ctx);
}

export function getAllStaticConstants(ctx: CompilerContext) {
    return staticConstantsStore.all(ctx);
}

export function resolvePartialFields(ctx: CompilerContext, type: TypeDescription) {
    if (type.kind !== 'struct') return 0;

    let partialFieldsCount = 0;

    let remainingBits = 224;

    for (const f of type.fields) {
        // dicts are unsupported
        if (f.abi.type.kind !== "simple") break;

        let fieldBits = f.abi.type.optional ? 1 : 0;

        // TODO handle fixed-bytes
        if (Number.isInteger(f.abi.type.format)) {
            fieldBits += f.abi.type.format as number;
        } else if (f.abi.type.format === "coins") {
            fieldBits += 124;
        } else if (f.abi.type.type === "address") {
            fieldBits += 267;
        } else if (f.abi.type.type === "bool") {
            fieldBits += 1;
        } else {
            // Unsupported - all others (slice, builder, nested structs, maps)
            break;
        }

        if (remainingBits - fieldBits >= 0) {
            remainingBits -= fieldBits;
            partialFieldsCount++;
        } else {
            break;
        }
    }

    return partialFieldsCount;
}