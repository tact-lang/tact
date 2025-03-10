import type {
    AstStatementReturn,
    AstFieldAccess,
    AstStatementExpression,
    AstStatement,
    AstStatementTry,
    AstStatementForEach,
    AstStatementCondition,
    AstStatementRepeat,
    AstStatementAssign,
    AstStatementAugmentedAssign,
    AstAugmentedAssignOperation,
    AstStatementWhile,
    AstStatementUntil,
    AstExpression,
    AstStatementLet,
    AstId,
    AstCatchBlock,
} from "../../../src/ast/ast";
import fc from "fast-check";

import {
    Expression,
    generateBoolean,
    NonGenerativeExpressionParams,
    StaticCall,
    MethodCall,
    generateFunctionCallArgs,
    generateMethodCallArgs,
    generateThisID,
    generateFieldAccess,
} from "./expression";
import {
    randomBool,
    createSample,
    generateName,
    packArbitraries,
    randomElement,
    generateAstId,
    generateAstIdFromName,
} from "../util";
import { GenerativeEntity } from "./generator";
import { StdlibType, UtilType, tyToAstType } from "../types";
import type { Type } from "../types";
import { Scope } from "../scope";
import type { ScopeItemKind } from "../scope";
import { dummySrcInfo } from "../../../src/grammar/";

/** Type all the imperative constructions have. */
const STMT_TY: Type = { kind: "util", type: UtilType.Unit };

/**
 * Generates `return` statements.
 */
export class Return extends GenerativeEntity<AstStatement> {
    /**
     * @param parentScope Scope this statement belongs to.
     */
    constructor(
        private parentScope: Scope,
        type: Type,
    ) {
        super(type);
    }
    generate(): fc.Arbitrary<AstStatement> {
        return fc.record<AstStatementReturn>({
            kind: fc.constant("statement_return"),
            id: fc.constant(this.idx),
            expression:
                this.type.kind === "util" && this.type.type === UtilType.Unit
                    ? fc.constant(undefined)
                    : new Expression(this.parentScope, this.type).generate(),
            loc: fc.constant(dummySrcInfo),
        });
    }
}

/**
 * Let generator is the entry point of the bottom-up statement generation.
 * It creates a variable binding and then adds additional statements that mutate the created binding and the global state.
 */
export class Let extends GenerativeEntity<AstStatement> {
    /**
     * @param parentScope Scope this statement belongs to.
     * @param type Type of the generated binding.
     * @param expr Expression generator to initialize that binding.
     */
    constructor(
        parentScope: Scope,
        type: Type,
        private expr: fc.Arbitrary<AstExpression>,
    ) {
        super(type);
        this.name = createSample(generateAstId(parentScope, "constantDef"));
    }

    generate(): fc.Arbitrary<AstStatement> {
        return fc.record<AstStatementLet>({
            kind: fc.constant("statement_let"),
            id: fc.constant(this.idx),
            name: fc.constantFrom(this.name!),
            type: fc.constantFrom(tyToAstType(this.type)),
            expression: this.expr,
            loc: fc.constant(dummySrcInfo),
        });
    }
}

/**
 * Creates assignments and augmented assignments to modify global or local variables.
 */
export class AssignStatement extends GenerativeEntity<AstStatement> {
    /**
     * @param path A qualified name of the lhs.
     * @param rhs Expression to assign to.
     * @param rhsTy Type of the rhs of the assignment.
     * @param ty Type of the statement.
     */
    constructor(
        private path: AstExpression,
        private rhs: fc.Arbitrary<AstExpression>,
        private rhsTy: Type,
        ty = STMT_TY,
    ) {
        super(ty);
    }

    generate(): fc.Arbitrary<AstStatement> {
        const assigns: fc.Arbitrary<AstStatement>[] = [
            fc.record<AstStatementAssign>({
                kind: fc.constant("statement_assign"),
                id: fc.constant(this.idx),
                path: fc.constant(this.path),
                expression: this.rhs,
                loc: fc.constant(dummySrcInfo),
            }),
        ];
        // Only integer types in augmented assignments are supported.
        // See: https://github.com/tact-lang/tact/issues/353.
        if (
            this.rhsTy.kind === "stdlib" &&
            this.rhsTy.type === StdlibType.Int
        ) {
            assigns.push(
                fc.record<AstStatementAugmentedAssign>({
                    kind: fc.constant("statement_augmentedassign"),
                    id: fc.constant(this.idx),
                    op: fc.constantFrom<AstAugmentedAssignOperation>(
                        "+",
                        "-",
                        "*",
                        "/",
                        "%",
                    ),
                    path: fc.constantFrom(this.path),
                    expression: this.rhs,
                    loc: fc.constant(dummySrcInfo),
                }),
            );
        }
        return fc.oneof(...assigns);
    }
}

