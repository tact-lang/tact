import type {CompilerContext} from "@/context/context";
import {getAllStaticFunctions, getAllTypes} from "@/types/resolveDescriptors";
import type * as Ast from "@/ast/ast";
import {registerExpType} from "@/types/resolveExpression";
import {binaryOperationFromAugmentedAssignOperation} from "@/ast/util";

export function desugar(ctx: CompilerContext): CompilerContext {
    const funcs = getAllStaticFunctions(ctx)

    for (const func of funcs) {
        if (func.ast.kind === "function_def") {
            func.ast = {
                ...func.ast,
                statements: func.ast.statements.flatMap(stmt => {
                    if (stmt.kind === "statement_augmentedassign") {
                        const binaryExpression: Ast.OpBinary = {
                            kind: "op_binary",
                            loc: stmt.loc,
                            id: stmt.id,
                            left: stmt.path,
                            right: stmt.expression,
                            op: binaryOperationFromAugmentedAssignOperation(stmt.op)
                        }
                        ctx = registerExpType(ctx, binaryExpression, {
                            kind: "ref",
                            name: "Int",
                            optional: false,
                        })

                        return {
                            kind: "statement_assign",
                            path: stmt.path,
                            expression: binaryExpression,
                            loc: stmt.loc,
                            id: stmt.id,
                        }
                    }

                    // if (stmt.kind === "statement_assign") {
                    //     const expr: Ast.Number = {
                    //         kind: "number",
                    //         base: 10,
                    //         value: 10000n,
                    //         id: stmt.id,
                    //         loc: stmt.loc,
                    //     };
                    //     ctx = registerExpType(ctx, expr, {
                    //         kind: "ref",
                    //         name: "Int",
                    //         optional: false,
                    //     })
                    //     return [
                    //         stmt,
                    //         {
                    //             kind: "statement_return",
                    //             expression: expr,
                    //             loc: stmt.loc,
                    //             id: stmt.id,
                    //         } satisfies Ast.StatementReturn as Ast.Statement
                    //     ]
                    // }
                    return [stmt]
                })
            }

        }
    }

    const types = getAllTypes(ctx)
    for (const type of types) {
        type.functions.forEach((func, key) => {
            if (type.name === "BaseTrait") {
                return
            }

            if (func.ast.kind === "function_def" && func.self) {
                const paramName: Ast.Id = {
                    kind: "id",
                    text: "self",
                    loc: func.ast.loc,
                    id: func.ast.id,
                };

                func.params.splice(0, 0, {
                    name: paramName,
                    type: {
                        kind: "ref",
                        name: func.self.kind === "ref" ? func.self.name : "",
                        optional: false,
                    },
                    loc: func.ast.loc,
                })

                func.ast = {
                    ...func.ast,
                    params: [
                        {
                            kind: "typed_parameter",
                            name: paramName,
                            type: {
                                kind: "type_id",
                                text: func.self.kind === "ref" ? func.self.name : "",
                                loc: func.ast.loc,
                                id: func.ast.id,
                            },
                            loc: func.ast.loc,
                            id: func.ast.id,
                        },
                        ...func.ast.params,
                    ]
                }

                type.functions.set(key, func)
            }

            console.log(func.name)
        })
    }

    return ctx;
}
