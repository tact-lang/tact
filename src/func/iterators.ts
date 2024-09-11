import { FuncAstNode, FuncAstExpression } from "./grammar";
import { throwUnsupportedNodeError } from "./syntaxUtils";

/**
 * Recursively executes `callback` on each nested expression.
 *
 * NOTE: It doesn't traverse raw assembly (present as string literals) and
 * identifier expressions that represent names.
 */
export function forEachExpression(
    node: FuncAstNode,
    callback: (expr: FuncAstExpression) => void,
): void {
    switch (node.kind) {
        case "expression_assign":
            callback(node);
            forEachExpression(node.left, callback);
            forEachExpression(node.right, callback);
            break;
        case "expression_conditional":
            callback(node);
            forEachExpression(node.condition, callback);
            forEachExpression(node.consequence, callback);
            forEachExpression(node.alternative, callback);
            break;
        case "expression_compare":
            callback(node);
            forEachExpression(node.left, callback);
            forEachExpression(node.right, callback);
            break;
        case "expression_bitwise_shift":
        case "expression_add_bitwise":
        case "expression_mul_bitwise":
            callback(node);
            forEachExpression(node.left, callback);
            node.ops.forEach((part) => forEachExpression(part.expr, callback));
            break;
        case "expression_unary":
            callback(node);
            forEachExpression(node.operand, callback);
            break;
        case "expression_method":
            callback(node);
            forEachExpression(node.object, callback);
            node.calls.forEach((call) =>
                forEachExpression(call.argument, callback),
            );
            break;
        case "expression_var_decl":
            callback(node);
            if (
                node.names.kind === "expression_tensor_var_decl" ||
                node.names.kind === "expression_tuple_var_decl"
            ) {
                node.names.names.forEach((name) =>
                    forEachExpression(name, callback),
                );
            } else {
                forEachExpression(node.names, callback);
            }
            break;
        case "expression_fun_call":
            callback(node);
            forEachExpression(node.object, callback);
            forEachExpression(node.argument, callback);
            break;
        case "expression_tensor":
        case "expression_tuple":
            callback(node);
            node.expressions.forEach((expr) =>
                forEachExpression(expr, callback),
            );
            break;
        case "module":
            node.items.forEach((item) => forEachExpression(item, callback));
            break;
        case "pragma_literal":
        case "pragma_version_range":
        case "pragma_version_string":
        case "include":
            break;
        case "global_variables_declaration":
            // Do nothing; global variables don't contain initializers
            break;
        case "constants_definition":
            node.constants.forEach((c) => forEachExpression(c.value, callback));
            break;
        case "asm_function_definition":
            break;
        case "function_declaration":
        case "function_definition":
            forEachExpression(node.name, callback);
            node.attributes.forEach((attr) => {
                if (attr.kind === "method_id" && attr.value) {
                    forEachExpression(attr.value, callback);
                }
            });
            if (node.kind === "function_definition") {
                node.statements.forEach((stmt) =>
                    forEachExpression(stmt, callback),
                );
            }
            break;
        case "unit":
            break;
        case "statement_return":
            if (node.expression) forEachExpression(node.expression, callback);
            break;
        case "statement_block":
            node.statements.forEach((stmt) =>
                forEachExpression(stmt, callback),
            );
            break;
        case "statement_empty":
            break;
        case "statement_condition_if":
            forEachExpression(node.condition, callback);
            node.consequences.forEach((stmt) =>
                forEachExpression(stmt, callback),
            );
            if (node.alternatives) {
                node.alternatives.forEach((stmt) =>
                    forEachExpression(stmt, callback),
                );
            }
            break;
        case "statement_condition_elseif":
            forEachExpression(node.conditionIf, callback);
            node.consequencesIf.forEach((stmt) =>
                forEachExpression(stmt, callback),
            );
            forEachExpression(node.conditionElseif, callback);
            node.consequencesElseif.forEach((stmt) =>
                forEachExpression(stmt, callback),
            );
            if (node.alternativesElseif) {
                node.alternativesElseif.forEach((stmt) =>
                    forEachExpression(stmt, callback),
                );
            }
            break;
        case "statement_repeat":
            forEachExpression(node.iterations, callback);
            node.statements.forEach((stmt) =>
                forEachExpression(stmt, callback),
            );
            break;
        case "statement_until":
        case "statement_while":
            forEachExpression(node.condition, callback);
            node.statements.forEach((stmt) =>
                forEachExpression(stmt, callback),
            );
            break;
        case "statement_try_catch":
            node.statementsTry.forEach((stmt) =>
                forEachExpression(stmt, callback),
            );
            node.statementsCatch.forEach((stmt) =>
                forEachExpression(stmt, callback),
            );
            break;
        case "statement_expression":
            forEachExpression(node.expression, callback);
            break;
        // No nested nodes for these cases
        case "method_id":
        case "quoted_id":
        case "operator_id":
        case "plain_id":
        case "unused_id":
        case "integer_literal":
        case "string_singleline":
        case "string_multiline":
        case "cr":
        case "comment_singleline":
        case "comment_multiline":
            break;

        default:
            throwUnsupportedNodeError(node);
    }
}