/**
 * Generates `while` and `until` loops.
 */
export class WhileUntilStatement extends GenerativeEntity<AstStatement> {
    constructor(
        private condition: fc.Arbitrary<AstExpression>,
        private body: fc.Arbitrary<AstStatement>[],
        private kind: "until" | "while",
        type: Type = STMT_TY,
    ) {
        super(type);
    }
    generate(): fc.Arbitrary<AstStatement> {
        return fc.record({
            kind: fc.constant(`statement_${this.kind}`),
            id: fc.constant(this.idx),
            condition: this.condition,
            statements: packArbitraries(this.body),
            loc: fc.constant(dummySrcInfo),
        }) as fc.Arbitrary<AstStatementWhile | AstStatementUntil>;
    }
}

/**
 * Generates `repeat` loops.
 */
export class RepeatStatement extends GenerativeEntity<AstStatement> {
    constructor(
        private parentScope: Scope,
        private body: fc.Arbitrary<AstStatement>[],
        type: Type = STMT_TY,
    ) {
        super(type);
    }
    generate(): fc.Arbitrary<AstStatement> {
        const iterations = new Expression(this.parentScope, {
            kind: "stdlib",
            type: StdlibType.Int,
        }).generate();
        return fc.record({
            kind: fc.constant(`statement_repeat`),
            id: fc.constant(this.idx),
            iterations,
            statements: packArbitraries(this.body),
            loc: fc.constant(dummySrcInfo),
        }) as fc.Arbitrary<AstStatementRepeat>;
    }
}

/**
 * Generates `foreach` loops.
 */
export class ForeachStatement extends GenerativeEntity<AstStatement> {
    constructor(
        private map: fc.Arbitrary<AstExpression>,
        private keyName: string,
        private valueName: string,
        private body: fc.Arbitrary<AstStatement>[],
        type: Type = STMT_TY,
    ) {
        super(type);
    }
    generate(): fc.Arbitrary<AstStatement> {
        return fc.record<AstStatementForEach>({
            kind: fc.constant("statement_foreach"),
            keyName: fc.constant(generateAstIdFromName(this.keyName)),
            valueName: fc.constant(generateAstIdFromName(this.valueName)),
            map: this.map,
            statements: packArbitraries(this.body),
            id: fc.constant(this.idx),
            loc: fc.constant(dummySrcInfo),
        });
    }
}

/**
 * Generates conditional statements.
 */
export class ConditionStatement extends GenerativeEntity<AstStatementCondition> {
    constructor(
        private parentScope: Scope,
        private trueStmts: fc.Arbitrary<AstStatement>[],
        private falseStmts?: fc.Arbitrary<AstStatement>[],
        private elseif?: fc.Arbitrary<AstStatementCondition>,
        type: Type = STMT_TY,
    ) {
        super(type);
    }
    generate(): fc.Arbitrary<AstStatementCondition> {
        const condition = new Expression(this.parentScope, {
            kind: "stdlib",
            type: StdlibType.Bool,
        }).generate();
        return fc.record<AstStatementCondition>({
            kind: fc.constant(`statement_condition`),
            condition,
            trueStatements: packArbitraries(this.trueStmts),
            falseStatements: this.falseStmts
                ? packArbitraries(this.falseStmts)
                : fc.constant(undefined),
            id: fc.constant(this.idx),
            loc: fc.constant(dummySrcInfo),
        });
    }
}

/**
 * Generates try-catch statements.
 */
export class TryCatch extends GenerativeEntity<AstStatement> {
    constructor(
        private tryStmts: fc.Arbitrary<AstStatement>[],
        private catchBlock?: AstCatchBlock,
        type: Type = STMT_TY,
    ) {
        super(type);
    }
    generate(): fc.Arbitrary<AstStatement> {
        return fc.record<AstStatementTry>({
            kind: fc.constant("statement_try"),
            id: fc.constant(this.idx),
            statements: packArbitraries(this.tryStmts),
            catchBlock: fc.constant(this.catchBlock),
            loc: fc.constant(dummySrcInfo),
        });
    }
}

/**
 * Generates expression statements.
 * The return value of the function/method calls generated by this is never used.
 */
export class StatementExpression extends GenerativeEntity<AstStatement> {
    constructor(
        private expr: fc.Arbitrary<AstExpression>,
        type: Type = STMT_TY,
    ) {
        super(type);
    }
    generate(): fc.Arbitrary<AstStatement> {
        return fc.record<AstStatementExpression>({
            kind: fc.constant("statement_expression"),
            id: fc.constant(this.idx),
            expression: this.expr,
            loc: fc.constant(dummySrcInfo),
        });
    }
}

export interface StatementParameters {
    /**
     * Determines the maximum depth of nested statement blocks.
     * @default 2
     */
    nestedBlocksNum: number;

    /**
     * Number of statements in each block.
     * @default 3
     */
    stmtsInBlock: number;
}

