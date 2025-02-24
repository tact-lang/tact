import type { AstExpression, AstId, AstStatement } from "../ast/ast";
import { idText, isSelfId, tryExtractPath } from "../ast/ast-helpers";
import type { CompilerContext } from "../context/context";
import { getAllTypes, getType } from "./resolveDescriptors";
import { idTextErr, throwInternalCompilerError } from "../error/errors";
import { getExpType } from "./resolveExpression";

export type Effect = "contractStorageRead" | "contractStorageWrite";

export function computeReceiversEffects(ctx: CompilerContext) {
    for (const type of getAllTypes(ctx)) {
        if (type.kind === "contract") {
            for (const receiver of type.receivers) {
                receiver.effects = statementListEffects(
                    receiver.ast.statements,
                    new Set(),
                    ctx,
                );
            }
        }
    }
}

function statementListEffects(
    statements: readonly AstStatement[],
    processedContractMethods: ReadonlySet<AstId>,
    ctx: CompilerContext,
): ReadonlySet<Effect> {
    return statements.reduce(
        (effects, stmt) =>
            effects.union(
                statementEffects(stmt, processedContractMethods, ctx),
            ),
        new Set<Effect>(),
    );
}

function statementEffects(
    stmt: AstStatement,
    processedContractMethods: ReadonlySet<AstId>,
    ctx: CompilerContext,
): ReadonlySet<Effect> {
    switch (stmt.kind) {
        case "statement_let":
        case "statement_expression":
        case "statement_destruct": {
            return expressionEffects(
                stmt.expression,
                processedContractMethods,
                ctx,
            );
        }
        case "statement_return": {
            return stmt.expression
                ? expressionEffects(
                      stmt.expression,
                      processedContractMethods,
                      ctx,
                  )
                : new Set<Effect>();
        }
        case "statement_assign":
        case "statement_augmentedassign": {
            // since we don't analyze method bodies, we know `self` refers to the contract itself
            const [head, _] = tryExtractPath(stmt.path) ?? [];
            if (typeof head === "undefined") {
                throwInternalCompilerError(
                    "Not an l-value and typechecker should have caught it",
                    stmt.path.loc,
                );
            }

            if (isSelfId(head)) {
                const lvalueEffects =
                    stmt.kind === "statement_augmentedassign"
                        ? new Set<Effect>([
                              "contractStorageWrite",
                              "contractStorageRead",
                          ])
                        : new Set<Effect>(["contractStorageWrite"]);
                return lvalueEffects.union(
                    expressionEffects(
                        stmt.expression,
                        processedContractMethods,
                        ctx,
                    ),
                );
            } else {
                return expressionEffects(
                    stmt.expression,
                    processedContractMethods,
                    ctx,
                );
            }
        }
        case "statement_condition": {
            return expressionEffects(
                stmt.condition,
                processedContractMethods,
                ctx,
            )
                .union(
                    statementListEffects(
                        stmt.trueStatements,
                        processedContractMethods,
                        ctx,
                    ),
                )
                .union(
                    statementListEffects(
                        stmt.falseStatements ?? [],
                        processedContractMethods,
                        ctx,
                    ),
                );
        }
        case "statement_while":
        case "statement_until": {
            return expressionEffects(
                stmt.condition,
                processedContractMethods,
                ctx,
            ).union(
                statementListEffects(
                    stmt.statements,
                    processedContractMethods,
                    ctx,
                ),
            );
        }
        case "statement_repeat": {
            return expressionEffects(
                stmt.iterations,
                processedContractMethods,
                ctx,
            ).union(
                statementListEffects(
                    stmt.statements,
                    processedContractMethods,
                    ctx,
                ),
            );
        }
        case "statement_try": {
            return statementListEffects(
                stmt.statements,
                processedContractMethods,
                ctx,
            ).union(
                statementListEffects(
                    stmt.catchBlock?.catchStatements ?? [],
                    processedContractMethods,
                    ctx,
                ),
            );
        }
        case "statement_foreach": {
            return expressionEffects(
                stmt.map,
                processedContractMethods,
                ctx,
            ).union(
                statementListEffects(
                    stmt.statements,
                    processedContractMethods,
                    ctx,
                ),
            );
        }
        case "statement_block": {
            return statementListEffects(
                stmt.statements,
                processedContractMethods,
                ctx,
            );
        }
    }
}

