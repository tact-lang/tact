import { throwInternalCompilerError } from "../errors";
import { funcIdOf, cast, ops, freshIdentifier } from "./util";
import { getType, resolveTypeRef } from "../types/resolveDescriptors";
import { getExpType } from "../types/resolveExpression";
import { TypeRef } from "../types/types";
import {
    AstCondition,
    AstStatementReturn,
    AstStatementUntil,
    AstStatementRepeat,
    AstStatementTryCatch,
    AstStatementTry,
    AstStatementWhile,
    AstStatementForEach,
    AstStatementAugmentedAssign,
    AstStatementAssign,
    AstStatementLet,
    AstExpression,
    AstStatement,
    isWildcard,
    tryExtractPath,
} from "../grammar/ast";
import { ExpressionGen, writePathExpression, WriterContext } from ".";
import { resolveFuncTypeUnpack, resolveFuncType } from "./type";
import {
    FuncAstStatement,
    FuncAstStatementCondition,
    FuncAstExpression,
    FuncCatchDefintions,
} from "../func/grammar";
import {
    id,
    expr,
    call,
    ret,
    while_,
    try_,
    doUntil,
    int,
    repeat,
    augassign,
    tensor,
    assign,
    unit,
    condition,
    tryCatch,
    conditionElseif,
    vardef,
    Type,
} from "../func/syntaxConstructors";

/**
 * Encapsulates generation of Func statements from the Tact statement.
 */
export class StatementGen {
    /**
     * @param tactStmt Tact AST statement
     * @param selfName Actual name of the `self` parameter present in the Func code.
     * @param returns The return value of the return statement.
     */
    private constructor(
        private ctx: WriterContext,
        private tactStmt: AstStatement,
        private selfName?: string,
        private returns?: TypeRef,
    ) {}

    static fromTact(
        ctx: WriterContext,
        tactStmt: AstStatement,
        selfVarName?: string,
        returns?: TypeRef,
    ): StatementGen {
        return new StatementGen(ctx, tactStmt, selfVarName, returns);
    }

    /**
     * Translates an expression in the current context.
     */
    private makeExpr(expr: AstExpression): FuncAstExpression {
        return ExpressionGen.fromTact(this.ctx, expr).writeExpression();
    }

    private writeCastedExpr(
        expr: AstExpression,
        to: TypeRef,
    ): FuncAstExpression {
        return ExpressionGen.fromTact(this.ctx, expr).writeCastedExpression(to);
    }

    /**
     * Tranforms the Tact conditional statement to the Func one.
     */
    private writeCondition(f: AstCondition): FuncAstStatementCondition {
        const writeStmt = (stmt: AstStatement) =>
            StatementGen.fromTact(
                this.ctx,
                stmt,
                this.selfName,
                this.returns,
            ).writeStatement();
        const cond = this.makeExpr(f.condition);
        const thenBlock = f.trueStatements.map(writeStmt).flat();
        const elseBlock = f.falseStatements?.map(writeStmt).flat();
        if (f.elseif) {
            return conditionElseif(
                cond,
                thenBlock,
                this.makeExpr(f.elseif.condition),
                f.elseif.trueStatements.map(writeStmt).flat(),
                elseBlock,
            );
        } else {
            return condition(cond, thenBlock, elseBlock);
        }
    }

