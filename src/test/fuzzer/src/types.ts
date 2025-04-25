import type * as Ast from "@/ast/ast";
import {
    createSample,
    generateName,
    randomInt,
    randomBool,
    generateAstIdFromName,
    stringify,
} from "@/test/fuzzer/src/util";
import type { Scope } from "@/test/fuzzer/src/scope";
import type { TypeRef } from "@/types/types";
import fc from "fast-check";
import { GlobalContext } from "@/test/fuzzer/src/context";

/**
 * Types from Tact stdlib.
 */
export enum StdlibType {
    Int = "Int",
    Bool = "Bool",
    Builder = "Builder",
    Slice = "Slice",
    Cell = "Cell",
    Address = "Address",
    String = "String",
    StringBuilder = "StringBuilder",
}

/** User-defined maps. */
export type MapType = {
    key: Type;
    value: Type;
};

/** A single struct or message field. */
export type StructField = {
    name: string;
    type: Type;
    default?: fc.Arbitrary<Ast.Expression>;
};

/** Utility types used internally in the generator. */
export enum UtilType {
    Contract = "Contract",
    Trait = "Trait",
    Program = "Program",
    This = "This",
    /**
     * Functional Unit type that refers to the `void` type in languages like C++.
     * Typically used when returning nothing from functions/methods or in imperative
     * constructions which only mutate the state.
     */
    Unit = "Unit",
}

export type OptionalType = {
    kind: "optional";
    type: Type;
};

/**
 * Represents the signature of a function in a format typical for functional languages, such as Int -> Int -> Int.
 * The last element of the list means the return type, previous elements are types of the arguments.
 */
export type FunctionType = {
    kind: "function";
    signature: Type[];
};

export type Type =
    | {
          kind: "stdlib";
          type: StdlibType;
      }
    | {
          kind: "map";
          type: MapType;
      }
    | {
          kind: "struct";
          name: string;
          fields: StructField[];
      }
    | {
          kind: "message";
          name: string;
          fields: StructField[];
      }
    | {
          kind: "util";
          type: UtilType;
      }
    | FunctionType
    | OptionalType;

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function throwTyError(ty: any): never {
    throw new Error(`Unsupported type: ${stringify(ty, 0)}`);
}

export function tyToString(ty: Type): string {
    switch (ty.kind) {
        case "stdlib":
            return ty.type;
        case "struct":
        case "message":
            return ty.name;
        case "map":
            return `map<${tyToString(ty.type.key)}, ${tyToString(ty.type.value)}>`;
        case "optional":
            return `${tyToString(ty.type)}?`;
        default:
            throwTyError(ty);
    }
}

export function tyEq(lhs: Type, rhs: Type): boolean {
    return tyToString(lhs) === tyToString(rhs);
}

/**
 * A subset of supported Stdlib types that might be used in AST generation.
 */
export const SUPPORTED_STDLIB_TYPES: StdlibType[] = [
    StdlibType.String,
    StdlibType.Bool,
    StdlibType.Int,
];

function makePrimitiveType(name: string): Ast.PrimitiveTypeDecl {
    return GlobalContext.makeF.makeDummyPrimitiveTypeDecl(
        generateAstIdFromName(name),
    );
}
function makeASTTypeRef(name: string): Ast.TypeId {
    return GlobalContext.makeF.makeDummyTypeId(name);
}

function makeTypeRef(name: string): TypeRef {
    return {
        kind: "ref",
        name,
        optional: false,
    };
}

/**
 * Cache for Stdlib types.
 */
const StdlibTypeCache: Map<StdlibType, [Ast.TypeDecl, Ast.Type, TypeRef]> =
    new Map();
Object.values(StdlibType).forEach((ty) => {
    StdlibTypeCache.set(ty, [
        transformTy<Ast.TypeDecl>(ty, makePrimitiveType),
        transformTy<Ast.Type>(ty, makeASTTypeRef),
        transformTy<TypeRef>(ty, makeTypeRef),
    ]);
});

/**
 * Creates a Tact type entry from the given tact-check type definition.
 */
