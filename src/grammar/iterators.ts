import { ASTNode, ASTStatement, ASTExpression } from "./ast";

/**
 * Recursively iterates over each expression in an ASTNode and applies a callback to each expression.
 * @param node The node to traverse.
 * @param callback The callback function to apply to each expression.
 */
export function forEachExpression(
    node: ASTNode,
    callback: (expr: ASTExpression) => void,
): void {
    function traverseExpression(expr: ASTExpression): void {
        callback(expr);

        switch (expr.kind) {
            case "op_binary":
                traverseExpression(expr.left);
                traverseExpression(expr.right);
                break;
            case "op_unary":
                traverseExpression(expr.right);
                break;
            case "op_field":
                traverseExpression(expr.src);
                break;
            case "op_call":
                traverseExpression(expr.src);
                expr.args.forEach(traverseExpression);
                break;
            case "op_static_call":
                expr.args.forEach(traverseExpression);
                break;
            case "op_new":
                expr.args.forEach((param) => traverseExpression(param.exp));
                break;
            case "init_of":
                expr.args.forEach(traverseExpression);
                break;
            case "conditional":
                traverseExpression(expr.condition);
                traverseExpression(expr.thenBranch);
                traverseExpression(expr.elseBranch);
                break;
            case "string":
            case "number":
            case "boolean":
            case "id":
            case "null":
            case "lvalue_ref":
                // Primitives and non-composite expressions don't require further traversal
                break;
            default:
                throw new Error("Unsupported expression");
        }
    }

    function traverseStatement(stmt: ASTStatement): void {
        switch (stmt.kind) {
            case "statement_let":
            case "statement_assign":
            case "statement_augmentedassign":
            case "statement_expression":
                traverseExpression(stmt.expression);
                break;
            case "statement_return":
                if (stmt.expression) traverseExpression(stmt.expression);
                break;
            case "statement_condition":
                traverseExpression(stmt.expression);
                stmt.trueStatements.forEach(traverseStatement);
                if (stmt.falseStatements)
                    stmt.falseStatements.forEach(traverseStatement);
                if (stmt.elseif) traverseStatement(stmt.elseif);
                break;
            case "statement_while":
            case "statement_until":
                traverseExpression(stmt.condition);
                stmt.statements.forEach(traverseStatement);
                break;
            case "statement_repeat":
                traverseExpression(stmt.iterations);
                stmt.statements.forEach(traverseStatement);
                break;
            case "statement_try":
            case "statement_foreach":
                stmt.statements.forEach(traverseStatement);
                break;
            case "statement_try_catch":
                stmt.statements.forEach(traverseStatement);
                stmt.catchStatements.forEach(traverseStatement);
                break;
            default:
                throw new Error("Unsupported statement");
        }
    }

    function traverseNode(node: ASTNode): void {
        switch (node.kind) {
            case "program":
                node.entries.forEach(traverseNode);
                break;
            case "def_native_function":
            case "def_struct":
            case "primitive":
                // These node types do not require further traversal of expressions or sub-nodes
                break;
            case "def_function":
            case "def_init_function":
            case "def_receive":
                if (node.statements) {
                    node.statements.forEach(traverseStatement);
                }
                break;
            case "def_contract":
            case "def_trait":
                node.declarations.forEach(traverseNode);
                break;
            case "def_field":
                if (node.init) {
                    traverseExpression(node.init);
                }
                break;
            case "def_constant":
                if (node.value) {
                    traverseExpression(node.value);
                }
                break;
            case "program_import":
                traverseExpression(node.path);
                break;
            case "statement_let":
            case "statement_assign":
            case "statement_augmentedassign":
            case "statement_return":
            case "statement_expression":
            case "statement_condition":
            case "statement_while":
            case "statement_until":
            case "statement_repeat":
            case "statement_try":
            case "statement_try_catch":
            case "statement_foreach":
                traverseStatement(node);
                break;
            case "op_binary":
            case "op_unary":
            case "op_field":
            case "op_call":
            case "op_static_call":
            case "op_new":
            case "init_of":
            case "conditional":
            case "string":
            case "number":
            case "boolean":
            case "id":
            case "null":
            case "lvalue_ref":
                traverseExpression(node);
                break;
            case "new_parameter":
                traverseExpression(node.exp);
                break;
            case "def_argument":
            case "type_ref_simple":
            case "type_ref_map":
            case "type_ref_bounced":
                // Do nothing
                break;
            default:
                throw new Error("Unsupported node");
        }
    }

    traverseNode(node);
}

