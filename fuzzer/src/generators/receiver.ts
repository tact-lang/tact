import type {
    Receiver as AstReceiver,
    Statement as AstStatement,
    ReceiverKind as AstReceiverKind,
    ReceiverSubKind as AstReceiverSubKind,
    ReceiverSimple as AstReceiverSimple,
    ReceiverFallback as AstReceiverFallback,
    ReceiverComment as AstReceiverComment,
} from "../../../src/ast/ast";
import { UtilType, StdlibType, isBouncedMessage } from "../types";
import type { Type } from "../types";
import { Scope } from "../scope";
import { GenerativeEntity } from "./generator";
import {
    createSample,
    dummySrcInfoPrintable,
    randomBool,
    randomElement,
} from "../util";
import { Expression, generateString } from "./expression";
import { Parameter } from "./parameter";
import { StatementExpression } from "./statement";

import fc from "fast-check";
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

function generateInternalReceiverKind(
    subKind: fc.Arbitrary<AstReceiverSubKind>,
): fc.Arbitrary<AstReceiverKind> {
    return fc.record<AstReceiverKind>({
        kind: fc.constant("internal"),
        subKind,
        id: fc.constant(nextId()),
        loc: fc.constant(dummySrcInfoPrintable),
    });
}

function generateExternalReceiverKind(
    subKind: fc.Arbitrary<AstReceiverSubKind>,
): fc.Arbitrary<AstReceiverKind> {
    return fc.record<AstReceiverKind>({
        kind: fc.constant("external"),
        subKind,
        id: fc.constant(nextId()),
        loc: fc.constant(dummySrcInfoPrintable),
    });
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
            this.scope.addNamed("parameter", param);
            const internalSimple = generateInternalReceiverKind(
                generateReceiverSimpleSubKind(param),
            );
            const externalSimple = generateExternalReceiverKind(
                generateReceiverSimpleSubKind(param),
            );
            return fc.oneof(internalSimple, externalSimple);
        }

        // Choose a random message and create a bounced receiver using it.
        const messages = this.scope.getProgramScope().getAllNamed("message");
        if (messages.length > 0 && randomBool()) {
            const msg = randomElement(messages);
            const param = new Parameter(
                this.scope,
                msg.type,
                isBouncedMessage(msg.type),
            );
            this.scope.addNamed("parameter", param);
            return fc.record<AstReceiverKind>({
                kind: fc.constantFrom("bounce"),
                param: param.generate(),
                id: fc.constant(nextId()),
                loc: fc.constant(dummySrcInfoPrintable),
            });
        }

        const internalFallback = generateInternalReceiverKind(
            generateReceiverFallbackSubKind(),
        );
        const externalFallback = generateExternalReceiverKind(
            generateReceiverFallbackSubKind(),
        );
        const internalComment = generateInternalReceiverKind(
            generateReceiverCommentSubKind(),
        );
        const externalComment = generateExternalReceiverKind(
            generateReceiverCommentSubKind(),
        );

        return fc.oneof(
            internalFallback,
            externalFallback,
            internalComment,
            externalComment,
        ); // TODO: add bounce receiver generation
    }

    private generateBody(): fc.Arbitrary<AstStatement[]> {
        // Create a dummy expression to execute the bottom-up AST generation.
        const expr = new Expression(this.scope, this.type).generate();
        const stmt = new StatementExpression(expr).generate();

        const generatedLetBindings = Array.from(
            this.scope.getAllNamed("let"),
        ).map((c) => c.generate());
        const generatedStmts = Array.from(
            this.scope.getAllUnnamed("statement"),
        ).map((c) => c.generate());
        this.body = [...generatedLetBindings, ...generatedStmts, stmt];
        return fc.tuple(...this.body);
    }

    public generate(): fc.Arbitrary<AstReceiver> {
        return fc.record<AstReceiver>({
            kind: fc.constant("receiver"),
            id: fc.constant(this.idx),
            selector: this.generateSelector(),
            statements: this.generateBody(),
            loc: fc.constant(dummySrcInfoPrintable),
        });
    }
}
