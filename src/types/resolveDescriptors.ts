import {
    AstConstantDef,
    AstFieldDecl,
    AstContractInit,
    AstNativeFunctionDecl,
    AstNode,
    AstType,
    createAstNode,
    idText,
    AstId,
    eqNames,
    AstFunctionDef,
    isSelfId,
    isSlice,
    AstFunctionDecl,
    AstConstantDecl,
    AstExpression,
    AstMapType,
    AstTypeId,
    AstAsmFunctionDef,
} from "../grammar/ast";
import { traverse } from "../grammar/iterators";
import {
    idTextErr,
    throwCompilationError,
    throwInternalCompilerError,
} from "../errors";
import { CompilerContext, Store, createContextStore } from "../context";
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
import { resolveABIType, intMapFormats } from "./resolveABITypeRef";
import { enabledExternals } from "../config/features";
import { isRuntimeType } from "./isRuntimeType";
import { GlobalFunctions } from "../abi/global";
import { ItemOrigin } from "../grammar/grammar";
import { getExpType, resolveExpression } from "./resolveExpression";
import { emptyContext } from "./resolveStatements";
import { isAssignable } from "./subtyping";

const store = createContextStore<TypeDescription>();
const staticFunctionsStore = createContextStore<FunctionDescription>();
const staticConstantsStore = createContextStore<ConstantDescription>();

// this function does not handle the case of structs
function verifyMapAsAnnotationsForPrimitiveTypes(
    type: AstTypeId,
    asAnnotation: AstId | null,
): void {
    switch (idText(type)) {
        case "Int": {
            if (
                asAnnotation !== null &&
                !Object.keys(intMapFormats).includes(idText(asAnnotation))
            ) {
                throwCompilationError(
                    'Invalid `as`-annotation for type "Int" type',
                    asAnnotation.loc,
                );
            }
            return;
        }
        case "Address":
        case "Bool":
        case "Cell": {
            if (asAnnotation !== null) {
                throwCompilationError(
                    `${idTextErr(type)} type cannot have as-annotation`,
                    asAnnotation.loc,
                );
            }
            return;
        }
        default: {
            throwInternalCompilerError("Unsupported map type", type.loc);
        }
    }
}

function verifyMapTypes(
    typeId: AstTypeId,
    asAnnotation: AstId | null,
    allowedTypeNames: string[],
): void {
    if (!allowedTypeNames.includes(idText(typeId))) {
        throwCompilationError(
            "Invalid map type. Check https://docs.tact-lang.org/book/maps#allowed-types",
            typeId.loc,
        );
    }
    verifyMapAsAnnotationsForPrimitiveTypes(typeId, asAnnotation);
}

function verifyMapType(mapTy: AstMapType, isValTypeStruct: boolean) {
    // optional and other compound key and value types are disallowed at the level of grammar

    // check allowed key types
    verifyMapTypes(mapTy.keyType, mapTy.keyStorageType, ["Int", "Address"]);

    // check allowed value types
    if (isValTypeStruct && mapTy.valueStorageType === null) {
        return;
    }
    // the case for struct/message is already checked
    verifyMapTypes(mapTy.valueType, mapTy.valueStorageType, [
        "Int",
        "Address",
        "Bool",
        "Cell",
    ]);
}

export const toBounced = (type: string) => `${type}%%BOUNCED%%`;

export function resolveTypeRef(ctx: CompilerContext, type: AstType): TypeRef {
    switch (type.kind) {
        case "type_id": {
            const t = getType(ctx, idText(type));
            return {
                kind: "ref",
                name: t.name,
                optional: false,
            };
        }
        case "optional_type": {
            if (type.typeArg.kind !== "type_id") {
                throwInternalCompilerError(
                    "Only optional type identifiers are supported now",
                    type.typeArg.loc,
                );
            }
            const t = getType(ctx, idText(type.typeArg));
            return {
                kind: "ref",
                name: t.name,
                optional: true,
            };
        }
        case "map_type": {
            const keyTy = getType(ctx, idText(type.keyType));
            const valTy = getType(ctx, idText(type.valueType));
            verifyMapType(type, valTy.kind === "struct");
            return {
                kind: "map",
                key: keyTy.name,
                keyAs:
                    type.keyStorageType !== null
                        ? idText(type.keyStorageType)
                        : null,
                value: valTy.name,
                valueAs:
                    type.valueStorageType !== null
                        ? idText(type.valueStorageType)
                        : null,
            };
        }
        case "bounced_message_type": {
            const t = getType(ctx, idText(type.messageType));
            return {
                kind: "ref_bounced",
                name: t.name,
            };
        }
    }
}