function transformTy<T>(ty: StdlibType, transform: (type: StdlibType) => T): T {
    if (!Object.values(StdlibType).includes(ty)) {
        throwTyError(ty);
    }
    return transform(ty);
}
export function tyToAstTypeDecl(ty: Type): Ast.TypeDecl {
    switch (ty.kind) {
        case "stdlib": {
            const result = StdlibTypeCache.get(ty.type);
            if (!result) {
                throwTyError(ty);
            }
            return result[0];
        }
        default:
            throwTyError(ty);
    }
}
export function tyToAstType(ty: Type, isBounced = false): Ast.Type {
    const generateAstTypeId = (text: string) =>
        GlobalContext.makeF.makeDummyTypeId(text);

    switch (ty.kind) {
        case "stdlib": {
            const result = StdlibTypeCache.get(ty.type);
            if (!result) {
                throwTyError(ty);
            }
            return result[1];
        }
        case "struct":
        case "message": {
            const simpleType = GlobalContext.makeF.makeDummyTypeId(ty.name);
            return isBounced
                ? GlobalContext.makeF.makeDummyBouncedMessageType(simpleType)
                : simpleType;
        }
        case "map":
            return GlobalContext.makeF.makeDummyMapType(
                generateAstTypeId(tyToString(ty.type.key)),
                undefined,
                generateAstTypeId(tyToString(ty.type.value)),
                undefined,
            );
        case "optional":
            return GlobalContext.makeF.makeDummyOptionalType(
                tyToAstType(ty.type, isBounced),
            );
        default:
            throwTyError(ty);
    }
}

export function tyToTypeRef(ty: Type): TypeRef {
    switch (ty.kind) {
        case "stdlib": {
            const result = StdlibTypeCache.get(ty.type);
            if (!result) {
                throwTyError(ty);
            }
            return result[2];
        }
        default:
            throwTyError(ty);
    }
}

/**
 * Retrieves a return type from the function type.
 */
export function getReturnType(ty: FunctionType): Type {
    if (ty.signature.length === 0) {
        throw new Error("Empty function signature");
    }
    const result = ty.signature[ty.signature.length - 1];
    if (typeof result === "undefined") {
        throw new Error("Unexpected 'undefined'");
    }
    return result;
}

/**
 * Returns mock AST entries for types defined in standard library.
 */
export function getStdlibTypes(): Ast.TypeDecl[] {
    return [...Object.values(StdlibType)].map((type) =>
        makePrimitiveType(type),
    );
}

/**
 * An utility class used to generate internal tact-check types.
 */
export class TypeGen {
    private constructor(private scope: Scope) {}

    public static fromScope(scope: Scope): TypeGen {
        return new TypeGen(scope);
    }

    /** Arbitrary that generates stdlib types. */
    public stdlibArbitrary: fc.Arbitrary<Type> = fc.record({
        kind: fc.constant("stdlib"),
        type: fc.constantFrom(...SUPPORTED_STDLIB_TYPES),
    });

    /** Arbitrary that generates map types. */
    public mapArbitrary: fc.Arbitrary<Type> = fc.record({
        kind: fc.constant("map"),
        type: fc.record({
            key: fc.record({
                kind: fc.constant("stdlib"),
                type: fc.constantFrom(
                    // TODO: Support Address
                    StdlibType.Int,
                ),
            }) as fc.Arbitrary<Type>,
            value: fc.record({
                kind: fc.constant("stdlib"),
                type: fc.constantFrom(
                    // TODO: Support Address, Cell, Struct, Message
                    StdlibType.Int,
                    StdlibType.Bool,
                ),
            }) as fc.Arbitrary<Type>,
        }),
    });

    /**
     * Picks an arbitrary type available within the scope.
     * This doesn't generate new type definitions.
     */
    public pick(): Type {
        const arb = fc.oneof(
            this.stdlibArbitrary,
            // this.mapArbitrary,
            // ...this.getStructs(),
        );
        return createSample(arb);
    }