/**
 * Recursively iterates over each expression in an ASTNode and applies a callback to each expression.
 * @param node The node to traverse.
 * @param acc The initial value of the accumulator.
 * @param callback The callback function to apply to each expression.
 * @returns The final value of the accumulator after processing all expressions.
 */
export function foldExpressions<T>(
    node: ASTNode,
    acc: T,
    callback: (acc: T, expr: ASTExpression) => T,
): T {
    function traverseExpression(acc: T, expr: ASTExpression): T {
        acc = callback(acc, expr);

        switch (expr.kind) {
            case "op_binary":
                acc = traverseExpression(acc, expr.left);
                acc = traverseExpression(acc, expr.right);
                break;
            case "op_unary":
                acc = traverseExpression(acc, expr.right);
                break;
            case "op_field":
                acc = traverseExpression(acc, expr.src);
                break;
            case "op_call":
                acc = traverseExpression(acc, expr.src);
                expr.args.forEach((arg) => {
                    acc = traverseExpression(acc, arg);
                });
                break;
            case "op_static_call":
                expr.args.forEach((arg) => {
                    acc = traverseExpression(acc, arg);
                });
                break;
            case "op_new":
                expr.args.forEach((param) => {
                    acc = traverseExpression(acc, param.exp);
                });
                break;
            case "init_of":
                expr.args.forEach((arg) => {
                    acc = traverseExpression(acc, arg);
                });
                break;
            case "conditional":
                acc = traverseExpression(acc, expr.condition);
                acc = traverseExpression(acc, expr.thenBranch);
                acc = traverseExpression(acc, expr.elseBranch);
                break;
            case "string":
            case "number":
            case "boolean":
            case "id":
            case "null":
            case "lvalue_ref":
                // Primitives and non-composite expressions don't require further traversal
                break;
            default:
                throw new Error("Unsupported expression");
        }
        return acc;
    }

    function traverseStatement(acc: T, stmt: ASTStatement): T {
        switch (stmt.kind) {
            case "statement_let":
            case "statement_assign":
            case "statement_augmentedassign":
            case "statement_expression":
                acc = traverseExpression(acc, stmt.expression);
                break;
            case "statement_return":
                if (stmt.expression)
                    acc = traverseExpression(acc, stmt.expression);
                break;
            case "statement_condition":
                acc = traverseExpression(acc, stmt.expression);
                stmt.trueStatements.forEach((st) => {
                    acc = traverseStatement(acc, st);
                });
                if (stmt.falseStatements)
                    stmt.falseStatements.forEach((st) => {
                        acc = traverseStatement(acc, st);
                    });
                if (stmt.elseif) acc = traverseStatement(acc, stmt.elseif);
                break;
            case "statement_while":
            case "statement_until":
                acc = traverseExpression(acc, stmt.condition);
                stmt.statements.forEach((st) => {
                    acc = traverseStatement(acc, st);
                });
                break;
            case "statement_repeat":
                acc = traverseExpression(acc, stmt.iterations);
                stmt.statements.forEach((st) => {
                    acc = traverseStatement(acc, st);
                });
                break;
            case "statement_try":
            case "statement_foreach":
                stmt.statements.forEach((st) => {
                    acc = traverseStatement(acc, st);
                });
                break;
            case "statement_try_catch":
                stmt.statements.forEach((st) => {
                    acc = traverseStatement(acc, st);
                });
                stmt.catchStatements.forEach((st) => {
                    acc = traverseStatement(acc, st);
                });
                break;
            default:
                throw new Error("Unsupported statement");
        }
        return acc;
    }

    function traverseNode(acc: T, node: ASTNode): T {
        switch (node.kind) {
            case "program":
                node.entries.forEach((entry) => {
                    acc = traverseNode(acc, entry);
                });
                break;
            case "def_native_function":
            case "def_struct":
            case "primitive":
                // These node types do not require further traversal of expressions or sub-nodes
                break;
            case "def_function":
            case "def_init_function":
            case "def_receive":
                if (node.statements) {
                    node.statements.forEach((stmt) => {
                        acc = traverseStatement(acc, stmt);
                    });
                }
                break;
            case "def_contract":
            case "def_trait":
                node.declarations.forEach((decl) => {
                    acc = traverseNode(acc, decl);
                });
                break;
            case "def_field":
                if (node.init) {
                    acc = traverseExpression(acc, node.init);
                }
                break;
            case "def_constant":
                if (node.value) {
                    acc = traverseExpression(acc, node.value);
                }
                break;
            case "program_import":
                acc = traverseExpression(acc, node.path);
                break;
            case "statement_let":
            case "statement_assign":
            case "statement_augmentedassign":
            case "statement_return":
            case "statement_expression":
            case "statement_condition":
            case "statement_while":
            case "statement_until":
            case "statement_repeat":
            case "statement_try":
            case "statement_try_catch":
            case "statement_foreach":
                acc = traverseStatement(acc, node);
                break;
            case "op_binary":
            case "op_unary":
            case "op_field":
            case "op_call":
            case "op_static_call":
            case "op_new":
            case "init_of":
            case "conditional":
            case "string":
            case "number":
            case "boolean":
            case "id":
            case "null":
            case "lvalue_ref":
                acc = traverseExpression(acc, node);
                break;
            case "new_parameter":
                acc = traverseExpression(acc, node.exp);
                break;
            case "def_argument":
            case "type_ref_simple":
            case "type_ref_map":
            case "type_ref_bounced":
                // Do nothing
                break;
            default:
                throw new Error("Unsupported node");
        }
        return acc;
    }

    return traverseNode(acc, node);
}

