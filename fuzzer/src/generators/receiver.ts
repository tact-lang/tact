import type {
    AstReceiver,
    AstStatement,
    AstReceiverKind,
    AstReceiverSubKind,
    AstReceiverSimple,
    AstReceiverFallback,
    AstReceiverComment,
} from "../../../src/ast/ast";
import { UtilType, StdlibType, isBouncedMessage } from "../types";
import type { Type } from "../types";
import { Scope } from "../scope";
import { GenerativeEntity } from "./generator";
import { createSample, randomBool, randomElement } from "../util";
import { Expression, generateString } from "./expression";
import { Parameter } from "./parameter";
import { StatementExpression } from "./statement";

import fc from "fast-check";
import { dummySrcInfo } from "../../../src/grammar/";
import { nextId } from "../id";

const RECEIVE_RETURN_TY: Type = { kind: "util", type: UtilType.Unit };

function generateReceiverSimpleSubKind(
    param: Parameter,
): fc.Arbitrary<AstReceiverSimple> {
    return fc.record<AstReceiverSimple>({
        kind: fc.constant("simple"),
        param: param.generate(),
        id: fc.constant(nextId()),
    });
}

function generateReceiverFallbackSubKind(): fc.Arbitrary<AstReceiverFallback> {
    return fc.record<AstReceiverFallback>({
        kind: fc.constant("fallback"),
        id: fc.constant(nextId()),
    });
}

function generateReceiverCommentSubKind(): fc.Arbitrary<AstReceiverComment> {
    return fc.record<AstReceiverComment>({
        kind: fc.constant("comment"),
        comment: generateString(/*nonEmpty=*/ true),
        id: fc.constant(nextId()),
    });
}

function generateRecieverKind(
    kind: "internal" | "external" | "comment",
    subKind: fc.Arbitrary<AstReceiverSubKind>,
): fc.Arbitrary<AstReceiverKind> {
    return fc.record<AstReceiverKind>({
        kind: fc.constant(kind),
        subKind,
        id: fc.constant(nextId()),
        loc: fc.constant(dummySrcInfo),
    } as any); //TODO: types are correct here, but i don't know how to explain to typescript, what T<A | B> is equal to T<A> | T<B>
}

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
            const internalSimple = generateRecieverKind(
                "internal",
                generateReceiverSimpleSubKind(param),
            );
            const externalSimple = generateRecieverKind(
                "external",
                generateReceiverSimpleSubKind(param),
            );
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
                id: fc.constant(nextId()),
                loc: fc.constant(dummySrcInfo),
            });
        }

        const internalFallback = generateRecieverKind(
            "internal",
            generateReceiverFallbackSubKind(),
        );
        const externalFallback = generateRecieverKind(
            "external",
            generateReceiverFallbackSubKind(),
        );
        const internalComment = generateRecieverKind(
            "internal",
            generateReceiverCommentSubKind(),
        );
        const externalComment = generateRecieverKind(
            "external",
            generateReceiverCommentSubKind(),
        );

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

        const generatedLetBindings = Array.from(this.scope.getAll("let")).map(
            (c) => c.generate(),
        );
        const generatedStmts = Array.from(this.scope.getAll("statement")).map(
            (c) => c.generate(),
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
