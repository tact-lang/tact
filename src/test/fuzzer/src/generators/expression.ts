import type * as Ast from "@/ast/ast";
import type fc from "fast-check";
import {
    generateAstIdFromName,
    packArbitraries,
    stringify,
} from "@/test/fuzzer/src/util";
import {
    GenerativeEntity,
    NamedGenerativeEntity,
} from "@/test/fuzzer/src/generators/generator";
import { StdlibType } from "@/test/fuzzer/src/types";
import { NonTerminal } from "@/test/fuzzer/src/uniform-expr-types";
import type { Type } from "@/test/fuzzer/src/types";
import type {
    NonTerminalEnum,
    TerminalEnum,
} from "@/test/fuzzer/src/uniform-expr-types";
import type { Scope } from "@/test/fuzzer/src/scope";
import { initializeGenerator } from "@/test/fuzzer/src/generators/uniform-expr-gen";
import type { GenInitConfig } from "@/test/fuzzer/src/generators/uniform-expr-gen";
import { FuzzConfig } from "@/test/fuzzer/src/config";
import { FuzzContext } from "@/test/fuzzer/src/context";

export type ExpressionParameters = {
    /**
     * Indicates whether the generated expression could use identifiers declared in the scope.
     * @default FuzzConfig.useIdentifiersInExpressions
     */
    useIdentifiersInExpressions: boolean;

    /**
     * The minimum expression size.
     * @default FuzzConfig.minExpressionSize
     */
    minExpressionSize: number;

    /**
     * The maximum expression size.
     * @default FuzzConfig.maxExpressionSize
     */
    maxExpressionSize: number;

    /**
     * Lists the non-terminals that the generator is allowed to use.
     * @default FuzzConfig.allowedNonTerminals
     */
    allowedNonTerminals: NonTerminalEnum[];

    /**
     * Lists the terminals that the generator is allowed to use.
     * @default FuzzConfig.allowedTerminals
     */
    allowedTerminals: TerminalEnum[];
};

export function makeSelfID(): Ast.Id {
    return FuzzContext.instance.makeF.makeDummyId("self");
}

/**
 * Generates expressions used in actual function call arguments.
 * @param funTy Signature of the function.
 * @param funScope Scope of the function.
 */
export function generateFunctionCallArgs(
    funTy: Type,
    funScope: Scope,
): fc.Arbitrary<Ast.Expression>[] {
    if (funTy.kind !== "function") {
        throw new Error(`Incorrect type for function: ${stringify(funTy, 0)}`);
    }
    if (funTy.signature.length === 1) {
        return [];
    }
    return funTy.signature
        .slice(0, -1)
        .map((argTy) => new Expression(funScope, argTy).generate());
}

/**
 * Generates expressions used in actual method call arguments.
 * @param methodTy Signature of the method.
 * @param methodScope Scope of the method.
 */
export function generateMethodCallArgs(
    methodTy: Type,
    methodScope: Scope,
): fc.Arbitrary<Ast.Expression>[] {
    if (methodTy.kind !== "function") {
        throw new Error(`Incorrect type for method: ${stringify(methodTy, 0)}`);
    }
    if (methodTy.signature.length === 2) {
        return [];
    }
    return methodTy.signature
        .slice(1, -1)
        .map((argTy) => new Expression(methodScope, argTy).generate());
}

/**
 * Generates method calls.
 */
export class MethodCall extends NamedGenerativeEntity<Ast.MethodCall> {
    constructor(
        type: Type,
        name: string,
        private src: Ast.Expression,
        private args?: fc.Arbitrary<Ast.Expression>[],
    ) {
        super(type, generateAstIdFromName(name));
    }
    generate(): fc.Arbitrary<Ast.MethodCall> {
        return packArbitraries(this.args).map((args) =>
            FuzzContext.instance.makeF.makeDummyMethodCall(
                this.src,
                this.name,
                args,
            ),
        );
    }
}

/**
 * Generates free function calls.
 */
