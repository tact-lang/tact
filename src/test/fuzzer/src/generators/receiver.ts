import type * as Ast from "@/ast/ast";
import {
    UtilType,
    StdlibType,
    isBouncedMessage,
} from "@/test/fuzzer/src/types";
import type { Type } from "@/test/fuzzer/src/types";
import { Scope } from "@/test/fuzzer/src/scope";
import { GenerativeEntity } from "@/test/fuzzer/src/generators/generator";
import {
    createSample,
    randomBool,
    randomElement,
} from "@/test/fuzzer/src/util";
import { Expression } from "@/test/fuzzer/src/generators/expression";
import { Parameter } from "@/test/fuzzer/src/generators/parameter";
import { Let, Statement } from "@/test/fuzzer/src/generators/statement";

import fc from "fast-check";
import { generateString } from "@/test/fuzzer/src/generators/uniform-expr-gen";
import { FuzzConfig } from "@/test/fuzzer/src/config";
import { FuzzContext } from "@/test/fuzzer/src/context";

const RECEIVE_RETURN_TY: Type = { kind: "util", type: UtilType.Unit };

function generateReceiverSimpleSubKind(
    param: Parameter,
): fc.Arbitrary<Ast.ReceiverSimple> {
    return param
        .generate()
        .map((p) => FuzzContext.instance.makeF.makeReceiverSimple(p));
}

function generateReceiverFallbackSubKind(): fc.Arbitrary<Ast.ReceiverFallback> {
    return fc.constant(FuzzContext.instance.makeF.makeReceiverFallback());
}

function generateReceiverCommentSubKind(): fc.Arbitrary<Ast.ReceiverComment> {
    return generateString(/*nonEmpty=*/ true).map((s) =>
        FuzzContext.instance.makeF.makeReceiverComment(s),
    );
}

function generateInternalReceiverKind(
    subKind: fc.Arbitrary<Ast.ReceiverSubKind>,
): fc.Arbitrary<Ast.ReceiverInternal> {
    return subKind.map((k) =>
        FuzzContext.instance.makeF.makeDummyReceiverInternal(k),
    );
}

function generateExternalReceiverKind(
    subKind: fc.Arbitrary<Ast.ReceiverSubKind>,
): fc.Arbitrary<Ast.ReceiverExternal> {
    return subKind.map((k) =>
        FuzzContext.instance.makeF.makeDummyReceiverExternal(k),
    );
}

export interface ReceiveParameters {
    /**
     * Minimum number of let statements at the start of function body.
     * @default FuzzConfig.letStatementsMinNum
     */
    letStatementsMinNum: number;

    /**
     * Maximum number of let statements at the start of function body.
     * @default FuzzConfig.letStatementsMaxNum
     */
    letStatementsMaxNum: number;

    /**
     * Minimum number of statements in the function body (not counting initial let statements and final return)
     * @default FuzzConfig.statementsMinLength
     */
    statementsMinLength: number;

    /**
     * Maximum number of statements in the function body (not counting initial let statements and final return)
     * @default FuzzConfig.statementsMaxLength
     */
    statementsMaxLength: number;
}

/**
 * An object that encapsulates an Ast.Receiver.
 */
export class Receive extends GenerativeEntity<Ast.Receiver> {
    /** Generated body items. */
    private body: fc.Arbitrary<Ast.Statement>[] = [];

    /** Scope used within the generated receive method. */
    private scope: Scope;

    private letStatementsMinNum: number;
    private letStatementsMaxNum: number;
    private statementsMinLength: number;
    private statementsMaxLength: number;

    constructor(parentScope: Scope, params: Partial<ReceiveParameters> = {}) {
        super(RECEIVE_RETURN_TY);
        this.scope = new Scope("receive", parentScope);
        const {
            letStatementsMinNum = FuzzConfig.letStatementsMinNum,
            letStatementsMaxNum = FuzzConfig.letStatementsMaxNum,
            statementsMinLength = FuzzConfig.statementsMinLength,
            statementsMaxLength = FuzzConfig.statementsMaxLength,
        } = params;
        this.letStatementsMinNum = letStatementsMinNum;
        this.letStatementsMaxNum = letStatementsMaxNum;
        this.statementsMinLength = statementsMinLength;
        this.statementsMaxLength = statementsMaxLength;
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
            ) as Type;
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
            return param
                .generate()
                .map((p) =>
                    FuzzContext.instance.makeF.makeDummyReceiverBounce(p),
                );
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
        //const expr = new Expression(this.scope, this.type).generate();
        //const stmt = new StatementExpression(expr).generate();

        //const generatedLetBindings = Array.from(
        //    this.scope.getAllNamed("let"),
        //).map((c) => c.generate());
        //const generatedStmts = Array.from(
        //    this.scope.getAllUnnamed("statement"),
        //).map((c) => c.generate());

        // TODO: Make it generate arbitrary types
        const generatedLetBindings = fc.array(
            new Let(
                this.scope,
                { kind: "stdlib", type: StdlibType.Int },
                new Expression(this.scope, {
                    kind: "stdlib",
                    type: StdlibType.Int,
                }).generate(),
            ).generate(),
            {
                minLength: this.letStatementsMinNum,
                maxLength: this.letStatementsMaxNum,
            },
        );

        const generatedStmts = fc.array(new Statement(this.scope).generate(), {
            minLength: this.statementsMinLength,
            maxLength: this.statementsMaxLength,
        });

        return fc
            .tuple(generatedLetBindings, generatedStmts)
            .map((tup) => tup.flat());
    }

    public generate(): fc.Arbitrary<Ast.Receiver> {
        return fc
            .tuple(this.generateSelector(), this.generateBody())
            .map(([sel, stmt]) =>
                FuzzContext.instance.makeF.makeDummyReceiver(sel, stmt),
            );
    }
}