/**
 * The generator that creates statements in the given block which mutate global or local state.
 */
export class Statement extends GenerativeEntity<AstStatement> {
    private nestedBlocksNum: number;
    private stmtsInBlock: number;
    private params: Partial<StatementParameters>;

    /**
     * @param parentScope Scope the generated statements belongs to.
     * @param recursionLevel Used internally within Statement.
     * @param params Optional parameters for statement generation.
     * @param type Type of the generated statement.
     */
    constructor(
        private parentScope: Scope,
        private recursionLevel = 0,
        params: Partial<StatementParameters> = {},
        type: Type = STMT_TY,
    ) {
        if (parentScope.definedIn("program", "contract")) {
            throw new Error(
                `Cannot generate statements in the ${parentScope.kind} scope`,
            );
        }
        super(type);

        const { nestedBlocksNum = 2, stmtsInBlock = 3 } = params;
        this.nestedBlocksNum = nestedBlocksNum;
        this.stmtsInBlock = stmtsInBlock;

        this.params = params;
    }

    generate(): fc.Arbitrary<AstStatement> {
        const varAssign = this.makeVarAssign();
        const fieldAssign = this.makeFieldAssign();
        const loopStmt = randomBool()
            ? this.makeWhileUntil()
            : this.makeRepeat();
        const foreachStmt = this.makeForEach();
        const condStmt = this.makeCondition();
        const tryCatch = this.makeTryCatch();
        const callStmt = this.makeCall();
        const generated = [
            ...(varAssign ? [varAssign] : []),
            ...(fieldAssign ? [fieldAssign] : []),
            ...(loopStmt ? [loopStmt] : []),
            ...(foreachStmt ? [foreachStmt] : []),
            ...(condStmt ? [condStmt] : []),
            ...(tryCatch ? [tryCatch] : []),
            ...(callStmt ? [callStmt] : []),
        ];
        if (generated.length === 0) {
            // No variables in local/global scopes are available: generate dummy statements.
            generated.push(this.makeDummyStmt());
        }
        return fc.oneof(...generated);
    }

    /**
     * Creates statements that mutate local variables, including assignments and augmented assignments.
     */
    private makeVarAssign(): fc.Arbitrary<AstStatement> | undefined {
        const varEntries: [string, Type][] =
            this.parentScope.getEntriesRecursive("let");
        if (varEntries.length === 0) {
            return undefined;
        }
        const arbs = varEntries.map(([name, ty]) => {
            const expr = new Expression(this.parentScope, ty).generate();
            return new AssignStatement(
                generateAstIdFromName(name),
                expr,
                ty,
            ).generate();
        });
        return arbs.length > 0 ? fc.oneof(...arbs) : undefined;
    }

    /**
     * Creates statements that mutate contract fields, including assignments and augmented assignments.
     */
    private makeFieldAssign(): fc.Arbitrary<AstStatement> | undefined {
        if (!this.parentScope.definedIn("method")) {
            return undefined;
        }
        const fieldEntries: [string, Type][] =
            this.parentScope.getEntriesRecursive("field");
        if (fieldEntries.length === 0) {
            return undefined;
        }
        const arbs = fieldEntries.map(([name, ty]) => {
            const expr = new Expression(
                this.parentScope,
                ty,
                NonGenerativeExpressionParams,
            ).generate();
            return new AssignStatement(
                generateFieldAccess(name),
                expr,
                ty,
            ).generate();
        });
        return arbs.length > 0 ? fc.oneof(...arbs) : undefined;
    }

    /**
     * Creates either while or until loops.
     */
    private makeWhileUntil(): fc.Arbitrary<AstStatement> | undefined {
        if (this.recursionLevel >= this.nestedBlocksNum) {
            return undefined;
        }
        const condition = new Expression(
            this.parentScope,
            { kind: "stdlib", type: StdlibType.Bool },
            NonGenerativeExpressionParams,
        ).generate();
        const body = this.makeStmtsBlock();
        return new WhileUntilStatement(
            condition,
            body,
            randomBool() ? "while" : "until",
        ).generate();
    }

    /**
     * Generates repeat loops.
     */
    private makeRepeat(): fc.Arbitrary<AstStatement> | undefined {
        if (this.recursionLevel >= this.nestedBlocksNum) {
            return undefined;
        }
        const body = this.makeStmtsBlock();
        return new RepeatStatement(this.parentScope, body).generate();
    }

    /**
     * Collects all local map AstIds in parent scope.
     */
    private collectLocalMapIds(entryKinds: ScopeItemKind[]): AstId[] {
        return this.parentScope
            .getEntriesRecursive(...entryKinds)
            .filter(([_, mapTy]: [string, Type]) => mapTy.kind === "map")
            .map(([mapName, _]: [string, Type]) =>
                generateAstIdFromName(mapName),
            );
    }

