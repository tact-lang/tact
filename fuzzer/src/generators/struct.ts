import {
  AstMessageDecl,
  AstStructDecl,
} from "../../../src/ast/ast";
import { Type, tyToString, StructField, throwTyError } from "../types";
import { Scope } from "../scope";
import { Field } from "./field";
import { generateAstIdFromName, packArbitraries } from "../util";
import { GenerativeEntity } from "./generator";
import { dummySrcInfo } from "../../../src/grammar/";

import fc from "fast-check";

/**
 * An object that generates AstStructDecl object.
 */
export class Struct extends GenerativeEntity<AstStructDecl> {
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

  generate(): fc.Arbitrary<AstStructDecl> {
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
    return fc.record<AstStructDecl>({
      kind: fc.constant("struct_decl"),
      id: fc.constant(this.idx),
      name: fc.constant(this.name!),
      fields: packArbitraries(fields),
      loc: fc.constant(dummySrcInfo),
    });
  }
}

/**
 * An object that generates AstMessageDecl object messages.
 */
export class Message extends GenerativeEntity<AstMessageDecl> {
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

  generate(): fc.Arbitrary<AstMessageDecl> {
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
    return fc.record<AstMessageDecl>({
      kind: fc.constant("message_decl"),
      id: fc.constant(this.idx),
      name: fc.constant(this.name!),
      opcode: fc.constant(undefined),
      fields: packArbitraries(fields),
      loc: fc.constant(dummySrcInfo),
    });
  }
}
