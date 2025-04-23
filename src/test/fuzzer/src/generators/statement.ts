import type * as Ast from "@/ast/ast";
import fc from "fast-check";

import {
    Expression,
    generateFunctionCallArgs,
    generateMethodCallArgs,
    makeSelfID,
    MethodCall,
    StaticCall,
} from "@/test/fuzzer/src/generators/expression";
import {
    randomBool,
    createSample,
    generateName,
    packArbitraries,
    randomElement,
    generateAstId,
    generateAstIdFromName,
} from "@/test/fuzzer/src/util";
import {
    GenerativeEntity,
    NamedGenerativeEntity,
} from "@/test/fuzzer/src/generators/generator";
import { StdlibType, UtilType, tyToAstType } from "@/test/fuzzer/src/types";
import type { Type } from "@/test/fuzzer/src/types";
import { Scope } from "@/test/fuzzer/src/scope";
import type { NamedScopeItemKind } from "@/test/fuzzer/src/scope";
import { GlobalContext } from "@/test/fuzzer/src/context";

/** Type all the imperative constructions have. */
const STMT_TY: Type = { kind: "util", type: UtilType.Unit };

/**
 * Generates `return` statements.
 */
export class Return extends GenerativeEntity<Ast.Statement> {
    /**
     * @param parentScope Scope this statement belongs to.
     */
    constructor(
        private parentScope: Scope,
        type: Type,
    ) {
        super(type);
    }
    generate(): fc.Arbitrary<Ast.Statement> {
        const gen =
            this.type.kind === "util" && this.type.type === UtilType.Unit
                ? fc.constant(undefined)
                : new Expression(this.parentScope, this.type).generate();

        return gen.map((expr) =>
            GlobalContext.makeF.makeDummyStatementReturn(expr),
        );
    }
}

/**
 * Let generator is the entry point of the bottom-up statement generation.
 * It creates a variable binding and then adds additional statements that mutate the created binding and the global state.
 */
export class Let extends NamedGenerativeEntity<Ast.Statement> {
    /**
     * @param parentScope Scope this statement belongs to.
     * @param type Type of the generated binding.
     * @param expr Expression generator to initialize that binding.
     */
    constructor(
        parentScope: Scope,
        type: Type,
        private expr: fc.Arbitrary<Ast.Expression>,
    ) {
        super(type, createSample(generateAstId(parentScope)));
    }

    generate(): fc.Arbitrary<Ast.Statement> {
        return this.expr.map((expr) =>
            GlobalContext.makeF.makeDummyStatementLet(
                this.name,
                tyToAstType(this.type),
                expr,
            ),
        );
    }
}

/**
 * Creates assignments and augmented assignments to modify global or local variables.
 */
export class AssignStatement extends GenerativeEntity<Ast.Statement> {
    /**
     * @param path A qualified name of the lhs.
     * @param rhs Expression to assign to.
     * @param rhsTy Type of the rhs of the assignment.
     * @param ty Type of the statement.
     */
    constructor(
        private path: Ast.Expression,
        private rhs: fc.Arbitrary<Ast.Expression>,
        private rhsTy: Type,
        ty = STMT_TY,
    ) {
        super(ty);
    }

    generate(): fc.Arbitrary<Ast.Statement> {
        const assigns: fc.Arbitrary<Ast.Statement>[] = [
            this.rhs.map((expr) =>
                GlobalContext.makeF.makeDummyStatementAssign(this.path, expr),
            ),
        ];
        // Only integer types in augmented assignments are supported.
        // See: https://github.com/tact-lang/tact/issues/353.
        if (
            this.rhsTy.kind === "stdlib" &&
            this.rhsTy.type === StdlibType.Int
        ) {
            assigns.push(
                this.rhs.chain((expr) => {
                    return fc
                        .constantFrom<Ast.AugmentedAssignOperation>(
                            "+=",
                            "-=",
                            "*=",
                            "/=",
                            "%=",
                        )
                        .map((op) =>
                            GlobalContext.makeF.makeDummyStatementAugmentedAssign(
                                op,
                                this.path,
                                expr,
                            ),
                        );
                }),
            );
        }
        return fc.oneof(...assigns);
    }
}

/**
 * Generates `while` and `until` loops.
 */
