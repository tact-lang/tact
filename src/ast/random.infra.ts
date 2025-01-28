import fc from "fast-check";
import * as A from "./ast";
import { dummySrcInfo } from "../grammar/src-info";
import { Address, address, beginCell, Cell, Slice } from "@ton/core";

/**
 * An array of reserved words that cannot be used as contract or variable names in tests.
 *
 * These words are reserved for use in the language and may cause errors
 * if attempted to be used as identifiers.
 *
 * @see src/grammar/next/grammar.gg
 */
const reservedWords = [
    "extend",
    "public",
    "fun",
    "let",
    "return",
    "receive",
    "native",
    "primitive",
    "null",
    "if",
    "else",
    "while",
    "repeat",
    "do",
    "until",
    "try",
    "catch",
    "foreach",
    "as",
    "map",
    "mutates",
    "extends",
    "external",
    "import",
    "with",
    "trait",
    "initOf",
    "override",
    "abstract",
    "virtual",
    "inline",
    "const",
    "__gen",
    "__tact",
];

function dummyAstNode<T>(
    generator: fc.Arbitrary<T>,
): fc.Arbitrary<T & { id: number; loc: typeof dummySrcInfo }> {
    return generator.map((i) => ({
        ...i,
        id: 0,
        loc: dummySrcInfo,
    }));
}

function randomAstBoolean(): fc.Arbitrary<A.AstBoolean> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("boolean"),
            value: fc.boolean(),
        }),
    );
}

function randomAstSimplifiedString(): fc.Arbitrary<A.AstSimplifiedString> {
    const escapeString = (s: string): string =>
        s.replace(/\\/g, "\\\\").replace(/"/g, '\\"');

    return dummyAstNode(
        fc.record({
            kind: fc.constant("simplified_string"),
            value: fc.string().map(escapeString),
        }),
    );
}

function randomAstString(): fc.Arbitrary<A.AstString> {
    const escapeString = (s: string): string =>
        s.replace(/\\/g, "\\\\").replace(/"/g, '\\"');

    return dummyAstNode(
        fc.record({
            kind: fc.constant("string"),
            value: fc.string().map((s) => escapeString(s)),
        }),
    );
}

function randomAstNumber(): fc.Arbitrary<A.AstNumber> {
    const values = [
        ...Array.from({ length: 10 }, (_, i) => [0n, BigInt(i)]).flat(),
        ...Array.from({ length: 256 }, (_, i) => 1n ** BigInt(i)),
    ];

    return dummyAstNode(
        fc.record({
            kind: fc.constant("number"),
            base: fc.constantFrom(2, 8, 10, 16),
            value: fc.oneof(...values.map((value) => fc.constant(value))),
        }),
    );
}

function randomAstOpUnary(
    operand: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstOpUnary> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("op_unary"),
            op: fc.constantFrom("+", "-", "!", "!!", "~"),
            operand: operand,
        }),
    );
}
function randomAstOpBinary(
    leftExpression: fc.Arbitrary<A.AstExpression>,
    rightExpression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstOpBinary> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("op_binary"),
            op: fc.constantFrom(
                "+",
                "-",
                "*",
                "/",
                "!=",
                ">",
                "<",
                ">=",
                "<=",
                "==",
                "&&",
                "||",
                "%",
                "<<",
                ">>",
                "&",
                "|",
                "^",
            ),
            left: leftExpression,
            right: rightExpression,
        }),
    );
}

function randomAstConditional(
    conditionExpression: fc.Arbitrary<A.AstExpression>,
    thenBranchExpression: fc.Arbitrary<A.AstExpression>,
    elseBranchExpression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstConditional> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("conditional"),
            condition: conditionExpression,
            thenBranch: thenBranchExpression,
            elseBranch: elseBranchExpression,
        }),
    );
}

function randomAstId(): fc.Arbitrary<A.AstId> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("id"),
            text: fc
                .stringMatching(/^[A-Za-z_][A-Za-z0-9_]*$/)
                .filter(
                    (i) =>
                        !reservedWords.includes(i) &&
                        !i.startsWith("__gen") &&
                        !i.startsWith("__tact"),
                ),
        }),
    );
}

function randomAstCapitalizedId(): fc.Arbitrary<A.AstId> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("id"),
            text: fc.stringMatching(/^[A-Z][A-Za-z0-9_]*$/),
        }),
    );
}

function randomAstNull(): fc.Arbitrary<A.AstNull> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("null"),
        }),
    );
}

function randomAstInitOf(
    expression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstInitOf> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("init_of"),
            contract: randomAstId(),
            args: fc.array(expression),
        }),
    );
}