/**
 * Recursively iterates over each statement in an ASTNode and applies a callback to each statement.
 * @param node The node to traverse.
 * @param callback The callback function to apply to each statement.
 */
export function forEachStatement(
    node: ASTNode,
    callback: (stmt: ASTStatement) => void,
): void {
    function traverseStatement(stmt: ASTStatement): void {
        callback(stmt);

        switch (stmt.kind) {
            case "statement_let":
            case "statement_assign":
            case "statement_augmentedassign":
            case "statement_expression":
                break;
            case "statement_return":
                break;
            case "statement_condition":
                stmt.trueStatements.forEach(traverseStatement);
                if (stmt.falseStatements)
                    stmt.falseStatements.forEach(traverseStatement);
                if (stmt.elseif) traverseStatement(stmt.elseif);
                break;
            case "statement_while":
            case "statement_until":
            case "statement_repeat":
            case "statement_try":
            case "statement_foreach":
                stmt.statements.forEach(traverseStatement);
                break;
            case "statement_try_catch":
                stmt.statements.forEach(traverseStatement);
                stmt.catchStatements.forEach(traverseStatement);
                break;
            default:
                throw new Error("Unsupported statement");
        }
    }

    function traverseNode(node: ASTNode): void {
        switch (node.kind) {
            case "program":
                node.entries.forEach(traverseNode);
                break;
            case "def_function":
            case "def_init_function":
            case "def_receive":
                if (node.statements) node.statements.forEach(traverseStatement);
                break;
            case "def_contract":
            case "def_trait":
                node.declarations.forEach(traverseNode);
                break;
            case "statement_let":
            case "statement_assign":
            case "statement_augmentedassign":
            case "statement_return":
            case "statement_expression":
            case "statement_condition":
            case "statement_while":
            case "statement_until":
            case "statement_repeat":
            case "statement_try":
            case "statement_try_catch":
            case "statement_foreach":
                traverseStatement(node);
                break;
            case "op_binary":
            case "op_unary":
            case "op_field":
            case "op_call":
            case "op_static_call":
            case "op_new":
            case "init_of":
            case "conditional":
            case "string":
            case "number":
            case "boolean":
            case "id":
            case "null":
            case "lvalue_ref":
            case "new_parameter":
            case "def_argument":
            case "type_ref_simple":
            case "type_ref_map":
            case "type_ref_bounced":
            case "def_native_function":
            case "def_struct":
            case "def_constant":
            case "def_field":
            case "program_import":
            case "primitive":
                // Do nothing
                break;
            default:
                throw new Error("Unsupported node");
        }
    }

    traverseNode(node);
}

