import {
  AstContract,
  AstConstantDef,
  AstFunctionDef,
  AstFieldDecl,
} from "../../../src/ast/ast";
import { createSample, generateAstId } from "../util";
import { FunctionDef } from "./function";
import { Trait } from "./trait";
import { Expression } from "./expression";
import { Receive } from "./receiver";
import { FunctionType, UtilType } from "../types";
import { Scope } from "../scope";
import { GenerativeEntity } from "./generator";

import fc from "fast-check";
import { Field } from "./field";
import { dummySrcInfo } from "../../../src/grammar/";

export interface ContractParameters {
  /**
   * Number of receive method generated within a contract.
   * @default 1
   */
  receiveNum: number;
}

/**
 * An object that encapsulates a randomly generated AstContract including extra information
 * about its entries and their scopes.
 */
export class Contract extends GenerativeEntity<AstContract> {
  /** Scope used within the generated contract. */
  private scope: Scope;

  private receiveNum: number;

  /**
   * @param methodSignatures Signatures of methods to be generated in the contract.
   * @param trait An optional trait that the generated contract must implement.
   */
  constructor(
    parentScope: Scope,
    private methodSignatures: FunctionType[],
    private trait?: Trait,
    params: Partial<ContractParameters> = {},
  ) {
    super({ kind: "util", type: UtilType.Contract });
    this.scope = new Scope("contract", parentScope);
    this.name = createSample(generateAstId(this.scope, "contract"));

    const { receiveNum = 1 } = params;
    this.receiveNum = receiveNum;
  }

  public generate(): fc.Arbitrary<AstContract> {
    // Implemented declarations from the trait
    let traitFields: fc.Arbitrary<AstFieldDecl>[] = [];
    let traitConstants: fc.Arbitrary<AstConstantDef>[] = [];
    let traitMethods: fc.Arbitrary<AstFunctionDef>[] = [];
    if (this.trait !== undefined) {
      traitFields = this.trait.fieldDeclarations.map(({ type, name }) => {
        const init = new Expression(this.scope, type, {
          compileTimeEval: true,
        }).generate();
        return new Field(this.scope, type, init, name).generate();
      });
      traitConstants = this.trait.constantDeclarations
        .map((decl) => {
          const init = new Expression(this.scope, decl.type, {
            compileTimeEval: true,
          }).generate();
          return decl
            .createDefinition(init)
            .generateWithAttrs([{ type: "override", loc: dummySrcInfo }]);
        })
        .concat(
          this.trait.constantDefinitions.map((def) =>
            def.generateWithAttrs([{ type: "override", loc: dummySrcInfo }]),
          ),
        );
      traitMethods = this.trait.methodDeclarations.map((m) => {
        return m.generateDefinition("method", [
          { kind: "function_attribute", type: "override", loc: dummySrcInfo },
          {
            kind: "function_attribute",
            type: "get",
            loc: dummySrcInfo,
            methodId: undefined,
          },
        ]);
      });
    }

    const requestedMethods = this.methodSignatures.map((signature) =>
      new FunctionDef(this.scope, "method", signature).generate(),
    );
    const generatedMethods = Array.from(this.scope.getAll("methodDef")).map(
      (m) => m.generate(),
    );
    const requestedReceives = Array.from({ length: this.receiveNum }).map((_) =>
      new Receive(this.scope).generate(),
    );
    const generatedConstants = Array.from(this.scope.getAll("constantDef")).map(
      (c) => c.generate(),
    );
    const generatedFields = Array.from(this.scope.getAll("field")).map((f) =>
      f.generate(),
    );
    return fc.record<AstContract>({
      kind: fc.constant("contract"),
      id: fc.constant(this.idx),
      name: fc.constant(this.name!),
      traits: fc.constant(this.trait === undefined ? [] : [this.trait.name!]),
      attributes: fc.constantFrom([]),
      declarations: fc.tuple(
        ...traitConstants,
        ...generatedConstants,
        ...traitFields,
        ...generatedFields,
        ...requestedReceives,
        ...traitMethods,
        ...generatedMethods,
        ...requestedMethods,
      ),
      loc: fc.constant(dummySrcInfo),
      params: fc.constant(undefined),
    });
  }
}