function randomAstStaticCall(
    expression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstStaticCall> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("static_call"),
            function: randomAstId(),
            args: fc.array(expression),
        }),
    );
}

function randomAstStructFieldInitializer(
    expression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstStructFieldInitializer> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("struct_field_initializer"),
            field: randomAstId(),
            initializer: expression,
        }),
    );
}

function randomAstStructInstance(
    structFieldInitializer: fc.Arbitrary<A.AstStructFieldInitializer>,
): fc.Arbitrary<A.AstStructInstance> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("struct_instance"),
            type: randomAstCapitalizedId(),
            args: fc.array(structFieldInitializer),
        }),
    );
}

function randomAstFieldAccess(
    expression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstFieldAccess> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("field_access"),
            aggregate: expression,
            field: randomAstId(),
        }),
    );
}

function randomAstMethodCall(
    selfExpression: fc.Arbitrary<A.AstExpression>,
    argsExpression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstMethodCall> {
    return dummyAstNode(
        fc.record({
            self: selfExpression,
            kind: fc.constant("method_call"),
            method: randomAstId(),
            args: fc.array(argsExpression),
        }),
    );
}

function randomAddress(): fc.Arbitrary<Address> {
    return fc.constant(
        address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N"), // TODO: use random address
    );
}

function randomCell(): fc.Arbitrary<Cell> {
    return fc.constant(beginCell().endCell()); // TODO: use random random here
}

function randomAstAddress(): fc.Arbitrary<A.AstAddress> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("address"),
            value: randomAddress(),
        }),
    );
}

function randomAstCell(): fc.Arbitrary<A.AstCell> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("cell"),
            value: randomCell(),
        }),
    );
}

function randomSlice(): fc.Arbitrary<Slice> {
    return fc.constant(beginCell().endCell().beginParse());
}

function randomAstSlice(): fc.Arbitrary<A.AstSlice> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("slice"),
            value: randomSlice(),
        }),
    );
}

function randomAstCommentValue(): fc.Arbitrary<A.AstCommentValue> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("comment_value"),
            value: fc.string(),
        }),
    );
}

function randomAstStructFieldValue(
    subLiteral: fc.Arbitrary<A.AstLiteral>,
): fc.Arbitrary<A.AstStructFieldValue> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("struct_field_value"),
            field: randomAstId(),
            initializer: subLiteral,
        }),
    );
}

function randomAstStructValue(
    subLiteral: fc.Arbitrary<A.AstLiteral>,
): fc.Arbitrary<A.AstStructValue> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("struct_value"),
            type: randomAstId(),
            args: fc.array(randomAstStructFieldValue(subLiteral)),
        }),
    );
}

function randomAstLiteral(
    maxDepth: number,
    ref: string = "",
): fc.Arbitrary<A.AstLiteral> {
    return fc.memo((depth: number): fc.Arbitrary<A.AstLiteral> => {
        console.log("depth at randomAstLiteral", depth);

        if (ref === "statement_let") {
            return fc.oneof(randomAstSimplifiedString());
        }

        if (depth === 1) {
            return fc.oneof(
                randomAstNumber(),
                randomAstBoolean(),
                randomAstNull(),
                randomAstSimplifiedString(),
                randomAstAddress(),
                randomAstCell(),
                randomAstSlice(),
                randomAstCommentValue(),
            );
        }
        const subLiteral = () => randomAstLiteral(depth - 1);

        return fc.oneof(
            randomAstNumber(),
            randomAstBoolean(),
            randomAstNull(),
            randomAstSimplifiedString(),
            randomAstAddress(),
            randomAstCell(),
            randomAstSlice(),
            randomAstCommentValue(),
            randomAstStructValue(subLiteral()),
        );
    })(maxDepth);
}

function randomAstExpression(
    maxDepth: number,
    ref: string = "",
): fc.Arbitrary<A.AstExpression> {
    return fc.memo((depth: number): fc.Arbitrary<A.AstExpression> => {
        if (depth == 1) {
            return fc.oneof(randomAstLiteral(depth, ref));
        }

        const subExpr = () => randomAstExpression(depth - 1);

        return fc.oneof(
            randomAstLiteral(maxDepth),
            randomAstMethodCall(subExpr(), subExpr()),
            randomAstFieldAccess(subExpr()),
            randomAstStaticCall(subExpr()),
            randomAstStructInstance(randomAstStructFieldInitializer(subExpr())),
            randomAstInitOf(subExpr()),
            randomAstString(),
            randomAstOpUnary(subExpr()),
            randomAstOpBinary(subExpr(), subExpr()),
            randomAstConditional(subExpr(), subExpr(), subExpr()),
        );
    })(maxDepth);
}

