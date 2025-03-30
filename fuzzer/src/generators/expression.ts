import type {
    AstBoolean,
    AstExpression,
    AstId,
    AstNull,
    AstNumber,
    AstOpBinary,
    AstFieldAccess,
    AstMethodCall,
    AstStaticCall,
    AstOpUnary,
    AstSimplifiedString,
    AstStructFieldInitializer,
    AstStructInstance,
    AstString,
} from "../../../src/ast/ast";
import { AstNumberBase } from "../../../src/ast/ast";
import JSONbig from "json-bigint";
import fc from "fast-check";

import { ConstantDecl, ConstantDef } from "./constant";
import { Let, Statement } from "./statement";
import { Field } from "./field";
import {
    randomBool,
    randomElement,
    packArbitraries,
    generateAstIdFromName,
    dummySrcInfoPrintable,
} from "../util";
import {
    GenerativeEntity,
    NamedGenerativeEntity,
    GenerativeEntityOpt,
} from "./generator";
import { nextId } from "../id";
import {
    StdlibType,
    tyToString,
    tyEq,
    UtilType,
    throwTyError,
    makeFunctionTy,
} from "../types";
import type { StructField, Type } from "../types";
import { GlobalContext } from "../context";
import type { Scope } from "../scope";
import { FunctionDef } from "./function";

export function generateNumber(
    base?: AstNumberBase,
    constValue?: bigint,
): fc.Arbitrary<AstExpression> {
    const value =
        constValue === undefined ? fc.bigInt() : fc.constantFrom(constValue);
    return fc.record<AstNumber>({
        kind: fc.constant("number"),
        id: fc.constant(nextId()),
        value,
        loc: fc.constant(dummySrcInfoPrintable),
        base: base ? fc.constant(base) : fc.constantFrom(2, 8, 10, 16),
    });
}

export function generateBoolean(
    constValue?: boolean,
): fc.Arbitrary<AstBoolean> {
    const value =
        constValue === undefined ? fc.boolean() : fc.constantFrom(constValue);
    return fc.record<AstBoolean>({
        kind: fc.constant("boolean"),
        id: fc.constant(nextId()),
        value,
        loc: fc.constant(dummySrcInfoPrintable),
    });
}

function generateStringValue(
    nonEmpty: boolean = false,
    constValue?: string,
): fc.Arbitrary<string> {
    return constValue === undefined
        ? nonEmpty
            ? fc.string({ minLength: 1 })
            : fc.string()
        : fc.constantFrom(constValue);
}

export function generateSimplifiedString(
    nonEmpty: boolean = false,
    constValue?: string,
): fc.Arbitrary<AstSimplifiedString> {
    return fc.record<AstSimplifiedString>({
        kind: fc.constant("simplified_string"),
        id: fc.constant(nextId()),
        value: generateStringValue(nonEmpty, constValue),
        loc: fc.constant(dummySrcInfoPrintable),
    });
}

export function generateString(
    nonEmpty: boolean = false,
    constValue?: string,
): fc.Arbitrary<AstString> {
    return fc.record<AstString>({
        kind: fc.constant("string"),
        id: fc.constant(nextId()),
        value: generateStringValue(nonEmpty, constValue),
        loc: fc.constant(dummySrcInfoPrintable),
    });
}

export function generateNull(): fc.Arbitrary<AstNull> {
    return fc.record<AstNull>({
        kind: fc.constant("null"),
        id: fc.constant(nextId()),
        loc: fc.constant(dummySrcInfoPrintable),
    });
}

export function generateFieldAccess(
    name: string,
    aggregate?: AstExpression,
): AstFieldAccess {
    return {
        kind: "field_access",
        aggregate: aggregate ?? generateThisID(),
        field: generateAstIdFromName(name),
        id: nextId(),
        loc: dummySrcInfoPrintable,
    };
}

export function generateThisID(): AstId {
    return {
        kind: "id",
        id: nextId(),
        text: "self",
        loc: dummySrcInfoPrintable,
    };
}

/**
 * Generates an value that could be assigned to any variable with the `Map` type.
 */
export function generateMapInit(
    ty: Type,
    scope: Scope,
): fc.Arbitrary<AstExpression> {
    if (scope.definedIn("block", "method", "function") && randomBool()) {
        return new StaticCall(ty, "emptyMap", []).generate();
    } else {
        return generateNull();
    }
}