function expressionEffects(
    expr: AstExpression,
    processedContractMethods: ReadonlySet<AstId>,
    ctx: CompilerContext,
): ReadonlySet<Effect> {
    switch (expr.kind) {
        case "id": {
            return new Set<Effect>();
        }
        case "field_access": {
            // we only analyze receiver bodies and contract methods calls
            // so we now `self` refers to the contract itself
            return expr.aggregate.kind === "id" && isSelfId(expr.aggregate)
                ? new Set<Effect>(["contractStorageRead"])
                : expressionEffects(
                      expr.aggregate,
                      processedContractMethods,
                      ctx,
                  );
        }
        case "method_call": {
            const selfAndArgsEffects = expr.args
                .reduce(
                    (effects, argExpr) =>
                        effects.union(
                            expressionEffects(
                                argExpr,
                                processedContractMethods,
                                ctx,
                            ),
                        ),
                    new Set<Effect>(),
                )
                .union(
                    expressionEffects(expr.self, processedContractMethods, ctx),
                );

            return selfAndArgsEffects.union(
                methodEffects(
                    expr.self,
                    expr.method,
                    processedContractMethods,
                    ctx,
                ),
            );
        }
        case "string":
        case "number":
        case "boolean":
        case "slice":
        case "null":
        case "simplified_string":
        case "address":
        case "cell":
        case "struct_value":
        case "code_of": {
            return new Set<Effect>();
        }
        case "op_binary": {
            return expressionEffects(
                expr.left,
                processedContractMethods,
                ctx,
            ).union(
                expressionEffects(expr.right, processedContractMethods, ctx),
            );
        }
        case "op_unary": {
            return expressionEffects(
                expr.operand,
                processedContractMethods,
                ctx,
            );
        }
        case "conditional": {
            return expressionEffects(
                expr.condition,
                processedContractMethods,
                ctx,
            )
                .union(
                    expressionEffects(
                        expr.thenBranch,
                        processedContractMethods,
                        ctx,
                    ),
                )
                .union(
                    expressionEffects(
                        expr.elseBranch,
                        processedContractMethods,
                        ctx,
                    ),
                );
        }
        case "init_of":
        case "static_call": {
            // global (static) functions cannot change contract storage because of the call-by-value semantics, so we don't analyze their bodies
            return expr.args.reduce(
                (effects, argExpr) =>
                    effects.union(
                        expressionEffects(
                            argExpr,
                            processedContractMethods,
                            ctx,
                        ),
                    ),
                new Set<Effect>(),
            );
        }
        case "struct_instance": {
            return expr.args.reduce(
                (effects, field) =>
                    effects.union(
                        expressionEffects(
                            field.initializer,
                            processedContractMethods,
                            ctx,
                        ),
                    ),
                new Set<Effect>(),
            );
        }
    }
}

function methodEffects(
    self: AstExpression,
    method: AstId,
    processedContractMethods: ReadonlySet<AstId>,
    ctx: CompilerContext,
): ReadonlySet<Effect> {
    const selfTypeRef = getExpType(ctx, self);

    // contract method call: self.foo(), since variable shadowing is not allowed
    if (selfTypeRef.kind === "ref") {
        const selfType = getType(ctx, selfTypeRef.name);

        if (selfType.kind === "contract") {
            if (processedContractMethods.has(method)) {
                return new Set();
            }

            const methodDescr = selfType.functions.get(idText(method));
            if (typeof methodDescr === "undefined") {
                throwInternalCompilerError(
                    `Method ${idTextErr(method)} not found in contract ${selfTypeRef.name}`,
                    method.loc,
                );
            }
            switch (methodDescr.ast.kind) {
                case "function_decl":
                    {
                        throwInternalCompilerError(
                            `Cannot call a function declaration ${idTextErr(method)} on contract ${selfTypeRef.name}`,
                            method.loc,
                        );
                    }
                    break;
                case "asm_function_def":
                case "native_function_decl": {
                    // Cannot analyze the effects of native and asm functions
                    // so we make the most conservative approximation
                    return methodDescr.isMutating
                        ? new Set<Effect>([
                              "contractStorageRead",
                              "contractStorageWrite",
                          ])
                        : new Set<Effect>(["contractStorageRead"]);
                }
                case "function_def": {
                    // TODO handle recursion
                    // essentially we inline contract method calls (modulo recursion)
                    return statementListEffects(
                        methodDescr.ast.statements,
                        processedContractMethods.union(new Set([method])),
                        ctx,
                    );
                }
            }
        }
    }

    const [head, ...rest] = tryExtractPath(self) ?? [];

    // method call on a contract storage variable: e.g. self.x.inc()
    if (typeof head !== "undefined" && isSelfId(head) && rest.length > 0) {
        switch (selfTypeRef.kind) {
            case "map":
                {
                    switch (idText(method)) {
                        case "set":
                        case "replace":
                        case "replaceGet":
                        case "del": {
                            return new Set<Effect>([
                                "contractStorageRead",
                                "contractStorageWrite",
                            ]);
                        }
                        case "get":
                        case "asCell":
                        case "isEmpty":
                        case "exists":
                        case "deepEquals": {
                            return new Set<Effect>(["contractStorageRead"]);
                        }
                        default:
                            throwInternalCompilerError(
                                `Invalid method call on map: ${idTextErr(method)}`,
                                method.loc,
                            );
                    }
                }
                break;
            case "ref": {
                const selfType = getType(ctx, selfTypeRef.name);
                const methodDescr = selfType.functions.get(idText(method));
                if (typeof methodDescr === "undefined") {
                    throwInternalCompilerError(
                        `Method ${idTextErr(method)} not found in type ${selfTypeRef.name}`,
                        method.loc,
                    );
                }
                return methodDescr.isMutating
                    ? new Set<Effect>([
                          "contractStorageRead",
                          "contractStorageWrite",
                      ])
                    : new Set<Effect>(["contractStorageRead"]);
            }
            case "ref_bounced":
            case "void":
            case "null": {
                throwInternalCompilerError(
                    "Invalid type for method call",
                    self.loc,
                );
            }
        }
    }
    return new Set<Effect>();
}
