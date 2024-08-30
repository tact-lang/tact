import { AstNode } from "./ast";

/**
 * Recursively iterates over each node in an AstNode and applies a callback to each AST element.
 * @public
 * @param node The node to traverse.
 * @param callback The callback function to apply to each AST element.
 */
export function traverse(node: AstNode, callback: (node: AstNode) => void) {
    callback(node);

    switch (node.kind) {
        case "module":
            node.imports.forEach((e) => {
                traverse(e, callback);
            });
            node.items.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "import":
            traverse(node.path, callback);
            break;
        case "primitive_type_decl":
            traverse(node.name, callback);
            break;
        case "function_def":
            traverse(node.name, callback);
            if (node.return) traverse(node.return, callback);
            node.params.forEach((e) => {
                traverse(e, callback);
            });
            node.statements.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "asm_function_def":
            node.shuffle.args.forEach((e) => {
                traverse(e, callback);
            });
            node.shuffle.ret.forEach((e) => {
                traverse(e, callback);
            });
            traverse(node.name, callback);
            if (node.return) traverse(node.return, callback);
            node.params.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "function_decl":
            traverse(node.name, callback);
            if (node.return) traverse(node.return, callback);
            node.params.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "native_function_decl":
            traverse(node.name, callback);
            traverse(node.nativeName, callback);
            node.params.forEach((e) => {
                traverse(e, callback);
            });
            if (node.return) traverse(node.return, callback);
            break;
        case "constant_def":
            traverse(node.name, callback);
            traverse(node.type, callback);
            traverse(node.initializer, callback);
            break;
        case "constant_decl":
            traverse(node.name, callback);
            traverse(node.type, callback);
            break;
        case "struct_decl":
        case "message_decl":
            traverse(node.name, callback);
            node.fields.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "contract":
        case "trait":
            traverse(node.name, callback);
            node.traits.forEach((e) => {
                traverse(e, callback);
            });
            node.declarations.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "field_decl":
            traverse(node.name, callback);
            traverse(node.type, callback);
            if (node.initializer) traverse(node.initializer, callback);
            if (node.as) traverse(node.as, callback);
            break;
        case "receiver":
            node.statements.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "contract_init":
            node.params.forEach((e) => {
                traverse(e, callback);
            });
            node.statements.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "statement_let":
            traverse(node.name, callback);
            if (node.type) traverse(node.type, callback);
            traverse(node.expression, callback);
            break;
        case "statement_return":
            if (node.expression) traverse(node.expression, callback);
            break;
        case "statement_expression":
            traverse(node.expression, callback);
            break;
        case "statement_assign":
            traverse(node.path, callback);
            traverse(node.expression, callback);
            break;
        case "statement_augmentedassign":
            traverse(node.path, callback);
            traverse(node.expression, callback);
            break;
        case "statement_condition":
            traverse(node.condition, callback);
            node.trueStatements.forEach((e) => {
                traverse(e, callback);
            });
            if (node.falseStatements) {
                node.falseStatements.forEach((e) => {
                    traverse(e, callback);
                });
            }
            if (node.elseif) traverse(node.elseif, callback);
            break;
        case "statement_while":
        case "statement_until":
            traverse(node.condition, callback);
            node.statements.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "statement_repeat":
            traverse(node.iterations, callback);
            node.statements.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "statement_try":
            node.statements.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "statement_try_catch":
            node.statements.forEach((e) => {
                traverse(e, callback);
            });
            traverse(node.catchName, callback);
            node.catchStatements.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "statement_foreach":
            traverse(node.keyName, callback);
            traverse(node.valueName, callback);
            traverse(node.map, callback);
            node.statements.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "type_id":
            break;
        case "optional_type":
            traverse(node.typeArg, callback);
            break;
        case "map_type":
            traverse(node.keyType, callback);
            if (node.keyStorageType) traverse(node.keyStorageType, callback);
            traverse(node.valueType, callback);
            if (node.valueStorageType)
                traverse(node.valueStorageType, callback);
            break;
        case "bounced_message_type":
            traverse(node.messageType, callback);
            break;
        case "op_binary":
            traverse(node.left, callback);
            traverse(node.right, callback);
            break;
        case "op_unary":
            traverse(node.operand, callback);
            break;
        case "field_access":
            traverse(node.aggregate, callback);
            traverse(node.field, callback);
            break;
        case "method_call":
            traverse(node.self, callback);
            traverse(node.method, callback);
            node.args.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "static_call":
            traverse(node.function, callback);
            node.args.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "struct_instance":
            traverse(node.type, callback);
            node.args.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "struct_field_initializer":
            traverse(node.field, callback);
            traverse(node.initializer, callback);
            break;
        case "init_of":
            traverse(node.contract, callback);
            node.args.forEach((e) => {
                traverse(e, callback);
            });
            break;
        case "conditional":
            traverse(node.condition, callback);
            traverse(node.thenBranch, callback);
            traverse(node.elseBranch, callback);
            break;
        case "id":
        case "func_id":
        case "number":
        case "boolean":
        case "string":
        case "null":
            break;
        case "typed_parameter":
            traverse(node.name, callback);
            traverse(node.type, callback);
            break;
    }
}
