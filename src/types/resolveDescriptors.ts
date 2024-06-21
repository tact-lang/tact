import {
    ASTConstant,
    ASTField,
    ASTFunction,
    ASTInitFunction,
    ASTNativeFunction,
    ASTNode,
    ASTRef,
    ASTTypeRef,
    createNode,
    traverse,
} from "../grammar/ast";
import { throwCompilationError } from "../errors";
import { CompilerContext, createContextStore } from "../context";
import {
    ConstantDescription,
    FieldDescription,
    FunctionArgument,
    FunctionDescription,
    InitArgument,
    InitDescription,
    printTypeRef,
    ReceiverSelector,
    TypeDescription,
    TypeOrigin,
    TypeRef,
    typeRefEquals,
} from "./types";
import { getRawAST } from "../grammar/store";
import { cloneNode } from "../grammar/clone";
import { crc16 } from "../utils/crc16";
import { evalConstantExpression } from "../constEval";
import { resolveABIType } from "./resolveABITypeRef";
import { enabledExternals } from "../config/features";
import { isRuntimeType } from "./isRuntimeType";
import { GlobalFunctions } from "../abi/global";

const store = createContextStore<TypeDescription>();
const staticFunctionsStore = createContextStore<FunctionDescription>();
const staticConstantsStore = createContextStore<ConstantDescription>();

function verifyMapType(
    key: string,
    keyAs: string | null,
    value: string,
    valueAs: string | null,
    ref: ASTRef,
) {
    if (!keyAs && !valueAs) {
        return;
    }

    // keyAs
    if (keyAs) {
        if (key === "Int") {
            if (
                ![
                    "int8",
                    "int16",
                    "int32",
                    "int64",
                    "int128",
                    "int256",
                    "int257",
                    "uint8",
                    "uint16",
                    "uint32",
                    "uint64",
                    "uint128",
                    "uint256",
                ].includes(keyAs)
            ) {
                throwCompilationError("Invalid key type for map", ref);
            }
        } else {
            throwCompilationError("Invalid key type for map", ref);
        }
    }

    // valueAs
    if (valueAs) {
        if (value === "Int") {
            if (
                ![
                    "int8",
                    "int16",
                    "int32",
                    "int64",
                    "int128",
                    "int256",
                    "int257",
                    "uint8",
                    "uint16",
                    "uint32",
                    "uint64",
                    "uint128",
                    "uint256",
                    "coins",
                ].includes(valueAs)
            ) {
                throwCompilationError("Invalid value type for map", ref);
            }
        } else {
            throwCompilationError("Invalid value type for map", ref);
        }
    }
}

export const toBounced = (type: string) => `${type}%%BOUNCED%%`;

export function resolveTypeRef(ctx: CompilerContext, src: ASTTypeRef): TypeRef {
    if (src.kind === "type_ref_simple") {
        const t = getType(ctx, src.name);
        return {
            kind: "ref",
            name: t.name,
            optional: src.optional,
        };
    }
    if (src.kind === "type_ref_map") {
        const k = getType(ctx, src.key).name;
        const v = getType(ctx, src.value).name;
        verifyMapType(k, src.keyAs, v, src.valueAs, src.ref);
        return {
            kind: "map",
            key: k,
            keyAs: src.keyAs,
            value: v,
            valueAs: src.valueAs,
        };
    }
    if (src.kind === "type_ref_bounced") {
        const t = getType(ctx, src.name);
        return {
            kind: "ref_bounced",
            name: t.name,
        };
    }
    throw Error("Invalid type ref");
}

function buildTypeRef(
    src: ASTTypeRef,
    types: Map<string, TypeDescription>,
): TypeRef {
    if (src.kind === "type_ref_simple") {
        if (!types.has(src.name)) {
            throwCompilationError("Type " + src.name + " not found", src.ref);
        }
        return {
            kind: "ref",
            name: src.name,
            optional: src.optional,
        };
    }
    if (src.kind === "type_ref_map") {
        if (!types.has(src.key)) {
            throwCompilationError("Type " + src.key + " not found", src.ref);
        }
        if (!types.has(src.value)) {
            throwCompilationError("Type " + src.value + " not found", src.ref);
        }
        return {
            kind: "map",
            key: src.key,
            keyAs: src.keyAs,
            value: src.value,
            valueAs: src.valueAs,
        };
    }
    if (src.kind === "type_ref_bounced") {
        return {
            kind: "ref_bounced",
            name: src.name,
        };
    }

    throw Error("Unknown type ref");
}

function uidForName(name: string, types: Map<string, TypeDescription>) {
    // Resolve unique typeid from crc16
    let uid = crc16(name);
    while (Array.from(types.values()).find((v) => v.uid === uid)) {
        uid = (uid + 1) % 65536;
    }
    return uid;
}

