import type * as Ast from "../../../src/ast/ast";
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
): fc.Arbitrary<Ast.ReceiverSimple> {
    return fc.record<Ast.ReceiverSimple>({
        kind: fc.constant("simple"),
        param: param.generate(),
        id: fc.constant(nextId()),
    });
}

function generateReceiverFallbackSubKind(): fc.Arbitrary<Ast.ReceiverFallback> {
    return fc.record<Ast.ReceiverFallback>({
        kind: fc.constant("fallback"),
        id: fc.constant(nextId()),
    });
}

function generateReceiverCommentSubKind(): fc.Arbitrary<Ast.ReceiverComment> {
    return fc.record<Ast.ReceiverComment>({
        kind: fc.constant("comment"),
        comment: generateString(/*nonEmpty=*/ true),
        id: fc.constant(nextId()),
    });
}

function generateInternalReceiverKind(
    subKind: fc.Arbitrary<Ast.ReceiverSubKind>,
): fc.Arbitrary<Ast.ReceiverKind> {
    return fc.record<Ast.ReceiverKind>({
        kind: fc.constant("internal"),
        subKind,
        id: fc.constant(nextId()),
        loc: fc.constant(dummySrcInfoPrintable),
    });
}

function generateExternalReceiverKind(
    subKind: fc.Arbitrary<Ast.ReceiverSubKind>,
): fc.Arbitrary<Ast.ReceiverKind> {
    return fc.record<Ast.ReceiverKind>({
        kind: fc.constant("external"),
        subKind,
        id: fc.constant(nextId()),
        loc: fc.constant(dummySrcInfoPrintable),
    });
}

/**
 * An object that encapsulates an Ast.Receiver.
 */
export class Receive extends GenerativeEntity<Ast.Receiver> {
    /** Generated body items. */
    private body: fc.Arbitrary<Ast.Statement>[] = [];

    /** Scope used within the generated receive method. */
    private scope: Scope;

    constructor(parentScope: Scope) {
        super(RECEIVE_RETURN_TY);
        this.scope = new Scope("receive", parentScope);
    }

    private generateSelector(): fc.Arbitrary<Ast.ReceiverKind> {
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
            return fc.record<Ast.ReceiverKind>({
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

    private generateBody(): fc.Arbitrary<Ast.Statement[]> {
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

    public generate(): fc.Arbitrary<Ast.Receiver> {
        return fc.record<Ast.Receiver>({
            kind: fc.constant("receiver"),
            id: fc.constant(this.idx),
            selector: this.generateSelector(),
            statements: this.generateBody(),
            loc: fc.constant(dummySrcInfoPrintable),
        });
    }
}