function randomAstType(
    maxDepth: number = 3,
    ref: string = "",
): fc.Arbitrary<A.AstType> {
    if (ref === "statement_let") {
        return fc.oneof(randomAstTypeId());
    }

    if (maxDepth <= 0) {
        return fc.oneof(
            randomAstTypeId(),
            randomAstOptionalType(),
            randomAstBouncedMessageType(),
        );
    }

    return fc.oneof(
        randomAstTypeId(),
        randomAstOptionalType(),
        randomAstMapType(),
        randomAstBouncedMessageType(),
    );
}

function randomAstTypeId(): fc.Arbitrary<A.AstTypeId> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("type_id"),
            text: fc.stringMatching(/^[A-Z][a-zA-Z0-9_]*$/),
        }),
    );
}

function randomAstOptionalType(): fc.Arbitrary<A.AstOptionalType> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("optional_type"),
            typeArg: randomAstTypeId(), // Add randomAstType but now it will be generate randomly (not validate by grammar)
        }),
    );
}

function randomAstBouncedMessageType(): fc.Arbitrary<A.AstBouncedMessageType> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("bounced_message_type"),
            messageType: randomAstTypeId(),
        }),
    );
}

function randomAstMapType(): fc.Arbitrary<A.AstMapType> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("map_type"),
            keyType: randomAstTypeId(),
            keyStorageType: randomAstId(),
            valueType: randomAstTypeId(),
            valueStorageType: randomAstId(),
        }),
    );
}

function randomAstStatementLet(
    expression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstStatementLet> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("statement_let"),
            name: randomAstId(),
            type: randomAstType(2, "statement_let"),
            expression: expression,
        }),
    );
}

function randomAstStatementReturn(
    expression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstStatementReturn> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("statement_return"),
            expression: fc.option(expression),
        }),
    );
}

function randomAstStatementExpression(
    expression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstStatementExpression> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("statement_expression"),
            expression: expression,
        }),
    );
}

function randomAstStatementAssign(
    expression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstStatementAssign> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("statement_assign"),
            path: expression,
            expression: expression,
        }),
    );
}

function randomAstStatementAugmentedAssign(
    expression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstStatementAugmentedAssign> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("statement_augmentedassign"),
            op: fc.constantFrom(
                "+",
                "-",
                "*",
                "/",
                "&&",
                "||",
                "%",
                "|",
                "<<",
                ">>",
                "&",
                "^",
            ),
            path: expression,
            expression: expression,
        }),
    );
}

function randomAstStatementCondition(
    expression: fc.Arbitrary<A.AstExpression>,
    statement: fc.Arbitrary<A.AstStatement>,
    maxDepth: number,
): fc.Arbitrary<A.AstStatementCondition> {
    return fc.memo((depth: number): fc.Arbitrary<A.AstStatementCondition> => {
        if (depth === 1) {
            return dummyAstNode(
                fc.record({
                    kind: fc.constant("statement_condition"),
                    condition: expression,
                    trueStatements: fc.array(statement, { maxLength: 3 }),
                    falseStatements: fc.array(statement, { maxLength: 3 }),
                    elseif: fc.constant(null),
                }),
            );
        }

        return dummyAstNode(
            fc.record({
                kind: fc.constant("statement_condition"),
                condition: expression,
                trueStatements: fc.array(statement, { maxLength: 3 }),
                falseStatements: fc.array(statement, { maxLength: 3 }),
                elseif: fc.option(
                    randomAstStatementCondition(
                        expression,
                        statement,
                        maxDepth,
                    ),
                ),
            }),
        );
    })(maxDepth);
}

function randomAstStatementWhile(
    expression: fc.Arbitrary<A.AstExpression>,
    statement: fc.Arbitrary<A.AstStatement>,
): fc.Arbitrary<A.AstStatementWhile> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("statement_while"),
            condition: expression,
            statements: fc.array(statement, { maxLength: 3 }),
        }),
    );
}

function randomAstStatementUntil(
    expression: fc.Arbitrary<A.AstExpression>,
    statement: fc.Arbitrary<A.AstStatement>,
): fc.Arbitrary<A.AstStatementUntil> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("statement_until"),
            condition: expression,
            statements: fc.array(statement, { maxLength: 3 }),
        }),
    );
}

function randomAstStatementRepeat(
    expression: fc.Arbitrary<A.AstExpression>,
    statement: fc.Arbitrary<A.AstStatement>,
): fc.Arbitrary<A.AstStatementRepeat> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("statement_repeat"),
            iterations: expression,
            statements: fc.array(statement, { maxLength: 3 }),
        }),
    );
}

