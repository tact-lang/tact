import { CompilerContext } from "../context";
import { throwInternalCompilerError } from "../errors";
import { funcIdOf } from "./util";
import { getType, resolveTypeRef } from "../types/resolveDescriptors";
import { getExpType } from "../types/resolveExpression";
import { TypeRef } from "../types/types";
import {
    AstCondition,
    AstExpression,
    AstStatement,
    isWildcard,
    tryExtractPath,
} from "../grammar/ast";
import { ExpressionGen, writePathExpression } from "./expression";
import { resolveFuncTypeUnpack, resolveFuncType } from "./type";
import {
    FuncAstStmt,
    FuncAstConditionStmt,
    FuncAstExpr,
    FuncAstTupleExpr,
    FuncAstUnitExpr,
} from "../func/syntax";
import { makeId, makeExprStmt } from "../func/syntaxUtils";

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
        private ctx: CompilerContext,
        private tactStmt: AstStatement,
        private selfName?: string,
        private returns?: TypeRef,
    ) {}

    static fromTact(
        ctx: CompilerContext,
        tactStmt: AstStatement,
        selfVarName?: string,
        returns?: TypeRef,
    ): StatementGen {
        return new StatementGen(ctx, tactStmt, selfVarName, returns);
    }

    /**
     * Translates an expression in the current context.
     */
    private makeExpr(expr: AstExpression): FuncAstExpr {
        return ExpressionGen.fromTact(this.ctx, expr).writeExpression();
    }

    private makeCastedExpr(expr: AstExpression, to: TypeRef): FuncAstExpr {
        return ExpressionGen.fromTact(this.ctx, expr).writeCastedExpression(to);
    }

    /**
     * Tranforms the Tact conditional statement to the Func one.
     */
    private writeCondition(f: AstCondition): FuncAstConditionStmt {
        const writeStmt = (stmt: AstStatement) =>
            StatementGen.fromTact(
                this.ctx,
                stmt,
                this.selfName,
                this.returns,
            ).writeStatement();
        const condition = this.makeExpr(f.condition);
        const thenBlock = f.trueStatements.map(writeStmt);
        const elseStmt: FuncAstConditionStmt | undefined =
            f.falseStatements !== null && f.falseStatements.length > 0
                ? {
                      kind: "condition_stmt",
                      condition: undefined,
                      ifnot: false,
                      body: f.falseStatements.map(writeStmt),
                      else: undefined,
                  }
                : f.elseif
                  ? this.writeCondition(f.elseif)
                  : undefined;
        return {
            kind: "condition_stmt",
            condition,
            ifnot: false,
            body: thenBlock,
            else: elseStmt,
        };
    }

    public writeStatement(): FuncAstStmt {
        switch (this.tactStmt.kind) {
            case "statement_return": {
                const kind = "return_stmt";
                const selfVar = this.selfName
                    ? { kind: "id", value: this.selfName }
                    : undefined;
                const getValue = (expr: FuncAstExpr): FuncAstExpr =>
                    this.selfName
                        ? ({
                              kind: "tuple_expr",
                              values: [selfVar!, expr],
                          } as FuncAstTupleExpr)
                        : expr;
                if (this.tactStmt.expression) {
                    const castedReturns = this.makeCastedExpr(
                        this.tactStmt.expression,
                        this.returns!,
                    );
                    return { kind, value: getValue(castedReturns) };
                } else {
                    const unit = { kind: "unit_expr" } as FuncAstUnitExpr;
                    return { kind, value: getValue(unit) };
                }
            }
            case "statement_let": {
                // Underscore name case
                if (isWildcard(this.tactStmt.name)) {
                    return makeExprStmt(
                        this.makeExpr(this.tactStmt.expression),
                    );
                }

                // Contract/struct case
                const t =
                    this.tactStmt.type === null
                        ? getExpType(this.ctx, this.tactStmt.expression)
                        : resolveTypeRef(this.ctx, this.tactStmt.type);

                if (t.kind === "ref") {
                    const tt = getType(this.ctx, t.name);
                    if (tt.kind === "contract" || tt.kind === "struct") {
                        if (t.optional) {
                            const name = funcIdOf(this.tactStmt.name);
                            const init = this.makeCastedExpr(
                                this.tactStmt.expression,
                                t,
                            );
                            return {
                                kind: "var_def_stmt",
                                name,
                                ty: { kind: "tuple" },
                                init,
                            };
                        } else {
                            const name = resolveFuncTypeUnpack(
                                this.ctx,
                                t,
                                funcIdOf(this.tactStmt.name),
                            );
                            const init = this.makeCastedExpr(
                                this.tactStmt.expression,
                                t,
                            );
                            return {
                                kind: "var_def_stmt",
                                name,
                                ty: undefined,
                                init,
                            };
                        }
                    }
                }

                const ty = resolveFuncType(this.ctx, t);
                const name = funcIdOf(this.tactStmt.name);
                const init = this.makeCastedExpr(this.tactStmt.expression, t);
                return { kind: "var_def_stmt", name, ty, init };
            }

            case "statement_assign": {
                // Prepare lvalue
                const lvaluePath = tryExtractPath(this.tactStmt.path);
                if (lvaluePath === null) {
                    // typechecker is supposed to catch this
                    throwInternalCompilerError(
                        `Assignments are allowed only into path expressions, i.e. identifiers, or sequences of direct contract/struct/message accesses, like "self.foo" or "self.structure.field"`,
                        this.tactStmt.path.loc,
                    );
                }
                const path = writePathExpression(lvaluePath);

                // Contract/struct case
                const t = getExpType(this.ctx, this.tactStmt.path);
                if (t.kind === "ref") {
                    const tt = getType(this.ctx, t.name);
                    if (tt.kind === "contract" || tt.kind === "struct") {
                        const lhs = makeId(
                            resolveFuncTypeUnpack(this.ctx, t, path.value),
                        );
                        const rhs = this.makeCastedExpr(
                            this.tactStmt.expression,
                            t,
                        );
                        return makeExprStmt({
                            kind: "assign_expr",
                            lhs,
                            rhs,
                        });
                    }
                }

                const rhs = this.makeCastedExpr(this.tactStmt.expression, t);
                return makeExprStmt({
                    kind: "assign_expr",
                    lhs: path,
                    rhs,
                });
            }

            //     case "statement_augmentedassign": {
            //         const lvaluePath = tryExtractPath(f.path);
            //         if (lvaluePath === null) {
            //             // typechecker is supposed to catch this
            //             throwInternalCompilerError(
            //                 `Assignments are allowed only into path expressions, i.e. identifiers, or sequences of direct contract/struct/message accesses, like "self.foo" or "self.structure.field"`,
            //                 f.path.loc,
            //             );
            //         }
            //         const path = writePathExpression(lvaluePath);
            //         const t = getExpType(ctx.ctx, f.path);
            //         ctx.append(
            //             `${path} = ${cast(t, t, `${path} ${f.op} ${writeExpression(f.expression, ctx)}`, ctx)};`,
            //         );
            //         return;
            //     }
            case "statement_condition": {
                return this.writeCondition(this.tactStmt);
            }
            case "statement_expression": {
                return makeExprStmt(this.makeExpr(this.tactStmt.expression));
            }
            //     case "statement_while": {
            //         ctx.append(`while (${writeExpression(f.condition, ctx)}) {`);
            //         ctx.inIndent(() => {
            //             for (const s of f.statements) {
            //                 writeStatement(s, self, returns, ctx);
            //             }
            //         });
            //         ctx.append(`}`);
            //         return;
            //     }
            //     case "statement_until": {
            //         ctx.append(`do {`);
            //         ctx.inIndent(() => {
            //             for (const s of f.statements) {
            //                 writeStatement(s, self, returns, ctx);
            //             }
            //         });
            //         ctx.append(`} until (${writeExpression(f.condition, ctx)});`);
            //         return;
            //     }
            //     case "statement_repeat": {
            //         ctx.append(`repeat (${writeExpression(f.iterations, ctx)}) {`);
            //         ctx.inIndent(() => {
            //             for (const s of f.statements) {
            //                 writeStatement(s, self, returns, ctx);
            //             }
            //         });
            //         ctx.append(`}`);
            //         return;
            //     }
            //     case "statement_try": {
            //         ctx.append(`try {`);
            //         ctx.inIndent(() => {
            //             for (const s of f.statements) {
            //                 writeStatement(s, self, returns, ctx);
            //             }
            //         });
            //         ctx.append("} catch (_) { }");
            //         return;
            //     }
            //     case "statement_try_catch": {
            //         ctx.append(`try {`);
            //         ctx.inIndent(() => {
            //             for (const s of f.statements) {
            //                 writeStatement(s, self, returns, ctx);
            //             }
            //         });
            //         if (isWildcard(f.catchName)) {
            //             ctx.append(`} catch (_) {`);
            //         } else {
            //             ctx.append(`} catch (_, ${funcIdOf(f.catchName)}) {`);
            //         }
            //         ctx.inIndent(() => {
            //             for (const s of f.catchStatements) {
            //                 writeStatement(s, self, returns, ctx);
            //             }
            //         });
            //         ctx.append(`}`);
            //         return;
            //     }
            //     case "statement_foreach": {
            //         const mapPath = tryExtractPath(f.map);
            //         if (mapPath === null) {
            //             // typechecker is supposed to catch this
            //             throwInternalCompilerError(
            //                 `foreach is only allowed over maps that are path expressions, i.e. identifiers, or sequences of direct contract/struct/message accesses, like "self.foo" or "self.structure.field"`,
            //                 f.map.loc,
            //             );
            //         }
            //         const path = writePathExpression(mapPath);
            //
            //         const t = getExpType(ctx.ctx, f.map);
            //         if (t.kind !== "map") {
            //             throw Error("Unknown map type");
            //         }
            //
            //         const flag = freshIdentifier("flag");
            //         const key = isWildcard(f.keyName)
            //             ? freshIdentifier("underscore")
            //             : funcIdOf(f.keyName);
            //         const value = isWildcard(f.valueName)
            //             ? freshIdentifier("underscore")
            //             : funcIdOf(f.valueName);
            //
            //         // Handle Int key
            //         if (t.key === "Int") {
            //             let bits = 257;
            //             let kind = "int";
            //             if (t.keyAs?.startsWith("int")) {
            //                 bits = parseInt(t.keyAs.slice(3), 10);
            //             } else if (t.keyAs?.startsWith("uint")) {
            //                 bits = parseInt(t.keyAs.slice(4), 10);
            //                 kind = "uint";
            //             }
            //             if (t.value === "Int") {
            //                 let vBits = 257;
            //                 let vKind = "int";
            //                 if (t.valueAs?.startsWith("int")) {
            //                     vBits = parseInt(t.valueAs.slice(3), 10);
            //                 } else if (t.valueAs?.startsWith("uint")) {
            //                     vBits = parseInt(t.valueAs.slice(4), 10);
            //                     vKind = "uint";
            //                 }
            //
            //                 ctx.append(
            //                     `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_${kind}_${vKind}`)}(${path}, ${bits}, ${vBits});`,
            //                 );
            //                 ctx.append(`while (${flag}) {`);
            //                 ctx.inIndent(() => {
            //                     for (const s of f.statements) {
            //                         writeStatement(s, self, returns, ctx);
            //                     }
            //                     ctx.append(
            //                         `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_${kind}_${vKind}`)}(${path}, ${bits}, ${key}, ${vBits});`,
            //                     );
            //                 });
            //                 ctx.append(`}`);
            //             } else if (t.value === "Bool") {
            //                 ctx.append(
            //                     `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_${kind}_int`)}(${path}, ${bits}, 1);`,
            //                 );
            //                 ctx.append(`while (${flag}) {`);
            //                 ctx.inIndent(() => {
            //                     for (const s of f.statements) {
            //                         writeStatement(s, self, returns, ctx);
            //                     }
            //                     ctx.append(
            //                         `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_${kind}_int`)}(${path}, ${bits}, ${key}, 1);`,
            //                     );
            //                 });
            //                 ctx.append(`}`);
            //             } else if (t.value === "Cell") {
            //                 ctx.append(
            //                     `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_${kind}_cell`)}(${path}, ${bits});`,
            //                 );
            //                 ctx.append(`while (${flag}) {`);
            //                 ctx.inIndent(() => {
            //                     for (const s of f.statements) {
            //                         writeStatement(s, self, returns, ctx);
            //                     }
            //                     ctx.append(
            //                         `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_${kind}_cell`)}(${path}, ${bits}, ${key});`,
            //                     );
            //                 });
            //                 ctx.append(`}`);
            //             } else if (t.value === "Address") {
            //                 ctx.append(
            //                     `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_${kind}_slice`)}(${path}, ${bits});`,
            //                 );
            //                 ctx.append(`while (${flag}) {`);
            //                 ctx.inIndent(() => {
            //                     for (const s of f.statements) {
            //                         writeStatement(s, self, returns, ctx);
            //                     }
            //                     ctx.append(
            //                         `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_${kind}_slice`)}(${path}, ${bits}, ${key});`,
            //                     );
            //                 });
            //                 ctx.append(`}`);
            //             } else {
            //                 // value is struct
            //                 ctx.append(
            //                     `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_${kind}_cell`)}(${path}, ${bits});`,
            //                 );
            //                 ctx.append(`while (${flag}) {`);
            //                 ctx.inIndent(() => {
            //                     ctx.append(
            //                         `var ${resolveFuncTypeUnpack(t.value, funcIdOf(f.valueName), ctx)} = ${ops.typeNotNull(t.value, ctx)}(${ops.readerOpt(t.value, ctx)}(${value}));`,
            //                     );
            //                     for (const s of f.statements) {
            //                         writeStatement(s, self, returns, ctx);
            //                     }
            //                     ctx.append(
            //                         `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_${kind}_cell`)}(${path}, ${bits}, ${key});`,
            //                     );
            //                 });
            //                 ctx.append(`}`);
            //             }
            //         }
            //
            //         // Handle address key
            //         if (t.key === "Address") {
            //             if (t.value === "Int") {
            //                 let vBits = 257;
            //                 let vKind = "int";
            //                 if (t.valueAs?.startsWith("int")) {
            //                     vBits = parseInt(t.valueAs.slice(3), 10);
            //                 } else if (t.valueAs?.startsWith("uint")) {
            //                     vBits = parseInt(t.valueAs.slice(4), 10);
            //                     vKind = "uint";
            //                 }
            //                 ctx.append(
            //                     `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_slice_${vKind}`)}(${path}, 267, ${vBits});`,
            //                 );
            //                 ctx.append(`while (${flag}) {`);
            //                 ctx.inIndent(() => {
            //                     for (const s of f.statements) {
            //                         writeStatement(s, self, returns, ctx);
            //                     }
            //                     ctx.append(
            //                         `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_slice_${vKind}`)}(${path}, 267, ${key}, ${vBits});`,
            //                     );
            //                 });
            //                 ctx.append(`}`);
            //             } else if (t.value === "Bool") {
            //                 ctx.append(
            //                     `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_slice_int`)}(${path}, 267, 1);`,
            //                 );
            //                 ctx.append(`while (${flag}) {`);
            //                 ctx.inIndent(() => {
            //                     for (const s of f.statements) {
            //                         writeStatement(s, self, returns, ctx);
            //                     }
            //                     ctx.append(
            //                         `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_slice_int`)}(${path}, 267, ${key}, 1);`,
            //                     );
            //                 });
            //                 ctx.append(`}`);
            //             } else if (t.value === "Cell") {
            //                 ctx.append(
            //                     `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_slice_cell`)}(${path}, 267);`,
            //                 );
            //                 ctx.append(`while (${flag}) {`);
            //                 ctx.inIndent(() => {
            //                     for (const s of f.statements) {
            //                         writeStatement(s, self, returns, ctx);
            //                     }
            //                     ctx.append(
            //                         `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_slice_cell`)}(${path}, 267, ${key});`,
            //                     );
            //                 });
            //                 ctx.append(`}`);
            //             } else if (t.value === "Address") {
            //                 ctx.append(
            //                     `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_slice_slice`)}(${path}, 267);`,
            //                 );
            //                 ctx.append(`while (${flag}) {`);
            //                 ctx.inIndent(() => {
            //                     for (const s of f.statements) {
            //                         writeStatement(s, self, returns, ctx);
            //                     }
            //                     ctx.append(
            //                         `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_slice_slice`)}(${path}, 267, ${key});`,
            //                     );
            //                 });
            //                 ctx.append(`}`);
            //             } else {
            //                 // value is struct
            //                 ctx.append(
            //                     `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_slice_cell`)}(${path}, 267);`,
            //                 );
            //                 ctx.append(`while (${flag}) {`);
            //                 ctx.inIndent(() => {
            //                     ctx.append(
            //                         `var ${resolveFuncTypeUnpack(t.value, funcIdOf(f.valueName), ctx)} = ${ops.typeNotNull(t.value, ctx)}(${ops.readerOpt(t.value, ctx)}(${value}));`,
            //                     );
            //                     for (const s of f.statements) {
            //                         writeStatement(s, self, returns, ctx);
            //                     }
            //                     ctx.append(
            //                         `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_slice_cell`)}(${path}, 267, ${key});`,
            //                     );
            //                 });
            //                 ctx.append(`}`);
            //             }
            //         }
            //
            //         return;
            //     }
        }

        throw Error(`Unknown statement kind: ${this.tactStmt.kind}`);
    }
}