    public writeStatement(): FuncAstStatement[] | never {
        switch (this.tactStmt.kind) {
            case "statement_return": {
                return [this.writeReturnStatement(this.tactStmt)];
            }
            case "statement_let": {
                return [this.writeLetStatement(this.tactStmt)];
            }
            case "statement_assign": {
                return [this.writeAssignStatement(this.tactStmt)];
            }
            case "statement_augmentedassign": {
                return [this.writeAugmentedAssignStatement(this.tactStmt)];
            }
            case "statement_condition": {
                return [this.writeCondition(this.tactStmt)];
            }
            case "statement_expression": {
                return [expr(this.makeExpr(this.tactStmt.expression))];
            }
            case "statement_while": {
                return [this.writeWhileStatement(this.tactStmt)];
            }
            case "statement_until": {
                return [this.writeUntilStatement(this.tactStmt)];
            }
            case "statement_repeat": {
                return [this.writeRepeatStatement(this.tactStmt)];
            }
            case "statement_try": {
                return [this.writeTryStatement(this.tactStmt)];
            }
            case "statement_try_catch": {
                return [this.writeTryCatchStatement(this.tactStmt)];
            }
            case "statement_foreach": {
                return this.writeForeachStatement(this.tactStmt);
            }
            default: {
                throw Error(`Unknown statement: ${this.tactStmt}`);
            }
        }
    }

    private writeReturnStatement(stmt: AstStatementReturn): FuncAstStatement {
        const selfVar = this.selfName ? id(this.selfName) : undefined;
        const getValue = (expr: FuncAstExpression): FuncAstExpression =>
            this.selfName ? tensor(selfVar!, expr) : expr;

        if (stmt.expression) {
            const castedReturns = this.writeCastedExpr(
                stmt.expression,
                this.returns!,
            );
            return ret(getValue(castedReturns));
        } else {
            return ret(getValue(unit()));
        }
    }

    private writeLetStatement(stmt: AstStatementLet): FuncAstStatement {
        // Underscore name case
        if (isWildcard(stmt.name)) {
            return expr(this.makeExpr(stmt.expression));
        }

        // Contract/struct case
        const t =
            stmt.type === null
                ? getExpType(this.ctx.ctx, stmt.expression)
                : resolveTypeRef(this.ctx.ctx, stmt.type);

        if (t.kind === "ref") {
            const tt = getType(this.ctx.ctx, t.name);
            if (tt.kind === "contract" || tt.kind === "struct") {
                if (t.optional) {
                    const name = funcIdOf(stmt.name);
                    const init = this.writeCastedExpr(stmt.expression, t);
                    return vardef(Type.tuple(), name, init);
                } else {
                    const name = resolveFuncTypeUnpack(
                        this.ctx.ctx,
                        t,
                        funcIdOf(stmt.name),
                    );
                    const init = this.writeCastedExpr(stmt.expression, t);
                    return vardef("_", name, init);
                }
            }
        }

        const ty = resolveFuncType(this.ctx.ctx, t);
        const name = funcIdOf(stmt.name);
        const init = this.writeCastedExpr(stmt.expression, t);
        return vardef(ty, name, init);
    }

    private writeAssignStatement(stmt: AstStatementAssign): FuncAstStatement {
        const lvaluePath = tryExtractPath(stmt.path);
        if (lvaluePath === null) {
            throwInternalCompilerError(
                [
                    `Assignments are allowed only into path expressions, i.e. identifiers, or sequences`,
                    `of direct contract/struct/message accesses, like "self.foo" or "self.structure.field"`,
                ].join(" "),
                stmt.path.loc,
            );
        }
        const path = writePathExpression(lvaluePath);
        const t = getExpType(this.ctx.ctx, stmt.path);
        if (t.kind === "ref") {
            const tt = getType(this.ctx.ctx, t.name);
            if (tt.kind === "contract" || tt.kind === "struct") {
                const lhs = id(
                    resolveFuncTypeUnpack(this.ctx.ctx, t, path.value),
                );
                const rhs = this.writeCastedExpr(stmt.expression, t);
                return expr(assign(lhs, rhs));
            }
        }
        const rhs = this.writeCastedExpr(stmt.expression, t);
        return expr(assign(path, rhs));
    }

