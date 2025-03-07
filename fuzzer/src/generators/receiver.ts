import {
  AstReceiver,
  AstStatement,
  AstString,
  AstReceiverKind,
} from "../../../src/ast/ast";
import { UtilType, Type, StdlibType, isBouncedMessage } from "../types";
import { Scope } from "../scope";
import { GenerativeEntity } from "./generator";
import { createSample, randomBool, randomElement } from "../util";
import { Expression, generateString } from "./expression";
import { Parameter } from "./parameter";
import { StatementExpression } from "./statement";

import fc from "fast-check";
import { dummySrcInfo } from "../../../src/grammar/";

const RECEIVE_RETURN_TY: Type = { kind: "util", type: UtilType.Unit };

/**
 * An object that encapsulates an AstReceiver.
 */
export class Receive extends GenerativeEntity<AstReceiver> {
  /** Generated body items. */
  private body: fc.Arbitrary<AstStatement>[] = [];

  /** Scope used within the generated receive method. */
  private scope: Scope;

  constructor(parentScope: Scope) {
    super(RECEIVE_RETURN_TY);
    this.scope = new Scope("receive", parentScope);
  }

  private generateSelector(): fc.Arbitrary<AstReceiverKind> {
    if (randomBool()) {
      const ty = createSample(
        fc.record<Type>({
          kind: fc.constant("stdlib"),
          type: fc.constantFrom(
            // TODO: Support Slice
            StdlibType.String,
          ),
        }),
      );
      const param = new Parameter(this.scope, ty);
      this.scope.add("parameter", param);
      const internalSimple = fc.record<AstReceiverKind>({ //TODO: make a real generatable from this
        kind: fc.constantFrom("internal"),
        param: param.generate(),
      });
      const externalSimple = fc.record<AstReceiverKind>({
        kind: fc.constantFrom("external-simple"),
        param: param.generate(),
      });
      return fc.oneof(internalSimple, externalSimple);
    }

    // Choose a random message and create a bounced receiver using it.
    const messages = this.scope.getProgramScope().getAll("message");
    if (messages.length > 0 && randomBool()) {
      const msg = randomElement(messages);
      const param = new Parameter(
        this.scope,
        msg.type,
        isBouncedMessage(msg.type),
      );
      this.scope.add("parameter", param);
      return fc.record<AstReceiverKind>({
        kind: fc.constantFrom("bounce"),
        param: param.generate(),
      });
    }

    const internalFallback = fc.record<AstReceiverKind>({
      kind: fc.constantFrom("internal-fallback"),
    });
    const externalFallback = fc.record<AstReceiverKind>({
      kind: fc.constantFrom("external-fallback"),
    });
    const internalComment = fc.record<AstReceiverKind>({
      kind: fc.constantFrom("internal-comment"),
      comment: generateString(/*nonEmpty=*/ true) as fc.Arbitrary<AstString>,
    });
    const externalComment = fc.record<AstReceiverKind>({
      kind: fc.constantFrom("external-comment"),
      comment: generateString(/*nonEmpty=*/ true) as fc.Arbitrary<AstString>,
    });

    return fc.oneof(
      internalFallback,
      externalFallback,
      internalComment,
      externalComment,
    );
  }

  private generateBody(): fc.Arbitrary<AstStatement[]> {
    // Create a dummy expression to execute the bottom-up AST generation.
    const expr = new Expression(this.scope, this.type).generate();
    const stmt = new StatementExpression(expr).generate();

    const generatedLetBindings = Array.from(this.scope.getAll("let")).map((c) =>
      c.generate(),
    );
    const generatedStmts = Array.from(this.scope.getAll("statement")).map((c) =>
      c.generate(),
    );
    this.body = [...generatedLetBindings, ...generatedStmts, stmt];
    return fc.tuple(...this.body);
  }

  public generate(): fc.Arbitrary<AstReceiver> {
    return fc.record<AstReceiver>({
      kind: fc.constant("receiver"),
      id: fc.constant(this.idx),
      selector: this.generateSelector(),
      statements: this.generateBody(),
      loc: fc.constant(dummySrcInfo),
    });
  }
}