    /**
     * Generates any of the supported types.
     */
    public generate(): fc.Arbitrary<Type> {
        return fc.oneof(
            this.stdlibArbitrary,
            this.generateFun(),
            this.generateStruct(randomBool()),
        );
    }

    /**
     * Generates an arbitrary function signature.
     */
    public generateFun(
        minLength = 1,
        maxLength = 3,
    ): fc.Arbitrary<FunctionType> {
        const structs = this.getStructs();
        return fc.record<FunctionType>({
            kind: fc.constant("function"),
            signature: fc.array(
                fc.oneof(this.stdlibArbitrary, this.mapArbitrary, ...structs),
                {
                    minLength,
                    maxLength,
                },
            ),
        });
    }

    /**
     * Generates an arbitrary method signature that always starts with `this`.
     */
    public generateMethod(): fc.Arbitrary<FunctionType> {
        return this.generateFun().map((funType) => ({
            kind: "function",
            signature: [
                { kind: "util", type: UtilType.This },
                ...funType.signature,
            ],
        }));
    }

    /**
     * Generates an arbitrary struct or message signature.
     */
    public generateStruct(isMessage: boolean): fc.Arbitrary<Type> {
        const structName = createSample(
            generateName(this.scope, /*shadowing=*/ true, /*isType=*/ true),
        );

        // NOTE: It doesn't support nested structs/messages as they are not
        const fields = fc
            .array(
                fc.record<StructField>({
                    name: generateName(this.scope),
                    type: this.stdlibArbitrary,
                    default: fc.constantFrom(undefined),
                }),
                { minLength: 1, maxLength: 4 },
            )
            .filter((generatedFields) =>
                generatedFields.every(
                    (item, index) =>
                        generatedFields.findIndex(
                            (other) => other.name === item.name,
                        ) === index,
                ),
            );
        if (isMessage) {
            return fc.record<Type>({
                kind: fc.constant("message"),
                name: fc.constant(structName),
                fields: fields,
            }) as fc.Arbitrary<Type>;
        } else {
            return fc.record<Type>({
                kind: fc.constant("struct"),
                name: fc.constant(structName),
                fields: fields,
            }) as fc.Arbitrary<Type>;
        }
    }

    /**
     * Returns arbitraries to generate structs available in the program scope.
     */
    private getStructs(): fc.Arbitrary<Type>[] {
        const structs = this.scope.getItemsRecursive("struct");
        if (structs.length === 0) {
            return [];
        }
        return structs.map((s) => fc.constantFrom(s.type));
    }
}

/**
 * Creates an arbitrary function or method signature that returns the given type.
 */
export function makeFunctionTy(
    kind: "function" | "method",
    returnTy: Type,
    minArgs = 1,
    maxArgs = 3,
): FunctionType {
    const argsLength = randomInt(minArgs, maxArgs);
    const thisArg: Type[] =
        kind === "method" ? [{ kind: "util", type: UtilType.This }] : [];
    const args: Type[] = Array.from({ length: argsLength }, () => {
        const idx = randomInt(0, SUPPORTED_STDLIB_TYPES.length - 1);
        const selectedType = SUPPORTED_STDLIB_TYPES[idx];
        if (typeof selectedType === "undefined") {
            throw new Error("Unexpected 'undefined'");
        }
        return { kind: "stdlib", type: selectedType };
    });
    return { kind: "function", signature: [...thisArg, ...args, returnTy] };
}

export function isUnit(ty: Type): boolean {
    return ty.kind === "util" && ty.type === "Unit";
}

export function isThis(ty: Type): boolean {
    return ty.kind === "util" && ty.type === "This";
}

/**
 * An heuristic that replicates the `resolvePartialFields` logic in the compiler in order to
 * detect if the message ought to be wrapped in `bounced<>`.
 */
export function isBouncedMessage(ty: Type): boolean {
    if (ty.kind !== "message") {
        throwTyError(ty);
    }
    for (const f of ty.fields) {
        if (!(f.type.kind === "stdlib" && f.type.type === StdlibType.Bool)) {
            return true; // too big; must be wrapped
        }
    }
    return false;
}