    /**
     * Collects all field map AstIds in parent scope.
     */
    private collectFieldMapIds(entryKinds: ScopeItemKind[]): AstFieldAccess[] {
        return this.parentScope
            .getEntriesRecursive(...entryKinds)
            .filter(([_, mapTy]: [string, Type]) => mapTy.kind === "map")
            .map(([mapName, _]: [string, Type]) =>
                generateFieldAccess(mapName),
            );
    }

    /**
     * Generates foreach loops.
     */
    private makeForEach(): fc.Arbitrary<AstStatement> | undefined {
        if (this.recursionLevel >= this.nestedBlocksNum) {
            return undefined;
        }
        const scope = new Scope("block", this.parentScope);
        const simpleMapIds = this.collectLocalMapIds([
            "let",
            "constantDecl",
            "constantDef",
        ]);
        const fieldMapPaths = this.collectFieldMapIds(["field"]);
        const mapIds = [
            ...simpleMapIds.map(fc.constant),
            ...fieldMapPaths.map(fc.constant),
        ];
        if (mapIds.length === 0) {
            return undefined;
        }
        const map: fc.Arbitrary<AstExpression> = fc.oneof(...mapIds);
        const keyVarName = createSample(generateName(scope, "let"));
        const valueVarName = createSample(generateName(scope, "let"));
        const body = this.makeStmtsBlock(scope);
        return new ForeachStatement(
            map,
            keyVarName,
            valueVarName,
            body,
        ).generate();
    }

    /**
     * Generates conditional statements.
     */
    private makeCondition(): fc.Arbitrary<AstStatementCondition> | undefined {
        if (this.recursionLevel >= this.nestedBlocksNum) {
            return undefined;
        }
        const trueStatements = this.makeStmtsBlock();
        const falseStatements = randomBool()
            ? undefined
            : this.makeStmtsBlock();
        return new ConditionStatement(
            this.parentScope,
            trueStatements,
            falseStatements,
        ).generate();
    }

    /**
     * Generates try and try-catch statements
     */
    private makeTryCatch(): fc.Arbitrary<AstStatement> | undefined {
        if (this.recursionLevel >= this.nestedBlocksNum) {
            return undefined;
        }
        const tryStmts = this.makeStmtsBlock();
        if (randomBool()) {
            const catchScope = new Scope("block", this.parentScope);
            const catchName = createSample(generateName(catchScope, "let"));
            const catchStmts = this.makeStmtsBlock(catchScope).map((stmt) =>
                createSample(stmt),
            );
            return new TryCatch(tryStmts, {
                catchName: generateAstIdFromName(catchName),
                catchStatements: catchStmts,
            }).generate();
        } else {
            return new TryCatch(tryStmts).generate();
        }
    }

    /**
     * Generates function or method calls without using the return value.
     */
    private makeCall(): fc.Arbitrary<AstStatement> | undefined {
        if (this.recursionLevel >= this.nestedBlocksNum) {
            return undefined;
        }
        if (this.parentScope.definedIn("method", "contract") && randomBool()) {
            // Call a method
            const methodEntries =
                this.parentScope.getEntriesRecursive("methodDef");
            if (methodEntries.length === 0) {
                return undefined;
            }
            const [funName, funTy] = randomElement(methodEntries);
            return new StatementExpression(
                new MethodCall(
                    funTy,
                    funName,
                    generateThisID(),
                    generateMethodCallArgs(funTy, this.parentScope),
                ).generate(),
            ).generate();
        } else {
            // Call a function
            const funEntries =
                this.parentScope.getEntriesRecursive("functionDef");
            if (funEntries.length === 0) {
                return undefined;
            }
            const [funName, funTy] = randomElement(funEntries);
            return new StatementExpression(
                new StaticCall(
                    funTy,
                    funName,
                    generateFunctionCallArgs(funTy, this.parentScope),
                ).generate(),
            ).generate();
        }
    }

    /**
     * Creates a block of statements nested in curly braces in concrete syntax.
     */
    private makeStmtsBlock(blockScope?: Scope): fc.Arbitrary<AstStatement>[] {
        const scope = blockScope ?? new Scope("block", this.parentScope);
        const block: fc.Arbitrary<AstStatement>[] = [];
        Array.from({ length: this.stmtsInBlock }).forEach(() => {
            const stmt = new Statement(
                scope,
                this.recursionLevel + 1,
                this.params,
            ).generate();
            block.push(stmt);
        });
        return block;
    }

    /**
     * Generates a dummy statement which doesn't have affect on control-flow nor state:
     * `while (false) { }`
     */
    private makeDummyStmt(): fc.Arbitrary<AstStatement> {
        const falseExpr = generateBoolean(false);
        return new WhileUntilStatement(falseExpr, [], "while").generate();
    }
}
