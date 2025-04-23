import type * as Ast from "@/ast/ast";
import {
    tyToAstType,
    StdlibType,
    isThis,
    getReturnType,
    isUnit,
    UtilType,
} from "@/test/fuzzer/src/types";
import type { FunctionType, Type } from "@/test/fuzzer/src/types";
import { Return } from "@/test/fuzzer/src/generators/statement";
import { Parameter } from "@/test/fuzzer/src/generators/parameter";
import { Scope } from "@/test/fuzzer/src/scope";
import {
    createSample,
    dummySrcInfoPrintable,
    generateAstId,
    generateAstIdFromName,
} from "@/test/fuzzer/src/util";
import { NamedGenerativeEntity } from "@/test/fuzzer/src/generators/generator";

import fc from "fast-check";
import { GlobalContext } from "@/test/fuzzer/src/context";

/**
 * Utility type, used inside function definition and declaration classes and in shared functions.
 */
type FunctionKind = "function" | "method";

export const SUPPORTED_RETURN_TYS = [
    StdlibType.Int,
    StdlibType.Bool,
    StdlibType.String,
];

function notHaveArguments(kind: FunctionKind, type: FunctionType): boolean {
    if (kind === "function") {
        return type.signature.length === 1;
    } else {
        const firstArg = type.signature[0];
        if (typeof firstArg === "undefined") {
            throw new Error(`unexpected 'undefined'`);
        }
        return isThis(firstArg) && type.signature.length === 2;
    }
}

/**
 * Creates parameters entries saving them in the scope of the function or method as variables.
 */
function generateParameters(
    kind: FunctionKind,
    type: FunctionType,
    scope: Scope,
): Ast.TypedParameter[] {
    if (notHaveArguments(kind, type)) {
        return [];
    }
    const slice =
        kind === "method"
            ? type.signature.slice(1, -1)
            : type.signature.slice(0, -1);
    return slice.map((argType) => {
        const param = new Parameter(scope, argType);
        scope.addNamed("parameter", param);
        return createSample(param.generate());
    });
}

/**
 * Prepares the final list of attributes based on function kind and the current implementation details.
 */
function getAttributes(
    extraAttrs: Ast.FunctionAttribute[],
    kind: FunctionKind,
    onlyDeclaration: boolean,
): Ast.FunctionAttribute[] {
    const attrs: Ast.FunctionAttribute[] = extraAttrs;

    // We are marking all the methods with the `get` attribute to ensure they
    // will be compiled to func and tested by compilation tests.
    // TODO: However, we cannot use `get` for abstract and overridden methods:
    // https://github.com/tact-lang/tact/issues/490
    if (kind === "method" && !extraAttrs.find((a) => a.type === "override")) {
        attrs.push({
            kind: "function_attribute",
            type: "get",
            loc: dummySrcInfoPrintable,
            methodId: undefined,
        });
    }

    if (onlyDeclaration) {
        attrs.push({
            kind: "function_attribute",
            type: "abstract",
            loc: dummySrcInfoPrintable,
        });
    }

    return attrs;
}

/**
 * An object that encapsulates the generated free function or contract method definition including
 * its scope and nested elements.
 */
export class FunctionDef extends NamedGenerativeEntity<Ast.FunctionDef> {
    /** Generated body items. */
    private body: fc.Arbitrary<Ast.Statement>[] = [];

    /** Scope used within the generated function. */
    private scope: Scope;

    private kind: FunctionKind;

    constructor(
        parentScope: Scope,
        kind: FunctionKind,
        type: FunctionType,
        name?: string,
    ) {
        const scope = new Scope(kind, parentScope);
        super(
            type,
            name
                ? generateAstIdFromName(name)
                : createSample(generateAstId(scope)),
        );
        this.scope = scope;
        this.kind = kind;
    }

    /**
     * Generates body of the function emitting return statement and statements generated from the bottom-up.
     */
    private generateBody(): fc.Arbitrary<Ast.Statement[]> {
        const type = this.type as FunctionType;
        const returnTy: Type =
            type.signature.length > 0
                ? getReturnType(type)
                : { kind: "util", type: UtilType.Unit };
        const returnStmt = new Return(this.scope, returnTy).generate();
        const generatedLetBindings = Array.from(
            this.scope.getAllNamed("let"),
        ).map((c) => c.generate());
        const generatedStmts = Array.from(
            this.scope.getAllUnnamed("statement"),
        ).map((c) => c.generate());
        this.body = [...generatedLetBindings, ...generatedStmts, returnStmt];
        return fc.tuple(...this.body);
    }

    public generateImpl(
        extraAttrs: Ast.FunctionAttribute[],
    ): fc.Arbitrary<Ast.FunctionDef> {
        const returnTy = getReturnType(this.type as FunctionType);
        return this.generateBody().map((stmt) =>
            GlobalContext.makeF.makeDummyFunctionDef(
                getAttributes(extraAttrs, this.kind, false),
                this.name,
                isUnit(returnTy) ? undefined : tyToAstType(returnTy),
                generateParameters(
                    this.kind,
                    this.type as FunctionType,
                    this.scope,
                ),
                stmt,
            ),
        );
    }

    /**
     * Generates a function definition without extra attributes.
     */
    public generate(): fc.Arbitrary<Ast.FunctionDef> {
        return this.generateImpl([]);
    }
}

/**
 * An object that encapsulates the generated free function or trait method declaration including
 * its scope and nested elements.
 */
export class FunctionDecl extends NamedGenerativeEntity<Ast.FunctionDecl> {
    /** Scope used within the generated function. */
    private scope: Scope;

    private kind: FunctionKind;

    constructor(parentScope: Scope, kind: FunctionKind, type: FunctionType) {
        const scope = new Scope(kind, parentScope);
        super(type, createSample(generateAstId(scope)));
        this.kind = "method";
        this.scope = scope;
    }

    private generateImpl(
        extraAttrs: Ast.FunctionAttribute[],
    ): fc.Arbitrary<Ast.FunctionDecl> {
        const returnTy = getReturnType(this.type as FunctionType);
        return fc.constant(
            GlobalContext.makeF.makeDummyFunctionDecl(
                getAttributes(extraAttrs, this.kind, true),
                this.name,
                isUnit(returnTy) ? undefined : tyToAstType(returnTy),
                generateParameters(
                    this.kind,
                    this.type as FunctionType,
                    this.scope,
                ),
            ),
        );
    }

    /**
     * Generates a function definition without extra attributes.
     */
    public generate(): fc.Arbitrary<Ast.FunctionDecl> {
        return this.generateImpl([]);
    }

    /**
     * Generates a new function definition for this declaration.
     */
    public generateDefinition(
        kind: FunctionKind,
        attrs: Ast.FunctionAttribute[] = [],
    ): fc.Arbitrary<Ast.FunctionDef> {
        return new FunctionDef(
            this.scope.parentScope!,
            kind,
            this.type as FunctionType,
            this.name.text,
        ).generateImpl(attrs);
    }
}
