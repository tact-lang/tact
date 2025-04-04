import type * as Ast from "@/ast/ast";
import { tyToString, throwTyError } from "@/test/fuzzer/src/types";
import type { Type, StructField } from "@/test/fuzzer/src/types";
import type { Scope } from "@/test/fuzzer/src/scope";
import { Field } from "@/test/fuzzer/src/generators/field";
import {
    dummySrcInfoPrintable,
    generateAstIdFromName,
    packArbitraries,
} from "@/test/fuzzer/src/util";
import { NamedGenerativeEntity } from "@/test/fuzzer/src/generators/generator";

import fc from "fast-check";

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
        return fc.record<Ast.StructDecl>({
            kind: fc.constant("struct_decl"),
            id: fc.constant(this.idx),
            name: fc.constant(this.name),
            fields: packArbitraries(fields),
            loc: fc.constant(dummySrcInfoPrintable),
        });
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
        return fc.record<Ast.MessageDecl>({
            kind: fc.constant("message_decl"),
            id: fc.constant(this.idx),
            name: fc.constant(this.name!),
            opcode: fc.constant(undefined),
            fields: packArbitraries(fields),
            loc: fc.constant(dummySrcInfoPrintable),
        });
    }
}