function randomAstStatementTry(
    statement: fc.Arbitrary<A.AstStatement>,
): fc.Arbitrary<A.AstStatementTry> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("statement_try"),
            statements: fc.array(statement, { maxLength: 3 }),
            catchBlock: fc.option(
                fc.record({
                    catchName: randomAstId(),
                    catchStatements: fc.array(statement, { maxLength: 3 }),
                }),
            ),
        }),
    );
}

function randomAstStatementForeach(
    expression: fc.Arbitrary<A.AstExpression>,
    statement: fc.Arbitrary<A.AstStatement>,
): fc.Arbitrary<A.AstStatementForEach> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("statement_foreach"),
            keyName: randomAstId(),
            valueName: randomAstId(),
            map: expression,
            statements: fc.array(statement, { maxLength: 3 }),
        }),
    );
}

function randomAstStatementDestruct(
    expression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstStatementDestruct> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("statement_destruct"),
            type: dummyAstNode(
                fc.record({
                    kind: fc.constant("type_id"),
                    text: fc.stringMatching(/^[A-Z][a-zA-Z0-9_]*$/),
                }),
            ),
            identifiers: fc.constant(new Map()),
            ignoreUnspecifiedFields: fc.boolean(),
            expression: expression,
        }),
    );
}

function randomAstStatementBlock(
    statement: fc.Arbitrary<A.AstStatement>,
): fc.Arbitrary<A.AstStatementBlock> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("statement_block"),
            statements: fc.array(statement, { maxLength: 3 }),
        }),
    );
}

function randomAstImport(): fc.Arbitrary<A.AstImport> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("import"),
            path: randomAstString().filter((i) => !i.value.includes("\\")),
        }),
    );
}

function randomAstContractAttribute(): fc.Arbitrary<A.AstContractAttribute> {
    return dummyAstNode(
        fc.record({
            type: fc.constant("interface"),
            name: randomAstString(),
        }),
    );
}

function randomAstTypedParameter(): fc.Arbitrary<A.AstTypedParameter> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("typed_parameter"),
            name: randomAstId(),
            type: randomAstType(),
        }),
    );
}

function randomAstContractDeclaration(): fc.Arbitrary<A.AstContractDeclaration> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("contract_init"),
            params: fc.array(randomAstTypedParameter(), { maxLength: 3 }),
            statements: fc.array(randomAstStatement(2), { maxLength: 3 }),
        }),
    );
}

function randomAstContract(): fc.Arbitrary<A.AstContract> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("contract"),
            name: randomAstId(),
            traits: fc.array(randomAstId(), { maxLength: 3 }),
            attributes: fc.array(randomAstContractAttribute(), {
                maxLength: 3,
            }),
            declarations: fc.array(randomAstContractDeclaration(), {
                maxLength: 3,
            }),
        }),
    );
}

function randomAstModuleItem(maxDepth: number): fc.Arbitrary<A.AstModuleItem> {
    if (maxDepth <= 0) {
        return fc.oneof(randomAstContract());
    }
    // Add more items !!!
    return fc.oneof(randomAstContract());
}

export function randomAstModule(maxDepth: number): fc.Arbitrary<A.AstModule> {
    return fc.memo((depth: number): fc.Arbitrary<A.AstModule> => {
        return dummyAstNode(
            fc.record({
                kind: fc.constant("module"),
                imports: fc.array(randomAstImport()),
                items: fc.array(randomAstModuleItem(depth - 1)),
            }),
        );
    })(maxDepth);
}

function randomAstStatement(maxDepth: number): fc.Arbitrary<A.AstStatement> {
    return fc.memo((depth: number): fc.Arbitrary<A.AstStatement> => {
        console.log("depth", depth);
        if (depth === 1) {
            return randomAstStatementExpression(randomAstExpression(depth));
        }

        const subExpr = (ref: string = "") =>
            randomAstExpression(depth - 1, ref);
        const subStmt = () => randomAstStatement(depth - 1);

        return fc.oneof(
            randomAstStatementLet(subExpr("statement_let")),
            randomAstStatementReturn(subExpr()),
            randomAstStatementExpression(subExpr()),
            randomAstStatementAssign(subExpr()),
            randomAstStatementAugmentedAssign(subExpr()),
            randomAstStatementCondition(subExpr(), subStmt(), depth - 1),
            randomAstStatementWhile(subExpr(), subStmt()),
            randomAstStatementUntil(subExpr(), subStmt()),
            randomAstStatementRepeat(subExpr(), subStmt()),
            randomAstStatementTry(subStmt()),
            randomAstStatementForeach(subExpr(), subStmt()),
            randomAstStatementDestruct(subExpr()),
            randomAstStatementBlock(subStmt()),
        );
    })(maxDepth);
}