export class StaticCall extends NamedGenerativeEntity<Ast.StaticCall> {
    constructor(
        type: Type,
        name: string,
        private args?: fc.Arbitrary<Ast.Expression>[],
    ) {
        super(type, generateAstIdFromName(name));
    }
    generate(): fc.Arbitrary<Ast.StaticCall> {
        return packArbitraries(this.args).map((args) =>
            FuzzContext.instance.makeF.makeDummyStaticCall(this.name, args),
        );
    }
}

/**
 * Contains the logic to generate expressions based on their types.
 */
export class Expression extends GenerativeEntity<Ast.Expression> {
    private static initializedGens: Map<
        string,
        (scope: Scope, type: NonTerminalEnum) => fc.Arbitrary<Ast.Expression>
    > = new Map();
    private parentScope: Scope;
    private exprGen: (
        scope: Scope,
        type: NonTerminalEnum,
    ) => fc.Arbitrary<Ast.Expression>;

    /**
     * @param parentScope Scope to extract declarations from.
     * @param type Type of the generated expression.
     * @param params Optional parameters for expression generation.
     */
    constructor(
        parentScope: Scope,
        type: Type,
        params: Partial<ExpressionParameters> = {},
    ) {
        super(type);
        this.parentScope = parentScope;

        const {
            useIdentifiersInExpressions = FuzzConfig.useIdentifiersInExpressions,
            minExpressionSize = FuzzConfig.minExpressionSize,
            maxExpressionSize = FuzzConfig.maxExpressionSize,
            allowedNonTerminals = FuzzConfig.allowedNonTerminalsInExpressions,
            allowedTerminals = FuzzConfig.allowedTerminalsInExpressions,
        } = params;
        const config: GenInitConfig = {
            minSize: minExpressionSize,
            maxSize: maxExpressionSize,
            allowedNonTerminals,
            allowedTerminals,
            useIdentifiers: useIdentifiersInExpressions,
        };
        const configKey = JSON.stringify(config);
        const initGen = Expression.initializedGens.get(configKey);
        if (typeof initGen === "undefined") {
            this.exprGen = initializeGenerator(config);
            Expression.initializedGens.set(configKey, this.exprGen);
        } else {
            this.exprGen = initGen;
        }
    }

    private getNonTerminalForType(
        type: StdlibType,
        optional: boolean,
    ): NonTerminalEnum {
        switch (type) {
            case StdlibType.Int: {
                return optional ? NonTerminal.TopOptInt : NonTerminal.Int;
            }
            case StdlibType.Bool: {
                return optional ? NonTerminal.TopOptBool : NonTerminal.Bool;
            }
            case StdlibType.Cell: {
                return optional ? NonTerminal.TopOptCell : NonTerminal.Cell;
            }
            case StdlibType.Address: {
                return optional
                    ? NonTerminal.TopOptAddress
                    : NonTerminal.Address;
            }
            case StdlibType.Slice: {
                return optional ? NonTerminal.TopOptSlice : NonTerminal.Slice;
            }
            case StdlibType.String: {
                return optional ? NonTerminal.TopOptString : NonTerminal.String;
            }
            case StdlibType.Builder:
            case StdlibType.StringBuilder:
                throw new Error(
                    `Generation of expressions of type ${stringify(type, 0)} is currently not supported.`,
                );
        }
    }

    /**
     * Generates an AST expression of the specified type.
     */
    generate(): fc.Arbitrary<Ast.Expression> {
        switch (this.type.kind) {
            case "stdlib": {
                const nonTerminal = this.getNonTerminalForType(
                    this.type.type,
                    false,
                );
                return this.exprGen(this.parentScope, nonTerminal);
            }
            case "optional": {
                switch (this.type.type.kind) {
                    case "stdlib": {
                        const nonTerminal = this.getNonTerminalForType(
                            this.type.type.type,
                            true,
                        );
                        return this.exprGen(this.parentScope, nonTerminal);
                    }
                    case "optional":
                    case "map":
                    case "struct":
                    case "message":
                    case "util":
                    case "function":
                        throw new Error(
                            `Generation of expressions of type ${stringify(this.type.type, 0)} is currently not supported.`,
                        );
                }
                break;
            }
            case "map":
            case "struct":
            case "message":
            case "util":
            case "function":
                throw new Error(
                    `Generation of expressions of type ${stringify(this.type, 0)} is currently not supported.`,
                );
        }
    }
}