/**
 * Recursively iterates over each statement in an ASTNode and applies a callback to each statement.
 * @param node The node to traverse.
 * @param acc The initial value of the accumulator.
 * @param callback The callback function to apply to each statement, also passes the accumulator.
 * @returns The final value of the accumulator after processing all statements.
 */
export function foldStatements<T>(
    node: ASTNode,
    acc: T,
    callback: (acc: T, stmt: ASTStatement) => T,
): T {
    function traverseStatement(acc: T, stmt: ASTStatement): T {
        acc = callback(acc, stmt);

        switch (stmt.kind) {
            case "statement_let":
            case "statement_assign":
            case "statement_augmentedassign":
            case "statement_expression":
                break;
            case "statement_return":
                break;
            case "statement_condition":
                stmt.trueStatements.forEach(
                    (st) => (acc = traverseStatement(acc, st)),
                );
                if (stmt.falseStatements)
                    stmt.falseStatements.forEach(
                        (st) => (acc = traverseStatement(acc, st)),
                    );
                if (stmt.elseif) acc = traverseStatement(acc, stmt.elseif);
                break;
            case "statement_while":
            case "statement_until":
            case "statement_repeat":
            case "statement_try":
            case "statement_foreach":
                stmt.statements.forEach(
                    (st) => (acc = traverseStatement(acc, st)),
                );
                break;
            case "statement_try_catch":
                stmt.statements.forEach(
                    (st) => (acc = traverseStatement(acc, st)),
                );
                stmt.catchStatements.forEach(
                    (st) => (acc = traverseStatement(acc, st)),
                );
                break;
            default:
                throw new Error("Unsupported statement");
        }
        return acc;
    }

    function traverseNode(acc: T, node: ASTNode): T {
        switch (node.kind) {
            case "program":
                node.entries.forEach((entry) => {
                    acc = traverseNode(acc, entry);
                });
                break;
            case "def_function":
            case "def_init_function":
            case "def_receive":
                if (node.statements) {
                    node.statements.forEach((stmt) => {
                        acc = traverseStatement(acc, stmt);
                    });
                }
                break;
            case "def_contract":
            case "def_trait":
                node.declarations.forEach((decl) => {
                    acc = traverseNode(acc, decl);
                });
                break;
            case "statement_let":
            case "statement_assign":
            case "statement_augmentedassign":
            case "statement_return":
            case "statement_expression":
            case "statement_condition":
            case "statement_while":
            case "statement_until":
            case "statement_repeat":
            case "statement_try":
            case "statement_try_catch":
            case "statement_foreach":
                acc = traverseStatement(acc, node);
                break;
            case "op_binary":
            case "op_unary":
            case "op_field":
            case "op_call":
            case "op_static_call":
            case "op_new":
            case "init_of":
            case "conditional":
            case "string":
            case "number":
            case "boolean":
            case "id":
            case "null":
            case "lvalue_ref":
            case "new_parameter":
            case "def_argument":
            case "type_ref_simple":
            case "type_ref_map":
            case "type_ref_bounced":
            case "def_native_function":
            case "def_struct":
            case "def_constant":
            case "def_field":
            case "program_import":
            case "primitive":
                // Do nothing
                break;
            default:
                throw new Error("Unsupported node");
        }
        return acc;
    }

    return traverseNode(acc, node);
}
