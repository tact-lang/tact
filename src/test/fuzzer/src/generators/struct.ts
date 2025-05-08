import type * as Ast from "@/ast/ast";
import { tyToString, throwTyError } from "@/test/fuzzer/src/types";
import type { Type, StructField } from "@/test/fuzzer/src/types";
import type { Scope } from "@/test/fuzzer/src/scope";
import { Field } from "@/test/fuzzer/src/generators/field";
import { generateAstIdFromName, packArbitraries } from "@/test/fuzzer/src/util";
import { NamedGenerativeEntity } from "@/test/fuzzer/src/generators/generator";

import type fc from "fast-check";
import { GlobalContext } from "@/test/fuzzer/src/context";

/**
 * An object that generates Ast.StructDecl object.
 */
export class Struct extends NamedGenerativeEntity<Ast.StructDecl> {
    /**
     * @param programScope A program scope the structure defined in.
     */
    constructor(
        private programScope: Scope,
        type: Type,
    ) {
        if (type.kind !== "struct") {
            throw new Error(
                `Cannot create a structure with the ${tyToString(type)} type`,
            );
        }
        if (!programScope.definedIn("program")) {
            throw new Error(
                `Cannot define a struct out of the program scope (got ${programScope.kind})`,
            );
        }
        super(type, generateAstIdFromName(type.name));
    }

    generate(): fc.Arbitrary<Ast.StructDecl> {
        if (this.type.kind !== "struct") {
            throwTyError(this.type);
        }
        const fields = this.type.fields.map((fieldTy: StructField) => {
            return new Field(
                this.programScope,
                fieldTy.type,
                fieldTy.default,
                generateAstIdFromName(fieldTy.name),
            ).generate();
        });
        return packArbitraries(fields).map((f) =>
            GlobalContext.makeF.makeDummyStructDecl(this.name, f),
        );
    }
}

/**
 * An object that generates Ast.MessageDecl object messages.
 */
export class Message extends NamedGenerativeEntity<Ast.MessageDecl> {
    /**
     * @param programScope A program scope the structure defined in.
     */
    constructor(
        private programScope: Scope,
        type: Type,
    ) {
        if (type.kind !== "message") {
            throw new Error(
                `Cannot create a message with the ${tyToString(type)} type`,
            );
        }
        if (!programScope.definedIn("program")) {
            throw new Error(
                `Cannot define a struct out of the program scope (got ${programScope.kind})`,
            );
        }
        super(type, generateAstIdFromName(type.name));
    }

    generate(): fc.Arbitrary<Ast.MessageDecl> {
        if (this.type.kind !== "message") {
            throwTyError(this.type);
        }
        const fields = this.type.fields.map((fieldTy: StructField) => {
            return new Field(
                this.programScope,
                fieldTy.type,
                fieldTy.default,
                generateAstIdFromName(fieldTy.name),
            ).generate();
        });
        return packArbitraries(fields).map((f) =>
            GlobalContext.makeF.makeDummyMessageDecl(this.name, undefined, f),
        );
    }
}