export function resolveDescriptors(ctx: CompilerContext) {
    const types: Map<string, TypeDescription> = new Map();
    const staticFunctions: Map<string, FunctionDescription> = new Map();
    const staticConstants: Map<string, ConstantDescription> = new Map();
    const ast = getRawAST(ctx);

    //
    // Register types
    //

    for (const a of ast.types) {
        if (types.has(a.name)) {
            throwCompilationError(`Type "${a.name}" already exists`, a.ref);
        }

        const uid = uidForName(a.name, types);

        if (a.kind === "primitive") {
            types.set(a.name, {
                kind: "primitive",
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
                partialFieldCount: 0,
            });
        } else if (a.kind === "def_contract") {
            types.set(a.name, {
                kind: "contract",
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
                interfaces: a.attributes
                    .filter((v) => v.type === "interface")
                    .map((v) => v.name.value),
                constants: [],
                partialFieldCount: 0,
            });
        } else if (a.kind === "def_struct") {
            types.set(a.name, {
                kind: "struct",
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
                partialFieldCount: 0,
            });
        } else if (a.kind === "def_trait") {
            types.set(a.name, {
                kind: "trait",
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
                interfaces: a.attributes
                    .filter((v) => v.type === "interface")
                    .map((v) => v.name.value),
                constants: [],
                partialFieldCount: 0,
            });
        }
    }

    //
    // Resolve fields
    //

    function buildFieldDescription(
        src: ASTField,
        index: number,
    ): FieldDescription {
        const tr = buildTypeRef(src.type, types);

        // Check if field is runtime type
        if (isRuntimeType(tr)) {
            throwCompilationError(
                printTypeRef(tr) +
                    " is a runtime only type and can't be used as field",
                src.ref,
            );
        }

        const d = src.init ? evalConstantExpression(src.init, ctx) : undefined;

        // Resolve abi type
        const type = resolveABIType(src);

        return {
            name: src.name,
            type: tr,
            index,
            as: src.as,
            default: d,
            ref: src.ref,
            ast: src,
            abi: { name: src.name, type },
        };
    }

    function buildConstantDescription(src: ASTConstant): ConstantDescription {
        const tr = buildTypeRef(src.type, types);
        const d = src.value
            ? evalConstantExpression(src.value, ctx)
            : undefined;
        return { name: src.name, type: tr, value: d, ref: src.ref, ast: src };
    }

    for (const a of ast.types) {
        // Contract
        if (a.kind === "def_contract") {
            for (const f of a.declarations) {
                if (f.kind === "def_field") {
                    if (
                        types.get(a.name)!.fields.find((v) => v.name === f.name)
                    ) {
                        throwCompilationError(
                            `Field "${f.name}" already exists`,
                            f.ref,
                        );
                    }
                    if (
                        types
                            .get(a.name)!
                            .constants.find((v) => v.name === f.name)
                    ) {
                        throwCompilationError(
                            `Constant "${f.name}" already exists`,
                            f.ref,
                        );
                    }
                    types
                        .get(a.name)!
                        .fields.push(
                            buildFieldDescription(
                                f,
                                types.get(a.name)!.fields.length,
                            ),
                        );
                } else if (f.kind === "def_constant") {
                    if (
                        types.get(a.name)!.fields.find((v) => v.name === f.name)
                    ) {
                        throwCompilationError(
                            `Field "${f.name}" already exists`,
                            f.ref,
                        );
                    }
                    if (
                        types
                            .get(a.name)!
                            .constants.find((v) => v.name === f.name)
                    ) {
                        throwCompilationError(
                            `Constant "${f.name}" already exists`,
                            f.ref,
                        );
                    }
                    if (f.attributes.find((v) => v.type !== "overrides")) {
                        throwCompilationError(
                            `Constant can be only overridden`,
                            f.ref,
                        );
                    }
                    types
                        .get(a.name)!
                        .constants.push(buildConstantDescription(f));
                }
            }
        }

        // Struct
        if (a.kind === "def_struct") {
            for (const f of a.fields) {
                if (types.get(a.name)!.fields.find((v) => v.name === f.name)) {
                    throwCompilationError(
                        `Field "${f.name}" already exists`,
                        f.ref,
                    );
                }
                types
                    .get(a.name)!
                    .fields.push(
                        buildFieldDescription(
                            f,
                            types.get(a.name)!.fields.length,
                        ),
                    );
            }
            if (a.fields.length === 0 && !a.message) {
                throwCompilationError(
                    `Struct "${a.name}" must have at least one field`,
                    a.ref,
                );
            }
        }

        // Trait
        if (a.kind === "def_trait") {
            for (const f of a.declarations) {
                if (f.kind === "def_field") {
                    if (
                        types.get(a.name)!.fields.find((v) => v.name === f.name)
                    ) {
                        throwCompilationError(
                            `Field "${f.name}" already exists`,
                            f.ref,
                        );
                    }
                    if (f.as) {
                        throwCompilationError(
                            `Trait field cannot have serialization specifier`,
                            f.ref,
                        );
                    }
                    types
                        .get(a.name)!
                        .fields.push(
                            buildFieldDescription(
                                f,
                                types.get(a.name)!.fields.length,
                            ),
                        );
                } else if (f.kind === "def_constant") {
                    if (
                        types.get(a.name)!.fields.find((v) => v.name === f.name)
                    ) {
                        throwCompilationError(
                            `Field "${f.name}" already exists`,
                            f.ref,
                        );
                    }
                    if (
                        types
                            .get(a.name)!
                            .constants.find((v) => v.name === f.name)
                    ) {
                        throwCompilationError(
                            `Constant "${f.name}" already exists`,
                            f.ref,
                        );
                    }
                    if (f.attributes.find((v) => v.type === "overrides")) {
                        throwCompilationError(
                            `Trait constant cannot be overridden`,
                            f.ref,
                        );
                    }
                    // if (f.attributes.find((v) => v.type === 'abstract')) {
                    //     continue; // Do not materialize abstract constants
                    // }
                    types
                        .get(a.name)!
                        .constants.push(buildConstantDescription(f));
                }
            }
        }
    }

    //
    // Populate partial serialization info
    //

    for (const t of types.values()) {
        t.partialFieldCount = resolvePartialFields(ctx, t);
    }

    //
    // Resolve contract functions
    //

    function resolveFunctionDescriptor(
        optSelf: string | null,
        a: ASTFunction | ASTNativeFunction,
        origin: TypeOrigin,
    ): FunctionDescription {
        let self = optSelf;

        // Resolve return
        let returns: TypeRef = { kind: "void" };
        if (a.return) {
            returns = buildTypeRef(a.return, types);
        }

        // Resolve args
        let args: FunctionArgument[] = [];
        for (const r of a.args) {
            args.push({
                name: r.name,
                type: buildTypeRef(r.type, types),
                ref: r.ref,
            });
        }

        // Resolve flags
        const isGetter = a.attributes.find((a) => a.type === "get");
        const isMutating = a.attributes.find((a) => a.type === "mutates");
        const isExtends = a.attributes.find((a) => a.type === "extends");
        const isVirtual = a.attributes.find((a) => a.type === "virtual");
        const isOverrides = a.attributes.find((a) => a.type === "overrides");
        const isInline = a.attributes.find((a) => a.type === "inline");
        const isAbstract = a.attributes.find((a) => a.type === "abstract");

        // Check for native
        if (a.kind === "def_native_function") {
            if (isGetter) {
                throwCompilationError(
                    "Native functions cannot be getters",
                    isGetter.ref,
                );
            }
            if (self) {
                throwCompilationError(
                    "Native functions cannot be defined within a contract",
                    a.ref,
                );
            }
            if (isVirtual) {
                throwCompilationError(
                    "Native functions cannot be virtual",
                    isVirtual.ref,
                );
            }
            if (isOverrides) {
                throwCompilationError(
                    "Native functions cannot be overrides",
                    isOverrides.ref,
                );
            }
        }

        // Check virtual and overrides
        if (isVirtual && isExtends) {
            throwCompilationError(
                "Extend functions cannot be virtual",
                isVirtual.ref,
            );
        }
        if (isOverrides && isExtends) {
            throwCompilationError(
                "Extend functions cannot be overrides",
                isOverrides.ref,
            );
        }
        if (isAbstract && isExtends) {
            throwCompilationError(
                "Extend functions cannot be abstract",
                isAbstract.ref,
            );
        }
        if (!self && isVirtual) {
            throwCompilationError(
                "Virtual functions must be defined within a contract or a trait",
                isVirtual.ref,
            );
        }
        if (!self && isOverrides) {
            throwCompilationError(
                "Overrides functions must be defined within a contract or a trait",
                isOverrides.ref,
            );
        }
        if (!self && isAbstract) {
            throwCompilationError(
                "Abstract functions must be defined within a trait",
                isAbstract.ref,
            );
        }
        if (isVirtual && isAbstract) {
            throwCompilationError(
                "Abstract functions cannot be virtual",
                isAbstract.ref,
            );
        }
        if (isVirtual && isOverrides) {
            throwCompilationError(
                "Overrides functions cannot be virtual",
                isOverrides.ref,
            );
        }
        if (isAbstract && isOverrides) {
            throwCompilationError(
                "Overrides functions cannot be abstract",
                isOverrides.ref,
            );
        }

        // Check virtual
        if (isVirtual) {
            const t = types.get(self!)!;
            if (t.kind !== "trait") {
                throwCompilationError(
                    "Virtual functions must be defined within a trait",
                    isVirtual.ref,
                );
            }
        }

        // Check abstract
        if (isAbstract) {
            const t = types.get(self!)!;
            if (t.kind !== "trait") {
                throwCompilationError(
                    "Abstract functions must be defined within a trait",
                    isAbstract.ref,
                );
            }
        }

        // Check overrides
        if (isOverrides) {
            const t = types.get(self!)!;
            if (t.kind !== "contract") {
                throwCompilationError(
                    "Overrides functions must be defined within a contract",
                    isOverrides.ref,
                );
            }
        }

        // Check for common
        if (a.kind === "def_function") {
            if (isGetter && !self) {
                throwCompilationError(
                    "Getters must be defined within a contract",
                    isGetter.ref,
                );
            }
        }

        // Check for getter
        if (isInline && isGetter) {
            throwCompilationError("Getters cannot be inline", isInline.ref);
        }

        // Validate mutating
        if (isExtends) {
            // Validate arguments
            if (self) {
                throwCompilationError(
                    "Extend functions cannot be defined within a contract",
                    isExtends.ref,
                );
            }
            if (args.length === 0) {
                throwCompilationError(
                    "Extend functions must have at least one argument",
                    isExtends.ref,
                );
            }
            if (args[0].name !== "self") {
                throwCompilationError(
                    'Extend function must have first argument named "self"',
                    args[0].ref,
                );
            }
            if (args[0].type.kind !== "ref") {
                throwCompilationError(
                    "Extend functions must have a reference type as the first argument",
                    args[0].ref,
                );
            }
            if (args[0].type.optional) {
                throwCompilationError(
                    "Extend functions must have a non-optional type as the first argument",
                    args[0].ref,
                );
            }
            if (!types.has(args[0].type.name)) {
                throwCompilationError(
                    "Type " + args[0].type.name + " not found",
                    args[0].ref,
                );
            }

            // Update self and remove first argument
            self = args[0].type.name;
            args = args.slice(1);
        }

        // Check for mutating and extends
        if (isMutating && !isExtends) {
            throwCompilationError(
                "Mutating functions must be extend functions",
                isMutating.ref,
            );
        }

        // Check argument names
        const exNames = new Set<string>();
        for (const arg of args) {
            if (arg.name === "self") {
                throwCompilationError(
                    'Argument name "self" is reserved',
                    arg.ref,
                );
            }
            if (exNames.has(arg.name)) {
                throwCompilationError(
                    'Argument name "' + arg.name + '" is already used',
                    arg.ref,
                );
            }
            exNames.add(arg.name);
        }

        // Check for runtime types in getters
        if (isGetter) {
            for (const arg of args) {
                if (isRuntimeType(arg.type)) {
                    throwCompilationError(
                        printTypeRef(arg.type) +
                            " is a runtime-only type and can't be used as a getter argument",
                        arg.ref,
                    );
                }
            }
            if (isRuntimeType(returns)) {
                throwCompilationError(
                    printTypeRef(returns) +
                        " is a runtime-only type and can't be used as getter return type",
                    a.ref,
                );
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
            isMutating: !!isMutating || !!optSelf /* && !isGetter */, // Mark all contract functions as mutating
            isGetter: !!isGetter,
            isVirtual: !!isVirtual,
            isOverrides: !!isOverrides,
            isInline: !!isInline,
            isAbstract: !!isAbstract,
        };
    }

    function resolveInitFunction(ast: ASTInitFunction): InitDescription {
        const args: InitArgument[] = [];
        for (const r of ast.args) {
            args.push({
                name: r.name,
                type: buildTypeRef(r.type, types),
                as: null,
                ref: r.ref,
            });
        }

        // Check if runtime types are used
        for (const a of args) {
            if (isRuntimeType(a.type)) {
                throwCompilationError(
                    printTypeRef(a.type) +
                        " is a runtime-only type and can't be used as a init function argument",
                    a.ref,
                );
            }
        }

        return {
            args,
            ast,
        };
    }

    for (const a of ast.types) {
        if (a.kind === "def_contract" || a.kind === "def_trait") {
            const s = types.get(a.name)!;
            for (const d of a.declarations) {
                if (d.kind === "def_function") {
                    const f = resolveFunctionDescriptor(s.name, d, s.origin);
                    if (f.self !== s.name) {
                        throw Error("Function self must be " + s.name); // Impossible
                    }
                    if (s.functions.has(f.name)) {
                        throwCompilationError(
                            `Function "${f.name}" already exists in type "${s.name}"`,
                            s.ast.ref,
                        );
                    }
                    s.functions.set(f.name, f);
                }
                if (d.kind === "def_init_function") {
                    if (s.init) {
                        throwCompilationError(
                            "Init function already exists",
                            d.ref,
                        );
                    }
                    s.init = resolveInitFunction(d);
                }
                if (d.kind === "def_receive") {
                    // Check if externals are enabled
                    if (
                        d.selector.kind.startsWith("external-") &&
                        !enabledExternals(ctx)
                    ) {
                        throwCompilationError(
                            "External functions are not enabled",
                            d.ref,
                        );
                    }

                    if (
                        d.selector.kind === "internal-simple" ||
                        d.selector.kind === "external-simple"
                    ) {
                        const arg = d.selector.arg;
                        const internal = d.selector.kind === "internal-simple";

                        // Check argument type
                        if (arg.type.kind !== "type_ref_simple") {
                            throwCompilationError(
                                "Receive function can only accept message",
                                d.ref,
                            );
                        }
                        if (arg.type.optional) {
                            throwCompilationError(
                                "Receive function cannot have optional argument",
                                d.ref,
                            );
                        }

                        // Check resolved argument type
                        const t = types.get(arg.type.name);
                        if (!t) {
                            throwCompilationError(
                                "Type " + arg.type.name + " not found",
                                d.ref,
                            );
                        }

                        // Raw receiver
                        if (t.kind === "primitive") {
                            if (t.name === "Slice") {
                                // Check for existing receiver
                                if (
                                    s.receivers.find(
                                        (v) =>
                                            v.selector.kind ===
                                            (internal
                                                ? "internal-fallback"
                                                : "external-fallback"),
                                    )
                                ) {
                                    throwCompilationError(
                                        `Fallback receive function already exists`,
                                        d.ref,
                                    );
                                }

                                // Persist receiver
                                s.receivers.push({
                                    selector: {
                                        kind: internal
                                            ? "internal-fallback"
                                            : "external-fallback",
                                        name: arg.name,
                                    },
                                    ast: d,
                                });
                            } else if (t.name === "String") {
                                // Check for existing receiver
                                if (
                                    s.receivers.find(
                                        (v) =>
                                            v.selector.kind ===
                                            (internal
                                                ? "internal-comment-fallback"
                                                : "external-comment-fallback"),
                                    )
                                ) {
                                    throwCompilationError(
                                        "Comment fallback receive function already exists",
                                        d.ref,
                                    );
                                }

                                // Persist receiver
                                s.receivers.push({
                                    selector: {
                                        kind: internal
                                            ? "internal-comment-fallback"
                                            : "external-comment-fallback",
                                        name: arg.name,
                                    },
                                    ast: d,
                                });
                            } else {
                                throwCompilationError(
                                    "Receive function can only accept message, Slice or String",
                                    d.ref,
                                );
                            }
                        } else {
                            // Check type
                            if (t.kind !== "struct") {
                                throwCompilationError(
                                    "Receive function can only accept message",
                                    d.ref,
                                );
                            }
                            if (t.ast.kind !== "def_struct") {
                                throwCompilationError(
                                    "Receive function can only accept message",
                                    d.ref,
                                );
                            }
                            if (!t.ast.message) {
                                throwCompilationError(
                                    "Receive function can only accept message",
                                    d.ref,
                                );
                            }

                            // Check for duplicate
                            const n = arg.type.name;
                            if (
                                s.receivers.find(
                                    (v) =>
                                        v.selector.kind ===
                                            (internal
                                                ? "internal-binary"
                                                : "external-binary") &&
                                        v.selector.name === n,
                                )
                            ) {
                                throwCompilationError(
                                    `Receive function for "${arg.type.name}" already exists`,
                                    d.ref,
                                );
                            }

                            // Persist receiver
                            s.receivers.push({
                                selector: {
                                    kind: internal
                                        ? "internal-binary"
                                        : "external-binary",
                                    name: arg.name,
                                    type: arg.type.name,
                                },
                                ast: d,
                            });
                        }
                    } else if (
                        d.selector.kind === "internal-comment" ||
                        d.selector.kind === "external-comment"
                    ) {
                        const internal = d.selector.kind === "internal-comment";
                        if (d.selector.comment.value === "") {
                            throwCompilationError(
                                "To use empty comment receiver, just remove argument instead of passing empty string",
                                d.ref,
                            );
                        }
                        const c = d.selector.comment.value;
                        if (
                            s.receivers.find(
                                (v) =>
                                    v.selector.kind ===
                                        (internal
                                            ? "internal-comment"
                                            : "external-comment") &&
                                    v.selector.comment === c,
                            )
                        ) {
                            throwCompilationError(
                                `Receive function for "${c}" already exists`,
                                d.ref,
                            );
                        }
                        s.receivers.push({
                            selector: {
                                kind: internal
                                    ? "internal-comment"
                                    : "external-comment",
                                comment: c,
                            },
                            ast: d,
                        });
                    } else if (
                        d.selector.kind === "internal-fallback" ||
                        d.selector.kind === "external-fallback"
                    ) {
                        const internal =
                            d.selector.kind === "internal-fallback";
                        // Handle empty
                        if (
                            s.receivers.find(
                                (v) =>
                                    v.selector.kind ===
                                    (internal
                                        ? "internal-empty"
                                        : "external-empty"),
                            )
                        ) {
                            throwCompilationError(
                                "Empty receive function already exists",
                                d.ref,
                            );
                        }
                        s.receivers.push({
                            selector: {
                                kind: internal
                                    ? "internal-empty"
                                    : "external-empty",
                            },
                            ast: d,
                        });
                    } else if (d.selector.kind === "bounce") {
                        const arg = d.selector.arg;

                        // If argument is a direct reference
                        if (arg.type.kind === "type_ref_simple") {
                            if (arg.type.optional) {
                                throwCompilationError(
                                    "Bounce receive function cannot have optional argument",
                                    d.ref,
                                );
                            }

                            if (arg.type.name === "Slice") {
                                if (
                                    s.receivers.find(
                                        (v) =>
                                            v.selector.kind ===
                                            "bounce-fallback",
                                    )
                                ) {
                                    throwCompilationError(
                                        `Fallback bounce receive function already exists`,
                                        d.ref,
                                    );
                                }

                                s.receivers.push({
                                    selector: {
                                        kind: "bounce-fallback",
                                        name: arg.name,
                                    },
                                    ast: d,
                                });
                            } else {
                                const type = types.get(arg.type.name)!;
                                if (
                                    type.ast.kind !== "def_struct" ||
                                    !type.ast.message
                                ) {
                                    throwCompilationError(
                                        "Bounce receive function can only accept bounced message, message or Slice",
                                        d.ref,
                                    );
                                }
                                if (
                                    type.fields.length !==
                                    type.partialFieldCount
                                ) {
                                    throwCompilationError(
                                        "This message is too big for bounce receiver, you need to wrap it to a bounced<" +
                                            arg.type.name +
                                            ">.",
                                        d.ref,
                                    );
                                }
                                if (
                                    s.receivers.find(
                                        (v) =>
                                            v.selector.kind ===
                                                "bounce-binary" &&
                                            v.selector.name === type.name,
                                    )
                                ) {
                                    throwCompilationError(
                                        `Bounce receive function for "${arg.type.name}" already exists`,
                                        d.ref,
                                    );
                                }
                                s.receivers.push({
                                    selector: {
                                        kind: "bounce-binary",
                                        name: arg.name,
                                        type: arg.type.name,
                                        bounced: false,
                                    },
                                    ast: d,
                                });
                            }
                        } else if (arg.type.kind === "type_ref_bounced") {
                            const t = types.get(arg.type.name)!;
                            if (t.kind !== "struct") {
                                throwCompilationError(
                                    "Bounce receive function can only accept bounced<T> struct types",
                                    d.ref,
                                );
                            }
                            if (t.ast.kind !== "def_struct") {
                                throwCompilationError(
                                    "Bounce receive function can only accept bounced<T> struct types",
                                    d.ref,
                                );
                            }
                            if (!t.ast.message) {
                                throwCompilationError(
                                    "Bounce receive function can only accept bounced message, message or Slice",
                                    d.ref,
                                );
                            }
                            if (
                                s.receivers.find(
                                    (v) =>
                                        v.selector.kind === "bounce-binary" &&
                                        v.selector.type === t.name,
                                )
                            ) {
                                throwCompilationError(
                                    `Bounce receive function for "${t.name}" already exists`,
                                    d.ref,
                                );
                            }
                            if (t.fields.length === t.partialFieldCount) {
                                throwCompilationError(
                                    "This message is small enough for bounce receiver, you need to remove bounced modifier.",
                                    d.ref,
                                );
                            }
                            s.receivers.push({
                                selector: {
                                    kind: "bounce-binary",
                                    name: arg.name,
                                    type: arg.type.name,
                                    bounced: true,
                                },
                                ast: d,
                            });
                        } else {
                            throwCompilationError(
                                "Bounce receive function can only accept bounced<T> struct args or Slice",
                                d.ref,
                            );
                        }
                    } else {
                        throwCompilationError(
                            "Invalid receive function selector",
                            d.ref,
                        );
                    }
                }
            }
        }
    }

    //
    // Check for missing init methods
    //

    for (const t of types.values()) {
        if (t.kind === "contract") {
            if (!t.init) {
                t.init = {
                    args: [],
                    ast: createNode({
                        kind: "def_init_function",
                        args: [],
                        statements: [],
                        ref: t.ast.ref,
                    }) as ASTInitFunction,
                };
            }
        }
    }

    //
    // Flatten and resolve traits
    //

    for (const t of types.values()) {
        if (t.ast.kind === "def_trait" || t.ast.kind === "def_contract") {
            // Flatten traits
            const traits: TypeDescription[] = [];
            const visited = new Set<string>();
            visited.add(t.name);
            // eslint-disable-next-line no-inner-declarations
            function visit(name: string) {
                if (visited.has(name)) {
                    return;
                }
                const tt = types.get(name);
                if (!tt) {
                    throwCompilationError(
                        "Trait " + name + " not found",
                        t.ast.ref,
                    );
                }
                visited.add(name);
                traits.push(tt);
                if (tt.ast.kind === "def_trait") {
                    for (const s of tt.ast.traits) {
                        visit(s.value);
                    }
                    for (const f of tt.traits) {
                        visit(f.name);
                    }
                } else {
                    throwCompilationError(
                        "Type " + name + " is not a trait",
                        t.ast.ref,
                    );
                }
            }
            visit("BaseTrait");
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

    for (const t of types.values()) {
        for (const tr of t.traits) {
            // Check that trait is valid
            if (!types.has(tr.name)) {
                throwCompilationError(
                    "Trait " + tr.name + " not found",
                    t.ast.ref,
                );
            }
            if (types.get(tr.name)!.kind !== "trait") {
                throwCompilationError(
                    "Type " + tr.name + " is not a trait",
                    t.ast.ref,
                );
            }

            // Check that trait has all required fields
            const ttr = types.get(tr.name)!;
            for (const f of ttr.fields) {
                // Check if field exists
                const ex = t.fields.find((v) => v.name === f.name);
                if (!ex) {
                    throwCompilationError(
                        `Trait "${tr.name}" requires field "${f.name}"`,
                        t.ast.ref,
                    );
                }

                // Check type
                if (!typeRefEquals(f.type, ex.type)) {
                    throwCompilationError(
                        `Trait "${tr.name}" requires field "${f.name}" of type "${printTypeRef(f.type)}"`,
                        t.ast.ref,
                    );
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
                    throwCompilationError(
                        `Trait "${tr.name}" requires function "${f.name}"`,
                        t.ast.ref,
                    );
                }

                // Check overrides
                if (ex && ex.isOverrides) {
                    if (f.isGetter) {
                        throwCompilationError(
                            `Overridden function "${f.name}" can not be a getter`,
                            ex.ast.ref,
                        );
                    }
                    if (f.isMutating !== ex.isMutating) {
                        throwCompilationError(
                            `Overridden function "${f.name}" should have same mutability`,
                            ex.ast.ref,
                        );
                    }
                    if (!typeRefEquals(f.returns, ex.returns)) {
                        throwCompilationError(
                            `Overridden function "${f.name}" should have same return type`,
                            ex.ast.ref,
                        );
                    }
                    if (f.args.length !== ex.args.length) {
                        throwCompilationError(
                            `Overridden function "${f.name}" should have same number of arguments`,
                            ex.ast.ref,
                        );
                    }
                    for (let i = 0; i < f.args.length; i++) {
                        const a = ex.args[i];
                        const b = f.args[i];
                        if (!typeRefEquals(a.type, b.type)) {
                            throwCompilationError(
                                `Overridden function "${f.name}" should have same argument types`,
                                ex.ast.ref,
                            );
                        }
                    }
                    continue; // Ignore overridden functions
                }

                // Check duplicates
                if (ex) {
                    throwCompilationError(
                        `Function "${f.name}" already exist in "${t.name}"`,
                        t.ast.ref,
                    );
                }

                // Register function
                t.functions.set(f.name, {
                    ...f,
                    self: t.name,
                    ast: cloneNode(f.ast),
                });
            }

            // Copy constants
            for (const f of tr.constants) {
                const ex = t.constants.find((v) => v.name === f.name);
                if (
                    !ex &&
                    f.ast.attributes.find((v) => v.type === "abstract")
                ) {
                    throwCompilationError(
                        `Trait "${tr.name}" requires constant "${f.name}"`,
                        t.ast.ref,
                    );
                }

                // Check overrides
                if (
                    ex &&
                    ex.ast.attributes.find((v) => v.type === "overrides")
                ) {
                    if (!typeRefEquals(f.type, ex.type)) {
                        throwCompilationError(
                            `Overridden constant "${f.name}" should have same type`,
                            ex.ast.ref,
                        );
                    }
                    continue;
                }

                // Check duplicates
                if (ex) {
                    throwCompilationError(
                        `Constant "${f.name}" already exist in "${t.name}"`,
                        t.ast.ref,
                    );
                }

                // Register constant
                t.constants.push({
                    ...f,
                    ast: cloneNode(f.ast),
                });
            }

            // Copy receivers
            for (const f of tr.receivers) {
                // eslint-disable-next-line no-inner-declarations
                function sameReceiver(
                    a: ReceiverSelector,
                    b: ReceiverSelector,
                ) {
                    if (
                        a.kind === "internal-comment" &&
                        b.kind === "internal-comment"
                    ) {
                        return a.comment === b.comment;
                    }
                    if (
                        a.kind === "internal-binary" &&
                        b.kind === "internal-binary"
                    ) {
                        return a.type === b.type;
                    }
                    if (
                        a.kind === "bounce-fallback" &&
                        b.kind === "bounce-fallback"
                    ) {
                        return true; // Could be only one
                    }
                    if (
                        a.kind === "bounce-binary" &&
                        b.kind === "bounce-binary"
                    ) {
                        return a.type === b.type;
                    }
                    if (
                        a.kind === "internal-empty" &&
                        b.kind === "internal-empty"
                    ) {
                        return true;
                    }
                    if (
                        a.kind === "internal-fallback" &&
                        b.kind === "internal-fallback"
                    ) {
                        return true;
                    }
                    if (
                        a.kind === "internal-comment-fallback" &&
                        b.kind === "internal-comment-fallback"
                    ) {
                        return true;
                    }
                    return false;
                }
                if (
                    t.receivers.find((v) =>
                        sameReceiver(v.selector, f.selector),
                    )
                ) {
                    throwCompilationError(
                        `Receive function for "${f.selector}" already exists`,
                        t.ast.ref,
                    );
                }
                t.receivers.push({
                    selector: f.selector,
                    ast: cloneNode(f.ast),
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
            throwCompilationError(
                `Circular dependency detected for type "${name}"`,
                types.get(name)!.ast.ref,
            );
        }
        processing.has(name);

        // Process dependencies first
        const dependencies = Array.from(types.values()).filter((v) =>
            v.traits.find((v2) => v2.name === name),
        );
        for (const d of dependencies) {
            processType(d.name);
        }

        // Copy traits
        copyTraits(types.get(name)!);

        // Mark as processed
        processed.add(name);
        processing.delete(name);
    }
    for (const k of types.keys()) {
        processType(k);
    }

    //
    // Register dependencies
    //

    for (const [k, t] of types) {
        const dependsOn = new Set<string>();
        const handler = (src: ASTNode) => {
            if (src.kind === "init_of") {
                if (!types.has(src.name)) {
                    throwCompilationError(
                        `Type "${src.name}" not found`,
                        src.ref,
                    );
                }
                dependsOn.add(src.name);
            }
        };

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
                t.dependsOn.push(types.get(s)!);
            }
        }
    }

    //
    // Register transient dependencies
    //

    function collectTransient(name: string, to: Set<string>) {
        const t = types.get(name)!;
        for (const d of t.dependsOn) {
            if (to.has(d.name)) {
                continue;
            }
            to.add(d.name);
            collectTransient(d.name, to);
        }
    }
    for (const k of types.keys()) {
        const dependsOn = new Set<string>();
        dependsOn.add(k);
        collectTransient(k, dependsOn);
        for (const s of dependsOn) {
            if (s !== k && !types.get(k)!.dependsOn.find((v) => v.name === s)) {
                types.get(k)!.dependsOn.push(types.get(s)!);
            }
        }
    }

    //
    // Resolve static functions
    //

    for (const a of ast.functions) {
        const r = resolveFunctionDescriptor(null, a, a.origin);
        if (r.self) {
            if (types.get(r.self)!.functions.has(r.name)) {
                throwCompilationError(
                    `Function "${r.name}" already exists in type "${r.self}"`,
                    r.ast.ref,
                );
            }
            types.get(r.self)!.functions.set(r.name, r);
        } else {
            if (staticFunctions.has(r.name) || GlobalFunctions.has(r.name)) {
                throwCompilationError(
                    `Static function "${r.name}" already exists`,
                    r.ast.ref,
                );
            }
            if (staticConstants.has(r.name)) {
                throwCompilationError(
                    `Static constant "${r.name}" already exists`,
                    a.ref,
                );
            }
            staticFunctions.set(r.name, r);
        }
    }

    //
    // Resolve static constants
    //

    for (const a of ast.constants) {
        if (staticConstants.has(a.name)) {
            throwCompilationError(
                `Static constant "${a.name}" already exists`,
                a.ref,
            );
        }
        if (staticFunctions.has(a.name) || GlobalFunctions.has(a.name)) {
            throwCompilationError(
                `Static function "${a.name}" already exists`,
                a.ref,
            );
        }
        staticConstants.set(a.name, buildConstantDescription(a));
    }

    //
    // Register types and functions in context
    //

    for (const [k, t] of types) {
        ctx = store.set(ctx, k, t);
    }
    for (const [k, t] of staticFunctions) {
        ctx = staticFunctionsStore.set(ctx, k, t);
    }
    for (const [k, t] of staticConstants) {
        ctx = staticConstantsStore.set(ctx, k, t);
    }

    return ctx;
}

export function getType(ctx: CompilerContext, name: string): TypeDescription {
    const r = store.get(ctx, name);
    if (!r) {
        throw Error("Type " + name + " not found");
    }
    return r;
}

export function getAllTypes(ctx: CompilerContext) {
    return store.all(ctx);
}

export function getContracts(ctx: CompilerContext) {
    return Object.values(getAllTypes(ctx))
        .filter((v) => v.kind === "contract")
        .map((v) => v.name);
}

export function getStaticFunction(
    ctx: CompilerContext,
    name: string,
): FunctionDescription {
    const r = staticFunctionsStore.get(ctx, name);
    if (!r) {
        throw Error("Static function " + name + " not found");
    }
    return r;
}

export function hasStaticFunction(ctx: CompilerContext, name: string) {
    return !!staticFunctionsStore.get(ctx, name);
}

export function getStaticConstant(
    ctx: CompilerContext,
    name: string,
): ConstantDescription {
    const r = staticConstantsStore.get(ctx, name);
    if (!r) {
        throw Error("Static constant " + name + " not found");
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

export function resolvePartialFields(
    ctx: CompilerContext,
    type: TypeDescription,
) {
    if (type.kind !== "struct") return 0;

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