export class WhileUntilStatement extends GenerativeEntity<Ast.Statement> {
    constructor(
        private condition: fc.Arbitrary<Ast.Expression>,
        private body: fc.Arbitrary<Ast.Statement>[],
        private kind: "until" | "while",
        type: Type = STMT_TY,
    ) {
        super(type);
    }
    generate(): fc.Arbitrary<Ast.Statement> {
        return packArbitraries(this.body).chain((stmts) =>
            this.condition.map((expr) => {
                if (this.kind === "until") {
                    return GlobalContext.makeF.makeDummyStatementUntil(
                        expr,
                        stmts,
                    );
                } else {
                    return GlobalContext.makeF.makeDummyStatementWhile(
                        expr,
                        stmts,
                    );
                }
            }),
        );
    }
}

/**
 * Generates `repeat` loops.
 */
export class RepeatStatement extends GenerativeEntity<Ast.Statement> {
    constructor(
        private parentScope: Scope,
        private body: fc.Arbitrary<Ast.Statement>[],
        type: Type = STMT_TY,
    ) {
        super(type);
    }
    generate(): fc.Arbitrary<Ast.Statement> {
        const iterations = new Expression(this.parentScope, {
            kind: "stdlib",
            type: StdlibType.Int,
        }).generate();
        return iterations.chain((iter) =>
            packArbitraries(this.body).map((stmts) =>
                GlobalContext.makeF.makeDummyStatementRepeat(iter, stmts),
            ),
        );
    }
}

/**
 * Generates `foreach` loops.
 */
export class ForeachStatement extends GenerativeEntity<Ast.Statement> {
    constructor(
        private map: fc.Arbitrary<Ast.Expression>,
        private keyName: string,
        private valueName: string,
        private body: fc.Arbitrary<Ast.Statement>[],
        type: Type = STMT_TY,
    ) {
        super(type);
    }
    generate(): fc.Arbitrary<Ast.Statement> {
        return this.map.chain((map) =>
            packArbitraries(this.body).map((stmts) =>
                GlobalContext.makeF.makeDummyStatementForEach(
                    generateAstIdFromName(this.keyName),
                    generateAstIdFromName(this.valueName),
                    map,
                    stmts,
                ),
            ),
        );
    }
}

/**
 * Generates conditional statements.
 */
export class ConditionStatement extends GenerativeEntity<Ast.StatementCondition> {
    constructor(
        private parentScope: Scope,
        private trueStmts: fc.Arbitrary<Ast.Statement>[],
        private falseStmts?: fc.Arbitrary<Ast.Statement>[],
        private elseif?: fc.Arbitrary<Ast.StatementCondition>,
        type: Type = STMT_TY,
    ) {
        super(type);
    }
    generate(): fc.Arbitrary<Ast.StatementCondition> {
        const condition = new Expression(this.parentScope, {
            kind: "stdlib",
            type: StdlibType.Bool,
        }).generate();
        const falseArb = this.falseStmts
            ? packArbitraries(this.falseStmts)
            : fc.constant(undefined);

        return condition.chain((cond) =>
            packArbitraries(this.trueStmts).chain((trueStmts) =>
                falseArb.map((falseStmts) =>
                    GlobalContext.makeF.makeDummyStatementCondition(
                        cond,
                        trueStmts,
                        falseStmts,
                    ),
                ),
            ),
        );
    }
}

/**
 * Generates try-catch statements.
 */
export class TryCatch extends GenerativeEntity<Ast.Statement> {
    constructor(
        private tryStmts: fc.Arbitrary<Ast.Statement>[],
        private catchBlock?: Ast.CatchBlock,
        type: Type = STMT_TY,
    ) {
        super(type);
    }
    generate(): fc.Arbitrary<Ast.Statement> {
        return packArbitraries(this.tryStmts).map((stmts) =>
            GlobalContext.makeF.makeDummyStatementTry(stmts, this.catchBlock),
        );
    }
}

/**
 * Generates expression statements.
 * The return value of the function/method calls generated by this is never used.
 */
