import { FuncAstNode, FuncAstExpr } from "./syntax";

import JSONbig from "json-bigint";

/**
 * Recursively executes `callback` on each nested expression.
 *
 * NOTE: It doesn't traverse raw assembly (present as string literals) and
 * identifier expressions that represent names.
 */
export function forEachExpression(
    node: FuncAstNode,
    callback: (expr: FuncAstExpr) => void,
): void {
    if ("kind" in node) {
        switch (node.kind) {
            // Expressions
            case "id_expr":
            case "number_expr":
            case "hex_number_expr":
            case "bool_expr":
            case "string_expr":
            case "nil_expr":
            case "unit_expr":
            case "primitive_type_expr":
                callback(node);
                break;
            case "call_expr":
                if (node.receiver) forEachExpression(node.receiver, callback);
                forEachExpression(node.fun, callback);
                node.args.forEach((arg) => forEachExpression(arg, callback));
                callback(node);
                break;
            case "assign_expr":
            case "augmented_assign_expr":
                forEachExpression(node.lhs, callback);
                forEachExpression(node.rhs, callback);
                callback(node);
                break;
            case "ternary_expr":
                forEachExpression(node.cond, callback);
                forEachExpression(node.trueExpr, callback);
                forEachExpression(node.falseExpr, callback);
                callback(node);
                break;
            case "binary_expr":
                forEachExpression(node.lhs, callback);
                forEachExpression(node.rhs, callback);
                callback(node);
                break;
            case "unary_expr":
                forEachExpression(node.value, callback);
                callback(node);
                break;
            case "apply_expr":
                forEachExpression(node.lhs, callback);
                forEachExpression(node.rhs, callback);
                callback(node);
                break;
            case "tuple_expr":
            case "tensor_expr":
                node.values.forEach((value) =>
                    forEachExpression(value, callback),
                );
                callback(node);
                break;
            case "hole_expr":
                forEachExpression(node.init, callback);
                callback(node);
                break;

            // Statements
            case "var_def_stmt":
                if (node.init) forEachExpression(node.init, callback);
                break;
            case "return_stmt":
                if (node.value) forEachExpression(node.value, callback);
                break;
            case "block_stmt":
                node.body.forEach((stmt) => forEachExpression(stmt, callback));
                break;
            case "repeat_stmt":
                forEachExpression(node.condition, callback);
                node.body.forEach((stmt) => forEachExpression(stmt, callback));
                break;
            case "condition_stmt":
                if (node.condition) forEachExpression(node.condition, callback);
                node.body.forEach((stmt) => forEachExpression(stmt, callback));
                if (node.else) forEachExpression(node.else, callback);
                break;
            case "do_until_stmt":
                node.body.forEach((stmt) => forEachExpression(stmt, callback));
                forEachExpression(node.condition, callback);
                break;
            case "while_stmt":
                forEachExpression(node.condition, callback);
                node.body.forEach((stmt) => forEachExpression(stmt, callback));
                break;
            case "expr_stmt":
                forEachExpression(node.expr, callback);
                break;
            case "try_catch_stmt":
                node.tryBlock.forEach((stmt) =>
                    forEachExpression(stmt, callback),
                );
                node.catchBlock.forEach((stmt) =>
                    forEachExpression(stmt, callback),
                );
                break;

            // Other and top-level elements
            case "constant":
                forEachExpression(node.init, callback);
                break;
            case "function_definition":
                node.body.forEach((stmt) => forEachExpression(stmt, callback));
                break;
            case "asm_function_definition":
                // Do nothing; we don't iterate raw asm
                break;
            case "comment":
            case "cr":
            case "include":
            case "pragma":
            case "global_variable":
            case "function_declaration":
                // These nodes don't contain expressions, so we don't need to do anything
                break;
            case "module":
                node.entries.forEach((entry) =>
                    forEachExpression(entry, callback),
                );
                break;

            // FuncType cases
            case "int":
            case "cell":
            case "slice":
            case "builder":
            case "cont":
            case "tuple":
            case "tensor":
            case "hole":
            case "type":
                break;

            default:
                throw new Error(`Unsupported node: ${JSONbig.stringify(node)}`);
        }
    }
}