/**
 * Generates an value that could be assigned to a struct instance.
 */
export function generateStructInit(
    ty: Type,
    scope: Scope,
): fc.Arbitrary<AstStructInstance> {
    if (ty.kind !== "struct" && ty.kind !== "message") {
        throwTyError(ty);
    }
    const args: fc.Arbitrary<AstStructFieldInitializer>[] = ty.fields.map(
        (field: StructField) => {
            return fc.record<AstStructFieldInitializer>({
                kind: fc.constant("struct_field_initializer"),
                id: fc.constant(nextId()),
                field: fc.constant(generateAstIdFromName(field.name)),
                initializer: new Expression(scope, field.type).generate(),
                loc: fc.constant(dummySrcInfoPrintable),
            });
        },
    );
    return fc.record<AstStructInstance>({
        kind: fc.constantFrom("struct_instance"),
        id: fc.constantFrom(nextId()),
        type: fc.constantFrom(generateAstIdFromName(tyToString(ty))),
        args: packArbitraries(args),
        loc: fc.constant(dummySrcInfoPrintable),
    });
}

/**
 * Generates expressions used in actual function call arguments.
 * @param funTy Signature of the function.
 * @param funScope Scope of the function.
 */
export function generateFunctionCallArgs(
    funTy: Type,
    funScope: Scope,
): fc.Arbitrary<AstExpression>[] {
    if (funTy.kind !== "function") {
        throw new Error(
            `Incorrect type for function: ${JSONbig.stringify(funTy)}`,
        );
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
): fc.Arbitrary<AstExpression>[] {
    if (methodTy.kind !== "function") {
        throw new Error(
            `Incorrect type for method: ${JSONbig.stringify(methodTy)}`,
        );
    }
    if (methodTy.signature.length === 2) {
        return [];
    }
    return methodTy.signature
        .slice(1, -1)
        .map((argTy) => new Expression(methodScope, argTy).generate());
}

/**
 * Generates field and contract constants access operations.
 */
export class FieldAccess extends NamedGenerativeEntity<AstFieldAccess> {
    constructor(
        type: Type,
        fieldName: string,
        private src?: AstId,
    ) {
        super(type, generateAstIdFromName(fieldName));
    }

    generate(): fc.Arbitrary<AstFieldAccess> {
        return fc.record<AstFieldAccess>({
            kind: fc.constant("field_access"),
            aggregate: fc.constant(this.src ?? generateThisID()),
            field: fc.constant(this.name),
            id: fc.constant(this.idx),
            loc: fc.constant(dummySrcInfoPrintable),
        });
    }
}

/**
 * Generates method calls.
 */
export class MethodCall extends NamedGenerativeEntity<AstMethodCall> {
    constructor(
        type: Type,
        name: string,
        private src: AstExpression,
        private args?: fc.Arbitrary<AstExpression>[],
    ) {
        super(type, generateAstIdFromName(name));
    }
    generate(): fc.Arbitrary<AstMethodCall> {
        return fc.record<AstMethodCall>({
            kind: fc.constant("method_call"),
            self: fc.constant(this.src),
            method: fc.constant(this.name),
            args: packArbitraries(this.args),
            id: fc.constant(this.idx),
            loc: fc.constant(dummySrcInfoPrintable),
        });
    }
}

/**
 * Generates free function calls.
 */
export class StaticCall extends NamedGenerativeEntity<AstStaticCall> {
    constructor(
        type: Type,
        name: string,
        private args?: fc.Arbitrary<AstExpression>[],
    ) {
        super(type, generateAstIdFromName(name));
    }
    generate(): fc.Arbitrary<AstStaticCall> {
        return fc.record<AstStaticCall>({
            kind: fc.constant("static_call"),
            function: fc.constantFrom(this.name),
            args: packArbitraries(this.args),
            id: fc.constant(this.idx),
            loc: fc.constant(dummySrcInfoPrintable),
        });
    }
}

export namespace OpUnary {
    function generate(
        args: fc.Arbitrary<AstExpression>[],
        allowedOps: readonly AstOpUnary["op"][],
    ): fc.Arbitrary<AstOpUnary> {
        return fc.letrec((tie) => ({
            astExpression: fc.oneof(
                { maxDepth: 1 },
                ...args.map((gen) => ({ arbitrary: gen, weight: 1 })),
                {
                    arbitrary: tie("astOpUnary"),
                    weight: 1,
                },
            ),
            astOpUnary: fc.record<AstOpUnary>({
                kind: fc.constant("op_unary"),
                id: fc.constant(nextId()),
                op: fc.constantFrom(...allowedOps),
                loc: fc.constant(dummySrcInfoPrintable),
                operand: tie("astExpression") as fc.Arbitrary<AstExpression>,
            }),
        })).astOpUnary;
    }

    // Generates numeric expressions
    // num -> num
    export const Num = generate([generateNumber()], ["+", "-"]);

    // Generates boolean expressions
    // bool -> bool
    export const Bool = generate([generateBoolean()], ["!"]);

    // TODO: Handle optionals (`!!`)
}

export namespace OpBinary {
    export function generate(
        args: fc.Arbitrary<AstExpression>[],
        allowedOps: readonly AstOpBinary["op"][],
    ): fc.Arbitrary<AstOpBinary> {
        return fc.letrec((tie) => ({
            astExpression: fc.oneof(
                { maxDepth: 1 },
                ...args.map((gen) => ({ arbitrary: gen, weight: 1 })),
                {
                    arbitrary: tie("astOpBinary"),
                    weight: 1,
                },
            ),
            astOpBinary: fc.record<AstOpBinary>({
                kind: fc.constant("op_binary"),
                id: fc.constant(nextId()),
                op: fc.constantFrom(...allowedOps),
                left: tie("astExpression") as fc.Arbitrary<AstExpression>,
                right: tie("astExpression") as fc.Arbitrary<AstExpression>,
                loc: fc.constant(dummySrcInfoPrintable),
            }),
        })).astOpBinary;
    }

    // num -> num -> num
    export const NumOps: AstOpBinary["op"][] = [
        "+",
        "-",
        "*",
        "/",
        "%",
        "<<",
        ">>",
        "&",
        "|",
    ];
    export const NumGens = [generateNumber(), OpUnary.Num];

    // bool -> bool -> bool
    export const BoolOps: AstOpBinary["op"][] = ["&&", "||"];
    export const BoolGens = [
        generateBoolean(),
        OpUnary.Bool,
        // bool -> bool -> bool
        generate([generateBoolean()], BoolOps),
        // num -> num -> bool
        // mkAstOpBinaryGen([ Primitive.NumberGen ],
        //                  ["==", "!=", "&&", "||"]),
    ];
}

/**
 * Generates struct field access expressions, e.g., `myStruct.a`.
 * This class wraps up the logic that finds an appropriate struct and field that match
 * the desired type and creates an access expression.
 */
export class StructAccess extends GenerativeEntityOpt<
    AstExpression | undefined
> {
    constructor(
        private parentScope: Scope,
        private resultTy: Type,
    ) {
        super(resultTy);
    }

    generate(): fc.Arbitrary<AstFieldAccess> | undefined {
        const structEntries = this.findStructsWithMatchingFields();
        if (structEntries.size === 0) {
            return undefined; // No suitable struct found
        }
        let structVarNames = this.findVariablesOfStructTypes(structEntries);
        if (structVarNames.size === 0) {
            structVarNames = this.createStructInstance(structEntries);
        }
        return this.createFieldAccessExpression(structEntries, structVarNames);
    }

    /**
     * Collects structs that have fields returning the desired `resultTy`.
     */
    private findStructsWithMatchingFields(): Map<string, [Type, string[]]> {
        return this.parentScope
            .getItemsRecursive("struct")
            .reduce((acc, struct) => {
                if (struct.type.kind !== "struct") {
                    throwTyError(struct.type);
                }
                const matchingFieldNames = struct.type.fields.reduce(
                    (acc, field) => {
                        if (tyEq(field.type, this.resultTy)) {
                            acc.push(field.name);
                        }
                        return acc;
                    },
                    [] as string[],
                );
                if (matchingFieldNames.length > 0) {
                    acc.set(struct.name.text, [
                        struct.type,
                        matchingFieldNames,
                    ]);
                }
                return acc;
            }, new Map<string, [Type, string[]]>());
    }

    /**
     * Finds local variables that have a type defined by `structEntries`.
     */
    private findVariablesOfStructTypes(
        structEntries: Map<string, [Type, string[]]>,
    ): Map<string, [Type, string[]]> {
        return Array.from(structEntries.keys()).reduce((acc, structName) => {
            const structType = structEntries.get(structName)![0];
            const variableNames = this.parentScope.getNamesRecursive(
                "let",
                structType,
            );
            if (variableNames.length > 0) {
                acc.set(structName, [structType, variableNames]);
            }
            return acc;
        }, new Map<string, [Type, string[]]>());
    }

    /**
     * Defines a local variable with a struct type that has matching fields.
     * @returns Updated variables map.
     */
    private createStructInstance(
        structEntries: Map<string, [Type, string[]]>,
    ): Map<string, [Type, string[]]> {
        const chosenStructName = randomElement(
            Array.from(structEntries.keys()),
        );
        const structType = structEntries.get(chosenStructName)![0];
        const initExpr = new Expression(
            this.parentScope,
            structType,
        ).generate();
        const varStmt = new Let(this.parentScope, structType, initExpr);
        this.parentScope.addNamed("let", varStmt);
        return new Map([[chosenStructName, [structType, [varStmt.name.text]]]]);
    }

    /**
     * Creates a field access expression for one of the available variables of the struct types.
     */
    private createFieldAccessExpression(
        structEntries: Map<string, [Type, string[]]>,
        structVarNames: Map<string, [Type, string[]]>,
    ): fc.Arbitrary<AstFieldAccess> {
        const chosenStructName = randomElement(
            Array.from(structVarNames.keys()),
        );
        const [_, varNames] = structVarNames.get(chosenStructName)!;
        const varName = randomElement(varNames);
        const fieldName = randomElement(
            structEntries.get(chosenStructName)![1],
        );
        return new FieldAccess(
            this.resultTy,
            fieldName,
            generateAstIdFromName(varName),
        ).generate();
    }
}

export interface ExpressionParameters {
    /**
     * Determines whether functions should be generated in this run.
     * @default true
     */
    generateFunctions: boolean;

    /**
     * Determines whether contract methods should be generated in this run.
     * @default true
     */
    generateMethods: boolean;

    /**
     * Determines whether constants should be generated in this run.
     * @default true
     */
    generateConstants: boolean;

    /**
     * Determines whether contract fields should be generated in this run.
     * @default true
     */
    generateFields: boolean;

    /**
     * Determines whether statements should be generated in this run.
     * @default true
     */
    generateStatements: boolean;

    /**
     * Indicates whether the generated expression must be evaluable at compile time.
     * @default false
     */
    compileTimeEval: boolean;

    /**
     * Number of the generated linear-flow statements in the block.
     * @default 2
     */
    generatedStatementsNum: number;
}

export const NonGenerativeExpressionParams: Partial<ExpressionParameters> = {
    generateFunctions: false,
    generateMethods: false,
    generateConstants: false,
    generateFields: false,
    generateStatements: false,
};

/**
 * Contains the logic to generate expressions based on their types.
 * AST generation proceeds from the bottom up, meaning the expression generator
 * may recursively create additional constructs, such as functions and constants,
 * in outer scopes.
 */
export class Expression extends GenerativeEntity<AstExpression> {
    private generateFunctions: boolean;
    private generateMethods: boolean;
    private generateConstants: boolean;
    private generateFields: boolean;
    private generateStatements: boolean;
    private compileTimeEval: boolean;
    private generatedStatementsNum: number;

    /**
     * @param parentScope Scope the generated expression belongs to.
     * @param type Type of the generated expression.
     * @param params Optional parameters for expression generation.
     */
    constructor(
        private parentScope: Scope,
        type: Type,
        params: Partial<ExpressionParameters> = {},
    ) {
        super(type);

        const {
            generateFunctions = true,
            generateMethods = true,
            generateConstants = true,
            generateFields = true,
            generateStatements = true,
            compileTimeEval = false,
            generatedStatementsNum = 2,
        } = params;
        this.generateFunctions = generateFunctions;
        this.generateMethods = generateMethods;
        this.generateConstants = generateConstants;
        this.generateFields = generateFields;
        this.generateStatements = generateStatements;
        this.compileTimeEval = compileTimeEval;
        this.generatedStatementsNum = generatedStatementsNum;

        // Forcefully change the parameters based on the current context state to avoid endless recursion.
        if (GlobalContext.getDepth() >= GlobalContext.config.maxDepth) {
            this.generateFunctions = false;
            this.generateMethods = false;
            this.generateConstants = false;
            this.generateFields = false;
            this.generateStatements = false;
        }
        GlobalContext.incDepth();
    }

    /**
     * Generates or chooses an available constant and makes a "use" expression from it.
     * @return Use of the generated constant, or `undefined` if that type is unsupported.
     */
    private makeConstantUse(ty: Type): fc.Arbitrary<AstExpression> | undefined {
        if (this.compileTimeEval || !this.generateConstants) {
            return undefined;
        }
        // Don't generate constants that cannot be initialized in compile time: https://github.com/tact-lang/tact/issues/284
        if (
            ty.kind === "map" ||
            ty.kind === "struct" ||
            ty.kind === "message"
        ) {
            return undefined;
        }

        // Collect suitable constants names
        let constantNames = this.parentScope
            .getNamesRecursive("constantDef", ty)
            .concat(this.parentScope.getNamesRecursive("constantDecl", ty));
        // Trait constants cannot be used within trait method definitions
        const traitScope = this.parentScope.findParent("trait");
        if (traitScope !== undefined) {
            const traitConstantNames = new Set(
                traitScope
                    .getNames("constantDef", ty)
                    .concat(traitScope.getNames("constantDecl", ty)),
            );
            constantNames = constantNames.filter(
                (name) => !traitConstantNames.has(name),
            );
            // Don't generate new constants inside traits, since they cannot be used
            if (constantNames.length === 0) {
                return undefined;
            }
        }

        let scope = this.parentScope; // scope to add/use a constant
        if (constantNames.length === 0) {
            scope =
                this.parentScope.definedIn("program") || randomBool()
                    ? this.parentScope
                    : this.parentScope.parentScope!;
            // NOTE: Mandatory for contracts; see: tact#332.
            const init =
                scope.definedIn("contract", "method") || randomBool()
                    ? new Expression(this.parentScope, ty, {
                          compileTimeEval: true,
                      }).generate()
                    : undefined;
            if (init) {
                const constant = ConstantDef.fromScope(scope, ty, init);
                this.parentScope.addNamed("constantDef", constant);
                constantNames.push(constant.name.text);
            } else {
                const constant = new ConstantDecl(scope, ty);
                this.parentScope.addNamed("constantDecl", constant);
                constantNames.push(constant.name.text);
            }
        }
        const arbs = scope.definedIn("contract", "method")
            ? constantNames.map((name) => new FieldAccess(ty, name).generate())
            : constantNames.map((name) =>
                  fc.constant(generateAstIdFromName(name)),
              );
        return arbs.length > 0 ? fc.oneof(...arbs) : undefined;
    }

    /**
     * Generates or chooses an available field and makes a "use" expression from it.
     * @return Use expression of the generated field, or `undefined` if cannot create it.expre
     */
    private makeFieldUse(ty: Type): fc.Arbitrary<AstFieldAccess> | undefined {
        if (
            this.compileTimeEval ||
            !this.generateFields ||
            !this.parentScope.definedIn("method") ||
            this.parentScope.hasParent("trait")
        ) {
            return undefined;
        }

        // Struct fields cannot be initialized in compile time: https://github.com/tact-lang/tact/issues/284
        // TODO: Therefore they must be initialized in the init function.
        if (ty.kind === "struct" || ty.kind === "message") {
            return undefined;
        }

        const fieldNames = this.parentScope.getNamesRecursive("field", ty);
        if (fieldNames.length === 0) {
            // NOTE: This init is mandatory since we don't generate init functions yet.
            // Maps cannot be initialized in compile-time.
            const init =
                ty.kind === "map"
                    ? undefined
                    : new Expression(this.parentScope, ty, {
                          compileTimeEval: true,
                      }).generate();
            const field = new Field(this.parentScope, ty, init);
            this.parentScope.addNamed("field", field);
            fieldNames.push(field.name.text);
        }
        const arbs = fieldNames.map((name) =>
            new FieldAccess(ty, name).generate(),
        );
        return arbs.length > 0 ? fc.oneof(...arbs) : undefined;
    }

    /**
     * Generates or chooses an available local variables and makes a "use" expression from it.
     * The process of generating local variables involves creating new statements in the function/method body.
     * @return Use expression of the generated local variable, or `undefined` if cannot create it.
     */
    private makeLocalVarUse(ty: Type): fc.Arbitrary<AstId> | undefined {
        if (
            this.compileTimeEval ||
            !this.generateStatements ||
            !this.parentScope.definedIn("method", "function")
        ) {
            return undefined;
        }
        const varNames = this.parentScope.getNamesRecursive("let", ty);
        if (varNames.length === 0) {
            const init = new Expression(this.parentScope, ty).generate();
            const varStmt = new Let(this.parentScope, ty, init);
            this.parentScope.addNamed("let", varStmt);
            varNames.push(varStmt.name.text);
        }
        const arbs = varNames.map((name) =>
            fc.constant(generateAstIdFromName(name)),
        );
        return arbs.length > 0 ? fc.oneof(...arbs) : undefined;
    }

    /**
     * Generates or chooses an available local variables of a struct type and makes an expression that accesses a struct field.
     * The process of generating local variables involves creating new statements in the function/method body.
     * @return Use expression of the generated local variable, or `undefined` if cannot create it.
     */
    private makeStructFieldAccess(
        ty: Type,
    ): fc.Arbitrary<AstFieldAccess> | undefined {
        if (
            this.compileTimeEval ||
            !this.generateStatements ||
            !this.parentScope.definedIn("method", "function")
        ) {
            return undefined;
        }
        return new StructAccess(this.parentScope, ty).generate();
    }

    /**
     * Generates statements in the block that uses local and global variables.
     */
    private generateStatementsInBlock(): void {
        if (
            !this.generateStatements ||
            this.parentScope.definedIn("program", "contract")
        ) {
            return;
        }
        Array.from({ length: this.generatedStatementsNum }).forEach(() => {
            const stmt = new Statement(this.parentScope);
            this.parentScope.addUnnamed("statement", stmt);
        });
    }

    /**
     * Generates or chooses an available free function and makes a call expression from it.
     * @return Use expression of the generated call, or `undefined` if it is not possible to create it.
     */
    private makeFunCall(
        returnTy: Type,
    ): fc.Arbitrary<AstStaticCall> | undefined {
        if (this.compileTimeEval || !this.generateFunctions) {
            return undefined;
        }
        const funNames = this.parentScope
            .findFunction("functionDef", returnTy)
            .concat(this.parentScope.findFunction("methodDef", returnTy));
        if (funNames.length === 0) {
            const programScope = this.parentScope.getProgramScope();
            const funTy = makeFunctionTy("function", returnTy);
            const fun = new FunctionDef(programScope, "function", funTy);
            this.parentScope.addNamed("functionDef", fun);
            funNames.push([fun.name.text, funTy]);
        }
        const arbs = funNames.map(([name, funTy]) =>
            new StaticCall(
                returnTy,
                name,
                generateFunctionCallArgs(funTy, this.parentScope),
            ).generate(),
        );
        return arbs.length > 0 ? fc.oneof(...arbs) : undefined;
    }

    /**
     * Generates or chooses an available method and makes a call expression from it.
     * @return Use expression of the generated call, or `undefined` if it is not possible to create it.
     */
    private makeMethodCall(
        returnTy: Type,
    ): fc.Arbitrary<AstExpression> | undefined {
        if (
            this.compileTimeEval ||
            !this.generateMethods ||
            this.parentScope.definedIn("program", "function") ||
            this.parentScope.hasParent("trait")
        ) {
            return undefined;
        }

        // Collect the available standard library methods
        const stdlibArbs = [
            // self.map_field.get(key)
            ...this.parentScope
                .getNamedEntriesRecursive("field")
                .reduce((acc, [mapName, mapTy]) => {
                    if (
                        mapTy.kind === "map" &&
                        tyEq(mapTy.type.value, returnTy)
                    ) {
                        const opCall = new MethodCall(
                            returnTy,
                            "get",
                            {
                                kind: "id",
                                id: nextId(),
                                text: mapName,
                                loc: dummySrcInfoPrintable,
                            },
                            [
                                fc.constantFrom(generateThisID()),
                                new Expression(
                                    this.parentScope,
                                    mapTy.type.key,
                                ).generate(),
                            ],
                        ).generate();
                        acc.push(opCall);
                    }
                    return acc;
                }, [] as fc.Arbitrary<AstExpression>[]),
            // map_var.get(key)
            ...this.parentScope
                .getNamedEntriesRecursive("let")
                .reduce((acc, [mapName, mapTy]) => {
                    if (
                        mapTy.kind === "map" &&
                        tyEq(mapTy.type.value, returnTy)
                    ) {
                        const opCall = new MethodCall(
                            returnTy,
                            "get",
                            {
                                kind: "id",
                                id: nextId(),
                                text: mapName,
                                loc: dummySrcInfoPrintable,
                            },
                            [
                                new Expression(
                                    this.parentScope,
                                    mapTy.type.key,
                                ).generate(),
                            ],
                        ).generate();
                        acc.push(opCall);
                    }
                    return acc;
                }, [] as fc.Arbitrary<AstExpression>[]),
        ];

        // Generate or collect the available user-defined methods
        const userMethods: [string, Type][] = this.parentScope.findFunction(
            "methodDef",
            returnTy,
        );
        if (userMethods.length === 0) {
            const contractScope = this.parentScope.getContractScope();
            if (contractScope === undefined) {
                return undefined;
            }
            const methodTy = makeFunctionTy("method", returnTy);
            const method = new FunctionDef(contractScope, "method", methodTy);
            this.parentScope.addNamed("methodDef", method);
            userMethods.push([method.name.text, methodTy]);
        }
        const userArbs = userMethods.map(([name, methodTy]) =>
            new MethodCall(
                returnTy,
                name,
                generateThisID(),
                generateMethodCallArgs(methodTy, this.parentScope),
            ).generate(),
        );
        return userArbs.length > 0 && stdlibArbs.length > 0
            ? fc.oneof(...userArbs, ...stdlibArbs)
            : undefined;
    }

    /** Generates `require` function call. */
    private generateRequireCall(): fc.Arbitrary<AstStaticCall> {
        const condition = new Expression(this.parentScope, {
            kind: "stdlib",
            type: StdlibType.Bool,
        }).generate();
        const error = new Expression(this.parentScope, {
            kind: "stdlib",
            type: StdlibType.String,
        }).generate();
        return new StaticCall(
            { kind: "util", type: UtilType.Unit },
            "require",
            [condition, error],
        ).generate();
    }

    /**
     * Generates expressions that returns the given standard type when evaluated.
     */
    private generateExpressions(ty: Type): fc.Arbitrary<AstExpression> {
        const funCall = this.makeFunCall(ty);
        const methodCall = this.makeMethodCall(ty);
        const constant = this.makeConstantUse(ty);
        const field = this.makeFieldUse(ty);
        const localVarUse = this.makeLocalVarUse(ty);
        const structVarAccess = this.makeStructFieldAccess(ty);

        // Add statements to bodies of functions/methods
        this.generateStatementsInBlock();

        const baseGenerator = (() => {
            if (ty.kind === "stdlib") {
                switch (ty.type) {
                    case StdlibType.Int:
                        return [generateNumber()];
                    case StdlibType.Bool:
                        return [generateBoolean()];
                    case StdlibType.String:
                        return [generateString()];
                    default:
                        throwTyError(ty);
                }
            } else if (ty.kind === "map") {
                return [generateMapInit(this.type, this.parentScope)];
            } else if (ty.kind === "struct") {
                return [generateStructInit(this.type, this.parentScope)];
            } else if (ty.kind === "util" && ty.type === UtilType.Unit) {
                return [this.generateRequireCall()];
            } else {
                throwTyError(ty);
            }
        })();

        return fc.oneof(
            ...baseGenerator,
            ...(funCall ? [funCall] : []),
            ...(methodCall ? [methodCall] : []),
            ...(constant ? [constant] : []),
            ...(field ? [field] : []),
            ...(localVarUse ? [localVarUse] : []),
            ...(structVarAccess ? [structVarAccess] : []),
        );
    }

    /**
     * Generates an AST expression from the specified type.
     * During expression generation, the generator creates new AST entries in the outer scopes,
     * including functions and constants saving them to the given context.
     */
    generate(): fc.Arbitrary<AstExpression> {
        let expr: fc.Arbitrary<AstExpression>;
        switch (this.type.kind) {
            case "stdlib":
            case "map":
            case "struct":
            case "message":
            case "util":
                expr = this.generateExpressions(this.type);
                break;
            case "function":
                throw new Error(
                    `Cannot generate an expression from type: ${JSONbig.stringify(this.type)}`,
                );
        }
        return expr;
    }
}