export class StatementExpression extends GenerativeEntity<Ast.Statement> {
    constructor(
        private expr: fc.Arbitrary<Ast.Expression>,
        type: Type = STMT_TY,
    ) {
        super(type);
    }
    generate(): fc.Arbitrary<Ast.Statement> {
        return this.expr.map((expr) =>
            GlobalContext.makeF.makeDummyStatementExpression(expr),
        );
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
export class Statement extends GenerativeEntity<Ast.Statement> {
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

    generate(): fc.Arbitrary<Ast.Statement> {
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
    private makeVarAssign(): fc.Arbitrary<Ast.Statement> | undefined {
        const varEntries: [string, Type][] =
            this.parentScope.getNamedEntriesRecursive("let");
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
    private makeFieldAssign(): fc.Arbitrary<Ast.Statement> | undefined {
        if (!this.parentScope.definedIn("method")) {
            return undefined;
        }
        const fieldEntries: [string, Type][] =
            this.parentScope.getNamedEntriesRecursive("field");
        if (fieldEntries.length === 0) {
            return undefined;
        }
        const arbs = fieldEntries.map(([name, ty]) => {
            const expr = new Expression(this.parentScope, ty).generate();
            return new AssignStatement(
                GlobalContext.makeF.makeDummyFieldAccess(
                    makeSelfID(),
                    GlobalContext.makeF.makeDummyId(name),
                ),
                expr,
                ty,
            ).generate();
        });
        return arbs.length > 0 ? fc.oneof(...arbs) : undefined;
    }

    /**
     * Creates either while or until loops.
     */
    private makeWhileUntil(): fc.Arbitrary<Ast.Statement> | undefined {
        if (this.recursionLevel >= this.nestedBlocksNum) {
            return undefined;
        }
        const condition = new Expression(this.parentScope, {
            kind: "stdlib",
            type: StdlibType.Bool,
        }).generate();
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
    private makeRepeat(): fc.Arbitrary<Ast.Statement> | undefined {
        if (this.recursionLevel >= this.nestedBlocksNum) {
            return undefined;
        }
        const body = this.makeStmtsBlock();
        return new RepeatStatement(this.parentScope, body).generate();
    }

    /**
     * Collects all local map Ast.Ids in parent scope.
     */
    private collectLocalMapIds(entryKinds: NamedScopeItemKind[]): Ast.Id[] {
        return this.parentScope
            .getNamedEntriesRecursive(...entryKinds)
            .filter(([_, mapTy]: [string, Type]) => mapTy.kind === "map")
            .map(([mapName, _]: [string, Type]) =>
                generateAstIdFromName(mapName),
            );
    }

    /**
     * Collects all field map Ast.Ids in parent scope.
     */
    private collectFieldMapIds(
        entryKinds: NamedScopeItemKind[],
    ): Ast.FieldAccess[] {
        return this.parentScope
            .getNamedEntriesRecursive(...entryKinds)
            .filter(([_, mapTy]: [string, Type]) => mapTy.kind === "map")
            .map(([mapName, _]: [string, Type]) =>
                GlobalContext.makeF.makeDummyFieldAccess(
                    makeSelfID(),
                    GlobalContext.makeF.makeDummyId(mapName),
                ),
            );
    }

    /**
     * Generates foreach loops.
     */
    private makeForEach(): fc.Arbitrary<Ast.Statement> | undefined {
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
        const map: fc.Arbitrary<Ast.Expression> = fc.oneof(...mapIds);
        const keyVarName = createSample(generateName(scope));
        const valueVarName = createSample(generateName(scope));
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
    private makeCondition(): fc.Arbitrary<Ast.StatementCondition> | undefined {
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
    private makeTryCatch(): fc.Arbitrary<Ast.Statement> | undefined {
        if (this.recursionLevel >= this.nestedBlocksNum) {
            return undefined;
        }
        const tryStmts = this.makeStmtsBlock();
        if (randomBool()) {
            const catchScope = new Scope("block", this.parentScope);
            const catchName = createSample(generateName(catchScope));
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
    private makeCall(): fc.Arbitrary<Ast.Statement> | undefined {
        if (this.recursionLevel >= this.nestedBlocksNum) {
            return undefined;
        }
        if (this.parentScope.definedIn("method", "contract") && randomBool()) {
            // Call a method
            const methodEntries =
                this.parentScope.getNamedEntriesRecursive("methodDef");
            if (methodEntries.length === 0) {
                return undefined;
            }
            const [funName, funTy] = randomElement(methodEntries);
            return new StatementExpression(
                new MethodCall(
                    funTy,
                    funName,
                    makeSelfID(),
                    generateMethodCallArgs(funTy, this.parentScope),
                ).generate(),
            ).generate();
        } else {
            // Call a function
            const funEntries =
                this.parentScope.getNamedEntriesRecursive("functionDef");
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
    private makeStmtsBlock(blockScope?: Scope): fc.Arbitrary<Ast.Statement>[] {
        const scope = blockScope ?? new Scope("block", this.parentScope);
        const block: fc.Arbitrary<Ast.Statement>[] = [];
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
    private makeDummyStmt(): fc.Arbitrary<Ast.Statement> {
        return new WhileUntilStatement(
            fc.constant(GlobalContext.makeF.makeDummyBoolean(false)),
            [],
            "while",
        ).generate();
    }
}