    private writeAugmentedAssignStatement(
        stmt: AstStatementAugmentedAssign,
    ): FuncAstStatement {
        const lvaluePath = tryExtractPath(stmt.path);
        if (lvaluePath === null) {
            throwInternalCompilerError(
                [
                    `Assignments are allowed only into path expressions, i.e. identifiers, or sequences`,
                    `of direct contract/struct/message accesses, like "self.foo" or "self.structure.field"`,
                ].join(" "),
                stmt.path.loc,
            );
        }
        const path = writePathExpression(lvaluePath);
        const t = getExpType(this.ctx.ctx, stmt.path);
        return expr(
            assign(
                path,
                cast(
                    this.ctx.ctx,
                    t,
                    t,
                    augassign(
                        path,
                        `${stmt.op}=`,
                        this.makeExpr(stmt.expression),
                    ),
                ),
            ),
        );
    }

    private writeWhileStatement(stmt: AstStatementWhile): FuncAstStatement {
        const condition = this.makeExpr(stmt.condition);
        const body = stmt.statements
            .map((s) =>
                StatementGen.fromTact(
                    this.ctx,
                    s,
                    this.selfName,
                    this.returns,
                ).writeStatement(),
            )
            .flat();
        return while_(condition, body);
    }

    private writeUntilStatement(stmt: AstStatementUntil): FuncAstStatement {
        const condition = this.makeExpr(stmt.condition);
        const body = stmt.statements
            .map((s) =>
                StatementGen.fromTact(
                    this.ctx,
                    s,
                    this.selfName,
                    this.returns,
                ).writeStatement(),
            )
            .flat();
        return doUntil(condition, body);
    }

    private writeRepeatStatement(stmt: AstStatementRepeat): FuncAstStatement {
        const iterations = this.makeExpr(stmt.iterations);
        const body = stmt.statements
            .map((s) =>
                StatementGen.fromTact(
                    this.ctx,
                    s,
                    this.selfName,
                    this.returns,
                ).writeStatement(),
            )
            .flat();
        return repeat(iterations, body);
    }

    private writeTryStatement(stmt: AstStatementTry): FuncAstStatement {
        const body = stmt.statements
            .map((s) =>
                StatementGen.fromTact(
                    this.ctx,
                    s,
                    this.selfName,
                    this.returns,
                ).writeStatement(),
            )
            .flat();
        return try_(body);
    }

    private writeTryCatchStatement(
        stmt: AstStatementTryCatch,
    ): FuncAstStatement {
        const generateStatements = (statements: any[]) =>
            statements
                .map((s) =>
                    StatementGen.fromTact(
                        this.ctx,
                        s,
                        this.selfName,
                        this.returns,
                    ).writeStatement(),
                )
                .flat();
        const body = generateStatements(stmt.statements);
        const catchStmts = generateStatements(stmt.catchStatements);
        const catchNames: "_" | FuncCatchDefintions = isWildcard(stmt.catchName)
            ? "_"
            : ({
                  exceptionName: id("_"),
                  exitCodeName: id(funcIdOf(stmt.catchName)),
              } as FuncCatchDefintions);
        return tryCatch(body, catchNames, catchStmts);
    }