function buildTypeRef(
    type: AstType,
    types: Map<string, TypeDescription>,
): TypeRef {
    switch (type.kind) {
        case "type_id": {
            if (!types.has(idText(type))) {
                throwCompilationError(
                    `Type ${idTextErr(type)} not found`,
                    type.loc,
                );
            }
            return {
                kind: "ref",
                name: idText(type),
                optional: false,
            };
        }
        case "optional_type": {
            if (type.typeArg.kind !== "type_id") {
                throwInternalCompilerError(
                    "Only optional type identifiers are supported now",
                    type.typeArg.loc,
                );
            }
            if (!types.has(idText(type.typeArg))) {
                throwCompilationError(
                    `Type ${idTextErr(type.typeArg)} not found`,
                    type.loc,
                );
            }
            return {
                kind: "ref",
                name: idText(type.typeArg),
                optional: true,
            };
        }
        case "map_type": {
            if (!types.has(idText(type.keyType))) {
                throwCompilationError(
                    `Type ${idTextErr(type.keyType)} not found`,
                    type.loc,
                );
            }
            if (!types.has(idText(type.valueType))) {
                throwCompilationError(
                    `Type ${idTextErr(type.valueType)} not found`,
                    type.loc,
                );
            }
            const valTy = types.get(idText(type.valueType))!;
            verifyMapType(type, valTy.kind === "struct");
            return {
                kind: "map",
                key: idText(type.keyType),
                keyAs:
                    type.keyStorageType !== null
                        ? idText(type.keyStorageType)
                        : null,
                value: idText(type.valueType),
                valueAs:
                    type.valueStorageType !== null
                        ? idText(type.valueStorageType)
                        : null,
            };
        }
        case "bounced_message_type": {
            return {
                kind: "ref_bounced",
                name: idText(type.messageType),
            };
        }
    }
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

        switch (a.kind) {
            case "primitive_type_decl":
                {
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
                }
                break;
            case "contract":
                {
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
                        interfaces: a.attributes.map((v) => v.name.value),
                        constants: [],
                        partialFieldCount: 0,
                    });
                }
                break;
            case "struct_decl":
            case "message_decl":
                {
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
                }
                break;
            case "trait": {
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
                    interfaces: a.attributes.map((v) => v.name.value),
                    constants: [],
                    partialFieldCount: 0,
                });
            }
        }
    }

    //
    // Resolve fields
    //

    function buildFieldDescription(
        src: AstFieldDecl,
        index: number,
    ): FieldDescription {
        const fieldTy = buildTypeRef(src.type, types);

        // Check if field is runtime type
        if (isRuntimeType(fieldTy)) {
            throwCompilationError(
                printTypeRef(fieldTy) +
                    " is a runtime only type and can't be used as field",
                src.loc,
            );
        }

        // Resolve abi type
        const type = resolveABIType(src);

        return {
            name: idText(src.name),
            type: fieldTy,
            index,
            as: src.as !== null ? idText(src.as) : null,
            default: undefined, // initializer will be evaluated after typechecking
            loc: src.loc,
            ast: src,
            abi: { name: idText(src.name), type },
        };
    }

    function buildConstantDescription(
        src: AstConstantDef | AstConstantDecl,
    ): ConstantDescription {
        const constDeclTy = buildTypeRef(src.type, types);
        return {
            name: idText(src.name),
            type: constDeclTy,
            value: undefined, // initializer will be evaluated after typechecking
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
                    if (f.attributes.find((v) => v.type !== "override")) {
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
            if (a.kind === "message_decl" && a.opcode) {
                if (a.opcode.value === 0n) {
                    throwCompilationError(
                        `Zero opcodes are reserved for text comments and cannot be used for message structs`,
                        a.opcode.loc,
                    );
                }
                if (a.opcode.value > 0xffff_ffff) {
                    throwCompilationError(
                        `Opcode of message ${idTextErr(a.name)} is too large: it must fit into 32 bits`,
                        a.opcode.loc,
                    );
                }
            }
        }

        // Trait
        if (a.kind === "trait") {
            for (const traitDecl of a.declarations) {
                if (traitDecl.kind === "field_decl") {
                    if (
                        types
                            .get(idText(a.name))!
                            .fields.find((v) => eqNames(v.name, traitDecl.name))
                    ) {
                        throwCompilationError(
                            `Field ${idTextErr(traitDecl.name)} already exists`,
                            traitDecl.loc,
                        );
                    }
                    if (traitDecl.as) {
                        throwCompilationError(
                            `Trait field cannot have serialization specifier`,
                            traitDecl.loc,
                        );
                    }
                    if (traitDecl.initializer) {
                        throwCompilationError(
                            `Trait field cannot have an initializer`,
                            traitDecl.initializer.loc,
                        );
                    }
                    types
                        .get(idText(a.name))!
                        .fields.push(
                            buildFieldDescription(
                                traitDecl,
                                types.get(idText(a.name))!.fields.length,
                            ),
                        );
                } else if (
                    traitDecl.kind === "constant_def" ||
                    traitDecl.kind === "constant_decl"
                ) {
                    if (
                        types
                            .get(idText(a.name))!
                            .fields.find((v) => eqNames(v.name, traitDecl.name))
                    ) {
                        throwCompilationError(
                            `Field ${idTextErr(traitDecl.name)} already exists`,
                            traitDecl.loc,
                        );
                    }
                    if (
                        types
                            .get(idText(a.name))!
                            .constants.find((v) =>
                                eqNames(v.name, traitDecl.name),
                            )
                    ) {
                        throwCompilationError(
                            `Constant ${idTextErr(traitDecl.name)} already exists`,
                            traitDecl.loc,
                        );
                    }
                    if (
                        traitDecl.attributes.find((v) => v.type === "override")
                    ) {
                        throwCompilationError(
                            `Trait constant cannot be overridden`,
                            traitDecl.loc,
                        );
                    }
                    types
                        .get(idText(a.name))!
                        .constants.push(buildConstantDescription(traitDecl));
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
        a:
            | AstFunctionDef
            | AstNativeFunctionDecl
            | AstFunctionDecl
            | AstAsmFunctionDef,
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
        const isOverride = a.attributes.find((a) => a.type === "override");
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
            if (isOverride) {
                throwCompilationError(
                    "Native functions cannot be overridden",
                    isOverride.loc,
                );
            }
        }

        // Check virtual and override
        if (isVirtual && isExtends) {
            throwCompilationError(
                "Extend functions cannot be virtual",
                isVirtual.loc,
            );
        }
        if (isOverride && isExtends) {
            throwCompilationError(
                "Extend functions cannot be overridden",
                isOverride.loc,
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
        if (!self && isOverride) {
            throwCompilationError(
                "Overrides functions must be defined within a contract or a trait",
                isOverride.loc,
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
        if (isVirtual && isOverride) {
            throwCompilationError(
                "Overrides functions cannot be virtual",
                isOverride.loc,
            );
        }
        if (isAbstract && isOverride) {
            throwCompilationError(
                "Overrides functions cannot be abstract",
                isOverride.loc,
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

        if (isOverride) {
            const t = types.get(self!)!;
            if (!["contract", "trait"].includes(t.kind)) {
                throwCompilationError(
                    "Overridden functions must be defined within a contract or a trait",
                    isOverride.loc,
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
            const firstParam = params[0]!;
            if (!isSelfId(firstParam.name)) {
                throwCompilationError(
                    'Extend function must have first parameter named "self"',
                    firstParam.loc,
                );
            }
            if (firstParam.type.kind !== "ref") {
                throwCompilationError(
                    "Extend functions must have a reference type as the first parameter",
                    firstParam.loc,
                );
            }
            if (firstParam.type.optional) {
                throwCompilationError(
                    "Extend functions must have a non-optional type as the first parameter",
                    firstParam.loc,
                );
            }
            if (!types.has(firstParam.type.name)) {
                throwCompilationError(
                    "Type " + firstParam.type.name + " not found",
                    firstParam.loc,
                );
            }

            // Update self and remove first parameter
            self = firstParam.type.name;
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
        const exNames: Set<string> = new Set();
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

        // check asm shuffle
        if (a.kind === "asm_function_def") {
            // check arguments shuffle
            if (a.shuffle.args.length !== 0) {
                const shuffleArgSet = new Set(
                    a.shuffle.args.map((id) => idText(id)),
                );
                if (shuffleArgSet.size !== a.shuffle.args.length) {
                    throwCompilationError(
                        "asm argument rearrangement cannot have duplicates",
                        a.loc,
                    );
                }
                const paramSet = new Set(
                    a.params.map((typedId) => idText(typedId.name)),
                );
                if (!paramSet.isSubsetOf(shuffleArgSet)) {
                    throwCompilationError(
                        "asm argument rearrangement must mention all function parameters",
                        a.loc,
                    );
                }
                if (!shuffleArgSet.isSubsetOf(paramSet)) {
                    throwCompilationError(
                        "asm argument rearrangement must mention only function parameters",
                        a.loc,
                    );
                }
            }

            // check return shuffle
            if (a.shuffle.ret.length !== 0) {
                const shuffleRetSet = new Set(
                    a.shuffle.ret.map((num) => Number(num.value)),
                );
                if (shuffleRetSet.size !== a.shuffle.ret.length) {
                    throwCompilationError(
                        "asm return rearrangement cannot have duplicates",
                        a.loc,
                    );
                }

                let retTupleSize = 0;
                switch (returns.kind) {
                    case "ref":
                        {
                            const ty = types.get(returns.name)!;
                            switch (ty.kind) {
                                case "struct":
                                case "contract":
                                    retTupleSize = ty.fields.length;
                                    break;
                                case "primitive_type_decl":
                                    retTupleSize = 1;
                                    break;
                                case "trait":
                                    throwInternalCompilerError(
                                        "A trait cannot be returned from a function",
                                        a.loc,
                                    );
                            }
                        }
                        break;
                    case "null":
                    case "map":
                        retTupleSize = 1;
                        break;
                    case "ref_bounced":
                        throwInternalCompilerError(
                            "A <bounced> type cannot be returned from a function",
                            a.loc,
                        );
                        break;
                    case "void":
                        retTupleSize = 0;
                        break;
                }
                // mutating functions also return `self` arg (implicitly in Tact, but explicitly in FunC)
                retTupleSize += isMutating ? 1 : 0;
                const returnValueSet = new Set([...Array(retTupleSize).keys()]);
                if (!returnValueSet.isSubsetOf(shuffleRetSet)) {
                    throwCompilationError(
                        `asm return rearrangement must mention all return position numbers: [0..${retTupleSize - 1}]`,
                        a.loc,
                    );
                }
                if (!shuffleRetSet.isSubsetOf(returnValueSet)) {
                    throwCompilationError(
                        `asm return rearrangement must mention only valid return position numbers: [0..${retTupleSize - 1}]`,
                        a.loc,
                    );
                }
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
            isOverride: !!isOverride,
            isInline: !!isInline,
            isAbstract: !!isAbstract,
        };
    }

    function resolveInitFunction(ast: AstContractInit): InitDescription {
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
                if (
                    d.kind === "function_def" ||
                    d.kind === "function_decl" ||
                    d.kind === "asm_function_def"
                ) {
                    const f = resolveFunctionDescriptor(s.name, d, s.origin);
                    if (f.self !== s.name) {
                        throwInternalCompilerError(
                            `Function self must be ${s.name}`,
                        ); // Impossible
                    }
                    if (s.functions.has(f.name)) {
                        throwCompilationError(
                            `Function "${f.name}" already exists in type "${s.name}"`,
                            s.ast.loc,
                        );
                    }
                    s.functions.set(f.name, f);
                }
                if (d.kind === "contract_init") {
                    if (s.init) {
                        throwCompilationError(
                            "Init function already exists",
                            d.loc,
                        );
                    }
                    s.init = resolveInitFunction(d);
                }
                if (d.kind === "receiver") {
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

                    switch (d.selector.kind) {
                        case "internal-simple":
                        case "external-simple":
                            {
                                const param = d.selector.param;
                                const internal =
                                    d.selector.kind === "internal-simple";

                                if (param.type.kind !== "type_id") {
                                    throwCompilationError(
                                        "Receive function can only accept non-optional message types",
                                        d.loc,
                                    );
                                }
                                const t = types.get(idText(param.type));
                                if (!t) {
                                    throwCompilationError(
                                        `Type ${idTextErr(param.type)} not found`,
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
                                    const n = idText(param.type);
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
                                            `Receive function for ${idTextErr(param.type)} already exists`,
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
                                            type: idText(param.type),
                                        },
                                        ast: d,
                                    });
                                }
                            }
                            break;
                        case "internal-comment":
                        case "external-comment":
                            {
                                const internal =
                                    d.selector.kind === "internal-comment";
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
                            }
                            break;
                        case "internal-fallback":
                        case "external-fallback":
                            {
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
                            }
                            break;
                        case "bounce": {
                            const param = d.selector.param;

                            if (param.type.kind === "type_id") {
                                if (isSlice(param.type)) {
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
                                    const type = types.get(idText(param.type));
                                    if (type === undefined) {
                                        throwCompilationError(
                                            `Unknown bounced receiver parameter type: ${idTextErr(param.type)}`,
                                            param.type.loc,
                                        );
                                    }
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
                                            `This message is too big for bounce receiver, you need to wrap it to a bounced<${idTextErr(param.type)}>.`,
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
                                            `Bounce receive function for ${idTextErr(param.type)} already exists`,
                                            param.loc,
                                        );
                                    }
                                    s.receivers.push({
                                        selector: {
                                            kind: "bounce-binary",
                                            name: param.name,
                                            type: idText(param.type),
                                            bounced: false,
                                        },
                                        ast: d,
                                    });
                                }
                            } else if (param.type.kind === "optional_type") {
                                throwCompilationError(
                                    "Bounce receive function cannot have optional parameter",
                                    d.loc,
                                );
                            } else if (
                                param.type.kind === "bounced_message_type"
                            ) {
                                const t = types.get(
                                    idText(param.type.messageType),
                                );
                                if (t === undefined) {
                                    throwCompilationError(
                                        `Unknown bounced receiver parameter type: ${idTextErr(param.type.messageType)}`,
                                        param.type.loc,
                                    );
                                }
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
                                            v.selector.kind ===
                                                "bounce-binary" &&
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
                                        type: idText(param.type.messageType),
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
                        }
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
                    ast: createAstNode({
                        kind: "contract_init",
                        params: [],
                        statements: [],
                        loc: t.ast.loc,
                    }) as AstContractInit,
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
            const traitSet: Set<string> = new Set(t.ast.traits.map(idText));
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
            const visited: Set<string> = new Set();
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

                if (funInContractOrTrait?.isOverride) {
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
                        const a = funInContractOrTrait.params[i]!;
                        const b = traitFunction.params[i]!;
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

                if (
                    constInContractOrTrait?.ast.attributes.find(
                        (v) => v.type === "override",
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

    const processed: Set<string> = new Set();
    const processing: Set<string> = new Set();

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
        const dependsOn: Set<string> = new Set();
        const handler = (src: AstNode) => {
            if (src.kind === "init_of") {
                if (!types.has(idText(src.contract))) {
                    throwCompilationError(
                        `Type ${idTextErr(src.contract)} not found`,
                        src.loc,
                    );
                }
                dependsOn.add(idText(src.contract));
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
        const dependsOn: Set<string> = new Set();
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

    // A pass that initializes constants and default field values
    ctx = initializeConstantsAndDefaultContractAndStructFields(ctx);

    // detect self-referencing or mutually-recursive types
    checkRecursiveTypes(ctx);

    return ctx;
}

export function getType(
    ctx: CompilerContext,
    ident: AstId | AstTypeId | string,
): TypeDescription {
    const name = typeof ident === "string" ? ident : idText(ident);
    const r = store.get(ctx, name);
    if (!r) {
        throwInternalCompilerError(`Type ${name} not found`);
    }
    return r;
}

function getTypeStore(ctx: CompilerContext): Store<TypeDescription> {
    return store.all(ctx);
}

export function getAllTypes(ctx: CompilerContext): TypeDescription[] {
    return Array.from(getTypeStore(ctx).values());
}

export function getContracts(ctx: CompilerContext): string[] {
    return getAllTypes(ctx)
        .filter((v) => v.kind === "contract")
        .map((v) => v.name);
}

export function getStaticFunction(
    ctx: CompilerContext,
    name: string,
): FunctionDescription {
    const r = staticFunctionsStore.get(ctx, name);
    if (!r) {
        throwInternalCompilerError(`Static function ${name} not found`);
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
        throwInternalCompilerError(`Static constant ${name} not found`);
    }
    return r;
}

export function hasStaticConstant(ctx: CompilerContext, name: string) {
    return !!staticConstantsStore.get(ctx, name);
}

function getStaticFunctionStore(
    ctx: CompilerContext,
): Store<FunctionDescription> {
    return staticFunctionsStore.all(ctx);
}

export function getAllStaticFunctions(
    ctx: CompilerContext,
): FunctionDescription[] {
    return Array.from(getStaticFunctionStore(ctx).values());
}

function getStaticConstantStore(
    ctx: CompilerContext,
): Store<ConstantDescription> {
    return staticConstantsStore.all(ctx);
}

export function getAllStaticConstants(
    ctx: CompilerContext,
): ConstantDescription[] {
    return Array.from(getStaticConstantStore(ctx).values());
}

function resolvePartialFields(ctx: CompilerContext, type: TypeDescription) {
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

function checkInitializerType(
    name: string,
    kind: "Constant" | "Struct field",
    declTy: TypeRef,
    initializer: AstExpression,
    ctx: CompilerContext,
): CompilerContext {
    const stmtCtx = emptyContext(initializer.loc, null, declTy);
    ctx = resolveExpression(initializer, stmtCtx, ctx);
    const initTy = getExpType(ctx, initializer);
    if (!isAssignable(initTy, declTy)) {
        throwCompilationError(
            `${kind} ${idTextErr(name)} has declared type "${printTypeRef(declTy)}", but its initializer has incompatible type "${printTypeRef(initTy)}"`,
            initializer.loc,
        );
    }
    return ctx;
}

function initializeConstants(
    constants: ConstantDescription[],
    ctx: CompilerContext,
): CompilerContext {
    for (const constant of constants) {
        if (constant.ast.kind === "constant_def") {
            ctx = checkInitializerType(
                constant.name,
                "Constant",
                constant.type,
                constant.ast.initializer,
                ctx,
            );
            constant.value = evalConstantExpression(
                constant.ast.initializer,
                ctx,
            );
        }
    }
    return ctx;
}

function initializeConstantsAndDefaultContractAndStructFields(
    ctx: CompilerContext,
): CompilerContext {
    for (const aggregateTy of getAllTypes(ctx)) {
        switch (aggregateTy.kind) {
            case "primitive_type_decl":
                break;
            case "trait":
            case "contract":
            case "struct": {
                {
                    for (const field of aggregateTy.fields) {
                        if (field.ast.initializer !== null) {
                            ctx = checkInitializerType(
                                field.name,
                                "Struct field",
                                field.type,
                                field.ast.initializer,
                                ctx,
                            );
                            field.default = evalConstantExpression(
                                field.ast.initializer,
                                ctx,
                            );
                        } else {
                            // if a field has optional type and it is missing an explicit initializer
                            // we consider it to be initialized with the null value

                            field.default =
                                field.type.kind === "ref" && field.type.optional
                                    ? null
                                    : undefined;
                        }
                    }

                    // constants need to be processed after structs because
                    // see more detail below
                    ctx = initializeConstants(aggregateTy.constants, ctx);
                }
                break;
            }
        }
    }

    // constants need to be processed after structs because
    // constants might use default field values: `const x: Int = S{}.f`, where `struct S {f: Int = 42}`
    // and the default field values are filled in during struct field initializers processing
    ctx = initializeConstants(getAllStaticConstants(ctx), ctx);

    return ctx;
}

function checkRecursiveTypes(ctx: CompilerContext): void {
    // the implementation is basically Tarjan's algorithm,
    // which removes trivial SCCs, i.e. nodes (structs) that do not refer to themselves
    // and terminates early if a non-trivial SCC is detected
    // https://en.wikipedia.org/wiki/Tarjan%27s_strongly_connected_components_algorithm

    const structs = getAllTypes(ctx).filter(
        (aggregate) => aggregate.kind === "struct",
    );
    let index = 0;
    const stack: AstId[] = [];
    // `string` here means "struct name"
    const indices: Map<string, number> = new Map();
    const lowLinks: Map<string, number> = new Map();
    const onStack: Set<string> = new Set();
    const selfReferencingVertices: Set<string> = new Set();

    for (const struct of structs) {
        if (!indices.has(struct.name)) {
            const cycle = strongConnect(struct);
            if (cycle.length === 1) {
                const tyId = cycle[0]!;
                throwCompilationError(
                    `Self-referencing types are not supported: type ${idTextErr(tyId)} refers to itself in its definition`,
                    tyId.loc,
                );
            } else if (cycle.length > 1) {
                const tyIds = cycle.map((tyId) => idTextErr(tyId)).join(", ");
                throwCompilationError(
                    `Mutually recursive types are not supported: types ${tyIds} form a cycle`,
                    cycle[0]!.loc,
                );
            }
        }
    }

    function strongConnect(struct: TypeDescription) {
        // Set the depth index for v to the smallest unused index
        indices.set(struct.name, index);
        lowLinks.set(struct.name, index);
        index += 1;
        stack.push(struct.ast.name);
        onStack.add(struct.name);

        const processPossibleSuccessor = (successorName: string) => {
            const fieldTy = getType(ctx, successorName);
            if (fieldTy.name === struct.name) {
                selfReferencingVertices.add(struct.name);
            }
            if (fieldTy.kind === "struct") {
                // successor
                if (!indices.has(fieldTy.name)) {
                    strongConnect(fieldTy);
                    lowLinks.set(
                        struct.name,
                        Math.min(
                            lowLinks.get(struct.name)!,
                            lowLinks.get(fieldTy.name)!,
                        ),
                    );
                } else if (onStack.has(fieldTy.name)) {
                    lowLinks.set(
                        struct.name,
                        Math.min(
                            lowLinks.get(struct.name)!,
                            indices.get(fieldTy.name)!,
                        ),
                    );
                }
            }
        };

        // process the successors of the current node
        for (const field of struct.fields) {
            switch (field.type.kind) {
                case "ref":
                case "ref_bounced":
                    processPossibleSuccessor(field.type.name);
                    break;
                case "map":
                    processPossibleSuccessor(field.type.value);
                    break;
                // do nothing
                case "void":
                case "null":
                    break;
            }
        }

        if (lowLinks.get(struct.name) === indices.get(struct.name)) {
            const cycle: AstId[] = [];
            let e = "";
            do {
                const last = stack.pop()!;
                e = idText(last);
                onStack.delete(e);
                cycle.push(last);
            } while (e !== struct.name);

            if (cycle.length > 1) {
                return cycle.reverse();
            } else if (cycle.length === 1) {
                if (selfReferencingVertices.has(struct.name)) {
                    // filter out trivial SCCs
                    return cycle;
                }
            }
        }
        return [];
    }
}
