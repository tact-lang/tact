import {
    AstConstantDef,
    AstFieldDecl,
    ASTInitFunction,
    AstNativeFunctionDecl,
    ASTNode,
    SrcInfo,
    ASTTypeRef,
    createNode,
    traverse,
    idText,
    AstId,
    eqNames,
    AstFunctionDef,
    isSelfId,
    isSlice,
    AstFunctionDecl,
    AstConstantDecl,
} from "../grammar/ast";
import { idTextErr, throwCompilationError } from "../errors";
import { CompilerContext, createContextStore } from "../context";
import {
    ConstantDescription,
    FieldDescription,
    FunctionParameter,
    FunctionDescription,
    InitParameter,
    InitDescription,
    printTypeRef,
    ReceiverSelector,
    receiverSelectorName,
    TypeDescription,
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
import { ItemOrigin } from "../grammar/grammar";

const store = createContextStore<TypeDescription>();
const staticFunctionsStore = createContextStore<FunctionDescription>();
const staticConstantsStore = createContextStore<ConstantDescription>();

function verifyMapType(
    key: string,
    keyAs: AstId | null,
    value: string,
    valueAs: AstId | null,
    loc: SrcInfo,
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
                ].includes(idText(keyAs))
            ) {
                throwCompilationError("Invalid key type for map", loc);
            }
        } else {
            throwCompilationError("Invalid key type for map", loc);
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
                ].includes(idText(valueAs))
            ) {
                throwCompilationError("Invalid value type for map", loc);
            }
        } else {
            throwCompilationError("Invalid value type for map", loc);
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
        verifyMapType(k, src.keyAs, v, src.valueAs, src.loc);
        return {
            kind: "map",
            key: k,
            keyAs: src.keyAs !== null ? idText(src.keyAs) : null,
            value: v,
            valueAs: src.valueAs !== null ? idText(src.valueAs) : null,
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
        if (!types.has(idText(src.name))) {
            throwCompilationError(
                `Type ${idTextErr(src.name)} not found`,
                src.loc,
            );
        }
        return {
            kind: "ref",
            name: idText(src.name),
            optional: src.optional,
        };
    }
    if (src.kind === "type_ref_map") {
        if (!types.has(idText(src.key))) {
            throwCompilationError(
                `Type ${idTextErr(src.key)} not found`,
                src.loc,
            );
        }
        if (!types.has(idText(src.value))) {
            throwCompilationError(
                `Type ${idTextErr(src.value)} not found`,
                src.loc,
            );
        }
        return {
            kind: "map",
            key: idText(src.key),
            keyAs: src.keyAs !== null ? idText(src.keyAs) : null,
            value: idText(src.value),
            valueAs: src.valueAs !== null ? idText(src.valueAs) : null,
        };
    }
    if (src.kind === "type_ref_bounced") {
        return {
            kind: "ref_bounced",
            name: idText(src.name),
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
        if (types.has(idText(a.name))) {
            throwCompilationError(
                `Type "${idText(a.name)}" already exists`,
                a.loc,
            );
        }

        const uid = uidForName(idText(a.name), types);

        if (a.kind === "primitive_type_decl") {
            types.set(idText(a.name), {
                kind: "primitive_type_decl",
                origin: a.loc.origin,
                name: idText(a.name),
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
        } else if (a.kind === "contract") {
            types.set(idText(a.name), {
                kind: "contract",
                origin: a.loc.origin,
                name: idText(a.name),
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
        } else if (a.kind === "struct_decl" || a.kind === "message_decl") {
            types.set(idText(a.name), {
                kind: "struct",
                origin: a.loc.origin,
                name: idText(a.name),
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
        } else if (a.kind === "trait") {
            types.set(idText(a.name), {
                kind: "trait",
                origin: a.loc.origin,
                name: idText(a.name),
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
        src: AstFieldDecl,
        index: number,
    ): FieldDescription {
        const tr = buildTypeRef(src.type, types);

        // Check if field is runtime type
        if (isRuntimeType(tr)) {
            throwCompilationError(
                printTypeRef(tr) +
                    " is a runtime only type and can't be used as field",
                src.loc,
            );
        }

        const d = src.init ? evalConstantExpression(src.init, ctx) : undefined;

        // Resolve abi type
        const type = resolveABIType(src);

        return {
            name: idText(src.name),
            type: tr,
            index,
            as: src.as !== null ? idText(src.as) : null,
            default: d,
            loc: src.loc,
            ast: src,
            abi: { name: idText(src.name), type },
        };
    }

    function buildConstantDescription(
        src: AstConstantDef | AstConstantDecl,
    ): ConstantDescription {
        const tr = buildTypeRef(src.type, types);
        const d =
            src.kind === "constant_def"
                ? evalConstantExpression(src.initializer, ctx)
                : undefined;
        return {
            name: idText(src.name),
            type: tr,
            value: d,
            loc: src.loc,
            ast: src,
        };
    }

    for (const a of ast.types) {
        // Contract
        if (a.kind === "contract") {
            for (const f of a.declarations) {
                if (f.kind === "field_decl") {
                    if (
                        types
                            .get(idText(a.name))!
                            .fields.find((v) => eqNames(v.name, f.name))
                    ) {
                        throwCompilationError(
                            `Field ${idTextErr(f.name)} already exists`,
                            f.loc,
                        );
                    }
                    if (
                        types
                            .get(idText(a.name))!
                            .constants.find((v) => eqNames(v.name, f.name))
                    ) {
                        throwCompilationError(
                            `Constant ${idText(f.name)} already exists`,
                            f.loc,
                        );
                    }
                    types
                        .get(idText(a.name))!
                        .fields.push(
                            buildFieldDescription(
                                f,
                                types.get(idText(a.name))!.fields.length,
                            ),
                        );
                } else if (f.kind === "constant_def") {
                    if (
                        types
                            .get(idText(a.name))!
                            .fields.find((v) => eqNames(v.name, f.name))
                    ) {
                        throwCompilationError(
                            `Field ${idTextErr(f.name)} already exists`,
                            f.loc,
                        );
                    }
                    if (
                        types
                            .get(idText(a.name))!
                            .constants.find((v) => eqNames(v.name, f.name))
                    ) {
                        throwCompilationError(
                            `Constant ${idTextErr(f.name)} already exists`,
                            f.loc,
                        );
                    }
                    if (f.attributes.find((v) => v.type !== "overrides")) {
                        throwCompilationError(
                            `Constant can be only overridden`,
                            f.loc,
                        );
                    }
                    types
                        .get(idText(a.name))!
                        .constants.push(buildConstantDescription(f));
                }
            }
        }

        // Struct
        if (a.kind === "struct_decl" || a.kind === "message_decl") {
            for (const f of a.fields) {
                if (
                    types
                        .get(idText(a.name))!
                        .fields.find((v) => eqNames(v.name, f.name))
                ) {
                    throwCompilationError(
                        `Field ${idTextErr(f.name)} already exists`,
                        f.loc,
                    );
                }
                types
                    .get(idText(a.name))!
                    .fields.push(
                        buildFieldDescription(
                            f,
                            types.get(idText(a.name))!.fields.length,
                        ),
                    );
            }
            if (a.fields.length === 0 && a.kind === "struct_decl") {
                throwCompilationError(
                    `Struct ${idTextErr(a.name)} must have at least one field`,
                    a.loc,
                );
            }
        }

        // Trait
        if (a.kind === "trait") {
            for (const f of a.declarations) {
                if (f.kind === "field_decl") {
                    if (
                        types
                            .get(idText(a.name))!
                            .fields.find((v) => eqNames(v.name, f.name))
                    ) {
                        throwCompilationError(
                            `Field ${idTextErr(f.name)} already exists`,
                            f.loc,
                        );
                    }
                    if (f.as) {
                        throwCompilationError(
                            `Trait field cannot have serialization specifier`,
                            f.loc,
                        );
                    }
                    types
                        .get(idText(a.name))!
                        .fields.push(
                            buildFieldDescription(
                                f,
                                types.get(idText(a.name))!.fields.length,
                            ),
                        );
                } else if (
                    f.kind === "constant_def" ||
                    f.kind === "constant_decl"
                ) {
                    if (
                        types
                            .get(idText(a.name))!
                            .fields.find((v) => eqNames(v.name, f.name))
                    ) {
                        throwCompilationError(
                            `Field ${idTextErr(f.name)} already exists`,
                            f.loc,
                        );
                    }
                    if (
                        types
                            .get(idText(a.name))!
                            .constants.find((v) => eqNames(v.name, f.name))
                    ) {
                        throwCompilationError(
                            `Constant ${idTextErr(f.name)} already exists`,
                            f.loc,
                        );
                    }
                    if (f.attributes.find((v) => v.type === "overrides")) {
                        throwCompilationError(
                            `Trait constant cannot be overridden`,
                            f.loc,
                        );
                    }
                    types
                        .get(idText(a.name))!
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
        a: AstFunctionDef | AstNativeFunctionDecl | AstFunctionDecl,
        origin: ItemOrigin,
    ): FunctionDescription {
        let self = optSelf;

        // Resolve return
        let returns: TypeRef = { kind: "void" };
        if (a.return) {
            returns = buildTypeRef(a.return, types);
        }

        let params: FunctionParameter[] = [];
        for (const r of a.params) {
            params.push({
                name: r.name,
                type: buildTypeRef(r.type, types),
                loc: r.loc,
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
        if (a.kind === "native_function_decl") {
            if (isGetter) {
                throwCompilationError(
                    "Native functions cannot be getters",
                    isGetter.loc,
                );
            }
            if (self) {
                throwCompilationError(
                    "Native functions cannot be declared within a contract",
                    a.loc,
                );
            }
            if (isVirtual) {
                throwCompilationError(
                    "Native functions cannot be virtual",
                    isVirtual.loc,
                );
            }
            if (isOverrides) {
                throwCompilationError(
                    "Native functions cannot be overrides",
                    isOverrides.loc,
                );
            }
        }

        // Check virtual and overrides
        if (isVirtual && isExtends) {
            throwCompilationError(
                "Extend functions cannot be virtual",
                isVirtual.loc,
            );
        }
        if (isOverrides && isExtends) {
            throwCompilationError(
                "Extend functions cannot be overrides",
                isOverrides.loc,
            );
        }
        if (isAbstract && isExtends) {
            throwCompilationError(
                "Extend functions cannot be abstract",
                isAbstract.loc,
            );
        }
        if (!self && isVirtual) {
            throwCompilationError(
                "Virtual functions must be defined within a contract or a trait",
                isVirtual.loc,
            );
        }
        if (!self && isOverrides) {
            throwCompilationError(
                "Overrides functions must be defined within a contract or a trait",
                isOverrides.loc,
            );
        }
        if (!self && isAbstract) {
            throwCompilationError(
                "Abstract functions must be defined within a trait",
                isAbstract.loc,
            );
        }
        if (isVirtual && isAbstract) {
            throwCompilationError(
                "Abstract functions cannot be virtual",
                isAbstract.loc,
            );
        }
        if (isVirtual && isOverrides) {
            throwCompilationError(
                "Overrides functions cannot be virtual",
                isOverrides.loc,
            );
        }
        if (isAbstract && isOverrides) {
            throwCompilationError(
                "Overrides functions cannot be abstract",
                isOverrides.loc,
            );
        }

        // Check virtual
        if (isVirtual) {
            const t = types.get(self!)!;
            if (t.kind !== "trait") {
                throwCompilationError(
                    "Virtual functions must be defined within a trait",
                    isVirtual.loc,
                );
            }
        }

        // Check abstract
        if (isAbstract) {
            const t = types.get(self!)!;
            if (t.kind !== "trait") {
                throwCompilationError(
                    "Abstract functions must be defined within a trait",
                    isAbstract.loc,
                );
            }
        }

        // Check overrides
        if (isOverrides) {
            const t = types.get(self!)!;
            if (t.kind !== "contract") {
                throwCompilationError(
                    "Overrides functions must be defined within a contract",
                    isOverrides.loc,
                );
            }
        }

        // Check for common
        if (a.kind === "function_def") {
            if (isGetter && !self) {
                throwCompilationError(
                    "Getters must be defined within a contract",
                    isGetter.loc,
                );
            }
        }

        // Check for getter
        if (isInline && isGetter) {
            throwCompilationError("Getters cannot be inline", isInline.loc);
        }

        // Validate mutating
        if (isExtends) {
            if (self) {
                throwCompilationError(
                    "Extend functions cannot be defined within a contract",
                    isExtends.loc,
                );
            }
            if (params.length === 0) {
                throwCompilationError(
                    "Extend functions must have at least one parameter",
                    isExtends.loc,
                );
            }
            if (!isSelfId(params[0].name)) {
                throwCompilationError(
                    'Extend function must have first parameter named "self"',
                    params[0].loc,
                );
            }
            if (params[0].type.kind !== "ref") {
                throwCompilationError(
                    "Extend functions must have a reference type as the first parameter",
                    params[0].loc,
                );
            }
            if (params[0].type.optional) {
                throwCompilationError(
                    "Extend functions must have a non-optional type as the first parameter",
                    params[0].loc,
                );
            }
            if (!types.has(params[0].type.name)) {
                throwCompilationError(
                    "Type " + params[0].type.name + " not found",
                    params[0].loc,
                );
            }

            // Update self and remove first parameter
            self = params[0].type.name;
            params = params.slice(1);
        }

        // Check for mutating and extends
        if (isMutating && !isExtends) {
            throwCompilationError(
                "Mutating functions must be extend functions",
                isMutating.loc,
            );
        }

        // Check parameter names
        const exNames = new Set<string>();
        for (const param of params) {
            if (isSelfId(param.name)) {
                throwCompilationError(
                    'Parameter name "self" is reserved',
                    param.loc,
                );
            }
            if (exNames.has(idText(param.name))) {
                throwCompilationError(
                    `Parameter name ${idTextErr(param.name)} is already used`,
                    param.loc,
                );
            }
            exNames.add(idText(param.name));
        }

        // Check for runtime types in getters
        if (isGetter) {
            for (const param of params) {
                if (isRuntimeType(param.type)) {
                    throwCompilationError(
                        printTypeRef(param.type) +
                            " is a runtime-only type and can't be used as a getter parameter",
                        param.loc,
                    );
                }
            }
            if (isRuntimeType(returns)) {
                throwCompilationError(
                    printTypeRef(returns) +
                        " is a runtime-only type and can't be used as getter return type",
                    a.loc,
                );
            }
        }

        // Register function
        return {
            name: idText(a.name),
            self: self,
            origin,
            params,
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
        const params: InitParameter[] = [];
        for (const r of ast.params) {
            params.push({
                name: r.name,
                type: buildTypeRef(r.type, types),
                as: null,
                loc: r.loc,
            });
        }

        // Check if runtime types are used
        for (const a of params) {
            if (isRuntimeType(a.type)) {
                throwCompilationError(
                    printTypeRef(a.type) +
                        " is a runtime-only type and can't be used as a init function parameter",
                    a.loc,
                );
            }
        }

        return {
            params,
            ast,
        };
    }

    for (const a of ast.types) {
        if (a.kind === "contract" || a.kind === "trait") {
            const s = types.get(idText(a.name))!;
            for (const d of a.declarations) {
                if (d.kind === "function_def" || d.kind === "function_decl") {
                    const f = resolveFunctionDescriptor(s.name, d, s.origin);
                    if (f.self !== s.name) {
                        throw Error("Function self must be " + s.name); // Impossible
                    }
                    if (s.functions.has(f.name)) {
                        throwCompilationError(
                            `Function "${f.name}" already exists in type "${s.name}"`,
                            s.ast.loc,
                        );
                    }
                    s.functions.set(f.name, f);
                }
                if (d.kind === "def_init_function") {
                    if (s.init) {
                        throwCompilationError(
                            "Init function already exists",
                            d.loc,
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
                            d.loc,
                        );
                    }

                    if (
                        d.selector.kind === "internal-simple" ||
                        d.selector.kind === "external-simple"
                    ) {
                        const param = d.selector.param;
                        const internal = d.selector.kind === "internal-simple";

                        if (param.type.kind !== "type_ref_simple") {
                            throwCompilationError(
                                "Receive function can only accept message",
                                d.loc,
                            );
                        }
                        if (param.type.optional) {
                            throwCompilationError(
                                "Receive function cannot have optional parameter",
                                d.loc,
                            );
                        }

                        const t = types.get(idText(param.type.name));
                        if (!t) {
                            throwCompilationError(
                                `Type ${idTextErr(param.type.name)} not found`,
                                d.loc,
                            );
                        }

                        // Raw receiver
                        if (t.kind === "primitive_type_decl") {
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
                                        d.loc,
                                    );
                                }

                                // Persist receiver
                                s.receivers.push({
                                    selector: {
                                        kind: internal
                                            ? "internal-fallback"
                                            : "external-fallback",
                                        name: param.name,
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
                                        d.loc,
                                    );
                                }

                                // Persist receiver
                                s.receivers.push({
                                    selector: {
                                        kind: internal
                                            ? "internal-comment-fallback"
                                            : "external-comment-fallback",
                                        name: param.name,
                                    },
                                    ast: d,
                                });
                            } else {
                                throwCompilationError(
                                    "Receive function can only accept message, Slice or String",
                                    d.loc,
                                );
                            }
                        } else {
                            // Check type
                            if (t.kind !== "struct") {
                                throwCompilationError(
                                    "Receive function can only accept message",
                                    d.loc,
                                );
                            }
                            if (t.ast.kind !== "message_decl") {
                                throwCompilationError(
                                    "Receive function can only accept message",
                                    d.loc,
                                );
                            }

                            // Check for duplicate
                            const n = param.type.name;
                            if (
                                s.receivers.find(
                                    (v) =>
                                        v.selector.kind ===
                                            (internal
                                                ? "internal-binary"
                                                : "external-binary") &&
                                        eqNames(v.selector.type, n),
                                )
                            ) {
                                throwCompilationError(
                                    `Receive function for ${idTextErr(param.type.name)} already exists`,
                                    param.loc,
                                );
                            }

                            // Persist receiver
                            s.receivers.push({
                                selector: {
                                    kind: internal
                                        ? "internal-binary"
                                        : "external-binary",
                                    name: param.name,
                                    type: idText(param.type.name),
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
                                "To use empty comment receiver, just remove parameter instead of passing empty string",
                                d.loc,
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
                                `Receive function for ${idTextErr(c)} already exists`,
                                d.loc,
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
                                d.loc,
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
                        const param = d.selector.param;

                        if (param.type.kind === "type_ref_simple") {
                            if (param.type.optional) {
                                throwCompilationError(
                                    "Bounce receive function cannot have optional parameter",
                                    d.loc,
                                );
                            }

                            if (isSlice(param.type.name)) {
                                if (
                                    s.receivers.find(
                                        (v) =>
                                            v.selector.kind ===
                                            "bounce-fallback",
                                    )
                                ) {
                                    throwCompilationError(
                                        `Fallback bounce receive function already exists`,
                                        d.loc,
                                    );
                                }

                                s.receivers.push({
                                    selector: {
                                        kind: "bounce-fallback",
                                        name: param.name,
                                    },
                                    ast: d,
                                });
                            } else {
                                const type = types.get(
                                    idText(param.type.name),
                                )!;
                                if (type.ast.kind !== "message_decl") {
                                    throwCompilationError(
                                        "Bounce receive function can only accept bounced message, message or Slice",
                                        d.loc,
                                    );
                                }
                                if (
                                    type.fields.length !==
                                    type.partialFieldCount
                                ) {
                                    throwCompilationError(
                                        `This message is too big for bounce receiver, you need to wrap it to a bounced<${idTextErr(param.type.name)}>.`,
                                        d.loc,
                                    );
                                }
                                if (
                                    s.receivers.find(
                                        (v) =>
                                            v.selector.kind ===
                                                "bounce-binary" &&
                                            v.selector.type === type.name,
                                    )
                                ) {
                                    throwCompilationError(
                                        `Bounce receive function for ${idTextErr(param.type.name)} already exists`,
                                        param.loc,
                                    );
                                }
                                s.receivers.push({
                                    selector: {
                                        kind: "bounce-binary",
                                        name: param.name,
                                        type: idText(param.type.name),
                                        bounced: false,
                                    },
                                    ast: d,
                                });
                            }
                        } else if (param.type.kind === "type_ref_bounced") {
                            const t = types.get(idText(param.type.name))!;
                            if (t.kind !== "struct") {
                                throwCompilationError(
                                    "Bounce receive function can only accept bounced<T> struct types",
                                    d.loc,
                                );
                            }
                            if (t.ast.kind !== "message_decl") {
                                throwCompilationError(
                                    "Bounce receive function can only accept bounced<T> message types",
                                    d.loc,
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
                                    `Bounce receive function for ${idTextErr(t.name)} already exists`,
                                    d.loc,
                                );
                            }
                            if (t.fields.length === t.partialFieldCount) {
                                throwCompilationError(
                                    "This message is small enough for bounce receiver, you need to remove bounced modifier.",
                                    d.loc,
                                );
                            }
                            s.receivers.push({
                                selector: {
                                    kind: "bounce-binary",
                                    name: param.name,
                                    type: idText(param.type.name),
                                    bounced: true,
                                },
                                ast: d,
                            });
                        } else {
                            throwCompilationError(
                                "Bounce receive function can only accept bounced<T> struct parameters or Slice",
                                d.loc,
                            );
                        }
                    } else {
                        throwCompilationError(
                            "Invalid receive function selector",
                            d.loc,
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
                    params: [],
                    ast: createNode({
                        kind: "def_init_function",
                        params: [],
                        statements: [],
                        loc: t.ast.loc,
                    }) as ASTInitFunction,
                };
            }
        }
    }

    //
    // Flatten and resolve traits
    //

    for (const t of types.values()) {
        if (t.ast.kind === "trait" || t.ast.kind === "contract") {
            // Check there are no duplicates in the _immediately_ inherited traits
            const traitSet = new Set<string>(t.ast.traits.map(idText));
            if (traitSet.size !== t.ast.traits.length) {
                const aggregateType =
                    t.ast.kind === "contract" ? "contract" : "trait";
                throwCompilationError(
                    `The list of inherited traits for ${aggregateType} "${t.name}" has duplicates`,
                    t.ast.loc,
                );
            }
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
                        t.ast.loc,
                    );
                }
                visited.add(name);
                traits.push(tt);
                if (tt.ast.kind === "trait") {
                    for (const s of tt.ast.traits) {
                        visit(idText(s));
                    }
                    for (const f of tt.traits) {
                        visit(f.name);
                    }
                } else {
                    throwCompilationError(
                        "Type " + name + " is not a trait",
                        t.ast.loc,
                    );
                }
            }
            visit("BaseTrait");
            for (const s of t.ast.traits) {
                visit(idText(s));
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
                    t.ast.loc,
                );
            }
            if (types.get(tr.name)!.kind !== "trait") {
                throwCompilationError(
                    "Type " + tr.name + " is not a trait",
                    t.ast.loc,
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
                        t.ast.loc,
                    );
                }

                // Check type
                if (!typeRefEquals(f.type, ex.type)) {
                    throwCompilationError(
                        `Trait "${tr.name}" requires field "${f.name}" of type "${printTypeRef(f.type)}"`,
                        t.ast.loc,
                    );
                }
            }
        }
    }

    //
    // Copy Trait functions and constants
    //

    function copyTraits(contractOrTrait: TypeDescription) {
        for (const inheritedTrait of contractOrTrait.traits) {
            // Copy functions
            for (const traitFunction of inheritedTrait.functions.values()) {
                const funInContractOrTrait = contractOrTrait.functions.get(
                    traitFunction.name,
                );
                if (!funInContractOrTrait && traitFunction.isAbstract) {
                    throwCompilationError(
                        `Trait "${inheritedTrait.name}" requires function "${traitFunction.name}"`,
                        contractOrTrait.ast.loc,
                    );
                }

                // Check overrides
                if (funInContractOrTrait && funInContractOrTrait.isOverrides) {
                    if (
                        traitFunction.isGetter &&
                        !funInContractOrTrait.isGetter
                    ) {
                        throwCompilationError(
                            `Overridden function "${traitFunction.name}" must be a getter`,
                            funInContractOrTrait.ast.loc,
                        );
                    }
                    if (
                        traitFunction.isMutating !==
                        funInContractOrTrait.isMutating
                    ) {
                        throwCompilationError(
                            `Overridden function "${traitFunction.name}" should have same mutability`,
                            funInContractOrTrait.ast.loc,
                        );
                    }
                    if (
                        !typeRefEquals(
                            traitFunction.returns,
                            funInContractOrTrait.returns,
                        )
                    ) {
                        throwCompilationError(
                            `Overridden function "${traitFunction.name}" should have same return type`,
                            funInContractOrTrait.ast.loc,
                        );
                    }
                    if (
                        traitFunction.params.length !==
                        funInContractOrTrait.params.length
                    ) {
                        throwCompilationError(
                            `Overridden function "${traitFunction.name}" should have same number of parameters`,
                            funInContractOrTrait.ast.loc,
                        );
                    }
                    for (let i = 0; i < traitFunction.params.length; i++) {
                        const a = funInContractOrTrait.params[i];
                        const b = traitFunction.params[i];
                        if (!typeRefEquals(a.type, b.type)) {
                            throwCompilationError(
                                `Overridden function "${traitFunction.name}" should have same parameter types`,
                                funInContractOrTrait.ast.loc,
                            );
                        }
                    }
                    continue; // Ignore overridden functions
                }

                // Check duplicates
                if (funInContractOrTrait) {
                    if (traitFunction.isVirtual) {
                        throwCompilationError(
                            `Function "${traitFunction.name}" is defined as virtual in trait "${inheritedTrait.name}": you are probably missing "override" keyword`,
                            funInContractOrTrait.ast.loc,
                        );
                    }
                    throwCompilationError(
                        `Function "${traitFunction.name}" is already defined in trait "${inheritedTrait.name}"`,
                        funInContractOrTrait.ast.loc,
                    );
                }

                // Register function
                contractOrTrait.functions.set(traitFunction.name, {
                    ...traitFunction,
                    self: contractOrTrait.name,
                    ast: cloneNode(traitFunction.ast),
                });
            }

            // Copy constants
            for (const traitConstant of inheritedTrait.constants) {
                const constInContractOrTrait = contractOrTrait.constants.find(
                    (v) => v.name === traitConstant.name,
                );
                if (
                    !constInContractOrTrait &&
                    traitConstant.ast.attributes.find(
                        (v) => v.type === "abstract",
                    )
                ) {
                    throwCompilationError(
                        `Trait "${inheritedTrait.name}" requires constant "${traitConstant.name}"`,
                        contractOrTrait.ast.loc,
                    );
                }

                // Check overrides
                if (
                    constInContractOrTrait &&
                    constInContractOrTrait.ast.attributes.find(
                        (v) => v.type === "overrides",
                    )
                ) {
                    if (
                        !typeRefEquals(
                            traitConstant.type,
                            constInContractOrTrait.type,
                        )
                    ) {
                        throwCompilationError(
                            `Overridden constant "${traitConstant.name}" should have same type`,
                            constInContractOrTrait.ast.loc,
                        );
                    }
                    continue;
                }

                // Check duplicates
                if (constInContractOrTrait) {
                    if (
                        traitConstant.ast.attributes.find(
                            (v) => v.type === "virtual",
                        )
                    ) {
                        throwCompilationError(
                            `Constant "${traitConstant.name}" is defined as virtual in trait "${inheritedTrait.name}": you are probably missing "override" keyword`,
                            constInContractOrTrait.ast.loc,
                        );
                    }
                    throwCompilationError(
                        `Constant "${traitConstant.name}" is already defined in trait "${inheritedTrait.name}"`,
                        constInContractOrTrait.ast.loc,
                    );
                }
                const contractField = contractOrTrait.fields.find(
                    (v) => v.name === traitConstant.name,
                );
                if (contractField) {
                    // a trait constant has the same name as a contract field
                    throwCompilationError(
                        `Contract ${contractOrTrait.name} inherits constant "${traitConstant.name}" from its traits and hence cannot have a storage variable with the same name`,
                        contractField.loc,
                    );
                }

                // Register constant
                contractOrTrait.constants.push({
                    ...traitConstant,
                    ast: cloneNode(traitConstant.ast),
                });
            }

            // Copy receivers
            for (const f of inheritedTrait.receivers) {
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
                    contractOrTrait.receivers.find((v) =>
                        sameReceiver(v.selector, f.selector),
                    )
                ) {
                    throwCompilationError(
                        `Receive function for ${idTextErr(receiverSelectorName(f.selector))} already exists`,
                        contractOrTrait.ast.loc,
                    );
                }
                contractOrTrait.receivers.push({
                    selector: f.selector,
                    ast: cloneNode(f.ast),
                });
            }

            // Copy interfaces
            for (const i of inheritedTrait.interfaces) {
                if (!contractOrTrait.interfaces.find((v) => v === i)) {
                    contractOrTrait.interfaces.push(i);
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
                types.get(name)!.ast.loc,
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
                if (!types.has(idText(src.name))) {
                    throwCompilationError(
                        `Type ${idTextErr(src.name)} not found`,
                        src.loc,
                    );
                }
                dependsOn.add(idText(src.name));
            }
        };

        // Traverse functions
        for (const f of t.functions.values()) {
            traverse(f.ast, handler);
        }
        for (const f of t.receivers) {
            traverse(f.ast, handler);
        }
        if (t.init) traverse(t.init.ast, handler);

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
        const r = resolveFunctionDescriptor(null, a, a.loc.origin);
        if (r.self) {
            if (types.get(r.self)!.functions.has(r.name)) {
                throwCompilationError(
                    `Function "${r.name}" already exists in type "${r.self}"`,
                    r.ast.loc,
                );
            }
            types.get(r.self)!.functions.set(r.name, r);
        } else {
            if (staticFunctions.has(r.name) || GlobalFunctions.has(r.name)) {
                throwCompilationError(
                    `Static function "${r.name}" already exists`,
                    r.ast.loc,
                );
            }
            if (staticConstants.has(r.name)) {
                throwCompilationError(
                    `Static constant "${r.name}" already exists`,
                    a.loc,
                );
            }
            staticFunctions.set(r.name, r);
        }
    }

    //
    // Resolve static constants
    //

    for (const a of ast.constants) {
        if (staticConstants.has(idText(a.name))) {
            throwCompilationError(
                `Static constant ${idTextErr(a.name)} already exists`,
                a.loc,
            );
        }
        if (
            staticFunctions.has(idText(a.name)) ||
            GlobalFunctions.has(idText(a.name))
        ) {
            throwCompilationError(
                `Static function ${idTextErr(a.name)} already exists`,
                a.loc,
            );
        }
        staticConstants.set(idText(a.name), buildConstantDescription(a));
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

export function getType(ctx: CompilerContext, ident: AstId): TypeDescription;
export function getType(ctx: CompilerContext, ident: string): TypeDescription;
export function getType(
    ctx: CompilerContext,
    ident: AstId | string,
): TypeDescription {
    const name = typeof ident === "string" ? ident : idText(ident);
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