    private writeForeachStatement(
        stmt: AstStatementForEach,
    ): FuncAstStatement[] {
        const mapPath = tryExtractPath(stmt.map);
        if (mapPath === null) {
            throwInternalCompilerError(
                [
                    "foreach is only allowed over maps that are path expressions, i.e. identifiers, or sequences",
                    `of direct contract/struct/message accesses, like "self.foo" or "self.structure.field"`,
                ].join(" "),
                stmt.map.loc,
            );
        }
        const path = writePathExpression(mapPath);
        const t = getExpType(this.ctx.ctx, stmt.map);
        if (t.kind !== "map") {
            throw Error("Unknown map type");
        }
        const flag = freshIdentifier("flag");
        const key = isWildcard(stmt.keyName)
            ? freshIdentifier("underscore")
            : funcIdOf(stmt.keyName);
        const value = isWildcard(stmt.valueName)
            ? freshIdentifier("underscore")
            : funcIdOf(stmt.valueName);

        // Handle Int key
        if (t.key === "Int") {
            // Generates FunC code for non-struct values
            const generatePrimitive = (
                varFun: FuncAstExpression,
                funcall: FuncAstExpression,
            ): FuncAstStatement[] => {
                let whileBody: FuncAstStatement[] = [];
                for (const s of stmt.statements) {
                    whileBody = whileBody.concat(
                        StatementGen.fromTact(
                            this.ctx,
                            s,
                            this.selfName,
                            this.returns,
                        ).writeStatement(),
                    );
                }
                whileBody.push(
                    expr(assign(tensor(id(key), id(value), id(flag)), funcall)),
                );
                return [
                    vardef("_", [key, value, flag], varFun),
                    while_(id(flag), whileBody),
                ];
            };
            let bits = 257;
            let kind = "int";
            if (t.keyAs?.startsWith("int")) {
                bits = parseInt(t.keyAs.slice(3), 10);
            } else if (t.keyAs?.startsWith("uint")) {
                bits = parseInt(t.keyAs.slice(4), 10);
                kind = "uint";
            }
            if (t.value === "Int") {
                let vBits = 257;
                let vKind = "int";
                if (t.valueAs?.startsWith("int")) {
                    vBits = parseInt(t.valueAs.slice(3), 10);
                } else if (t.valueAs?.startsWith("uint")) {
                    vKind = "uint";
                }
                return generatePrimitive(
                    call(`__tact_dict_min_${kind}_${vKind}`, [
                        path,
                        int(bits),
                        int(vBits),
                    ]),
                    call(`__tact_dict_next_${kind}_${vKind}`, [
                        path,
                        id(key),
                        int(bits),
                        int(vBits),
                    ]),
                );
            } else if (t.value === "Bool") {
                return generatePrimitive(
                    call(`__tact_dict_min_${kind}_int`, [
                        path,
                        int(bits),
                        int(1),
                    ]),
                    call(`__tact_dict_next_${kind}_int`, [
                        path,
                        int(bits),
                        id(key),
                        int(1),
                    ]),
                );
            } else if (t.value === "Cell") {
                return generatePrimitive(
                    call(`__tact_dict_next_${kind}_cell`, [
                        path,
                        int(bits),
                        id(key),
                    ]),
                    call(`__tact_dict_next_${kind}_cell`, [
                        path,
                        int(bits),
                        id(key),
                    ]),
                );
            } else if (t.value === "Address") {
                return generatePrimitive(
                    call(`__tact_dict_min_${kind}_slice`, [path, int(bits)]),
                    call(`__tact_dict_next_${kind}_slice`, [
                        path,
                        int(bits),
                        id(key),
                    ]),
                );
            } else {
                // Value is a struct
                const v = vardef(
                    "_",
                    [key, value, flag],
                    call(`__tact_dict_min_${kind}_cell`, [path, int(bits)]),
                );
                let whileBody: FuncAstStatement[] = [];
                whileBody.push(
                    vardef(
                        "_",
                        resolveFuncTypeUnpack(
                            this.ctx.ctx,
                            t.value,
                            funcIdOf(stmt.valueName),
                        ),
                        call(ops.typeNotNull(t.value), [id(value)]),
                    ),
                );
                for (const s of stmt.statements) {
                    whileBody = whileBody.concat(
                        StatementGen.fromTact(
                            this.ctx,
                            s,
                            this.selfName,
                            this.returns,
                        ).writeStatement(),
                    );
                }
                whileBody.push(
                    expr(
                        assign(
                            tensor(id(key), id(value), id(flag)),
                            call(`__tact_dict_next_${kind}_cell`, [
                                path,
                                int(bits),
                                id(key),
                            ]),
                        ),
                    ),
                );
                return [v, while_(id(flag), whileBody)];
            }
        }

        return [];
    }
}
