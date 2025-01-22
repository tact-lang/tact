import { AstNode } from "./ast";

/**
 * Recursively iterates over each node in an AstNode and applies a callback to each AST element.
 * If callback returns false, traversal of current node's children is skipped.
 * Returns false if traversal was interrupted by callback returning false.
 * @public
 * @param node The node to traverse.
 * @param callback The callback function to apply to each AST element. Returns boolean indicating whether to continue traversal.
 * @returns boolean indicating whether traversal should continue
 */
export function traverse(
    node: AstNode,
    callback: (node: AstNode) => boolean,
): boolean {
    if (!callback(node)) {
        return false;
    }

    switch (node.kind) {
        case "module":
            for (const imp of node.imports) {
                if (!traverse(imp, callback)) return true;
            }
            for (const item of node.items) {
                if (!traverse(item, callback)) return true;
            }
            break;
        case "import":
            if (!traverse(node.path, callback)) return true;
            break;
        case "primitive_type_decl":
            if (!traverse(node.name, callback)) return true;
            break;
        case "function_def":
            for (const attr of node.attributes) {
                if (!traverse(attr, callback)) return true;
            }
            if (!traverse(node.name, callback)) return true;
            if (node.return && !traverse(node.return, callback)) return true;
            for (const param of node.params) {
                if (!traverse(param, callback)) return true;
            }
            for (const stmt of node.statements) {
                if (!traverse(stmt, callback)) return true;
            }
            break;
        case "asm_function_def":
            for (const arg of node.shuffle.args) {
                if (!traverse(arg, callback)) return true;
            }
            for (const ret of node.shuffle.ret) {
                if (!traverse(ret, callback)) return true;
            }
            if (!traverse(node.name, callback)) return true;
            if (node.return && !traverse(node.return, callback)) return true;
            for (const param of node.params) {
                if (!traverse(param, callback)) return true;
            }
            break;
        case "function_decl":
            for (const attr of node.attributes) {
                if (!traverse(attr, callback)) return true;
            }
            if (!traverse(node.name, callback)) return true;
            if (node.return && !traverse(node.return, callback)) return true;
            for (const param of node.params) {
                if (!traverse(param, callback)) return true;
            }
            break;
        case "native_function_decl":
            if (!traverse(node.name, callback)) return true;
            if (!traverse(node.nativeName, callback)) return true;
            for (const param of node.params) {
                if (!traverse(param, callback)) return true;
            }
            if (node.return && !traverse(node.return, callback)) return true;
            break;
        case "function_attribute":
            switch (node.type) {
                case "get":
                    {
                        if (
                            node.methodId &&
                            !traverse(node.methodId, callback)
                        ) {
                            return true;
                        }
                    }
                    break;
                case "mutates":
                case "extends":
                case "virtual":
                case "abstract":
                case "override":
                case "inline":
                    break;
            }
            break;
        case "constant_def":
            if (!traverse(node.name, callback)) return true;
            if (!traverse(node.type, callback)) return true;
            if (!traverse(node.initializer, callback)) return true;
            break;
        case "constant_decl":
            if (!traverse(node.name, callback)) return true;
            if (!traverse(node.type, callback)) return true;
            break;
        case "struct_decl":
        case "message_decl":
            if (!traverse(node.name, callback)) return true;
            if (
                node.kind === "message_decl" &&
                node.opcode !== null &&
                !traverse(node.opcode, callback)
            ) {
                return true;
            }
            for (const field of node.fields) {
                if (!traverse(field, callback)) return true;
            }
            break;
        case "contract":
        case "trait":
            if (!traverse(node.name, callback)) return true;
            for (const trait of node.traits) {
                if (!traverse(trait, callback)) return true;
            }
            for (const declaration of node.declarations) {
                if (!traverse(declaration, callback)) return true;
            }
            break;
        case "field_decl":
            if (!traverse(node.name, callback)) return true;
            if (!traverse(node.type, callback)) return true;
            if (node.initializer && !traverse(node.initializer, callback)) {
                return true;
            }
            if (node.as && !traverse(node.as, callback)) return true;
            break;
        case "receiver":
            for (const stmt of node.statements) {
                if (!traverse(stmt, callback)) return true;
            }
            break;
        case "contract_init":
            for (const param of node.params) {
                if (!traverse(param, callback)) return true;
            }
            for (const stmt of node.statements) {
                if (!traverse(stmt, callback)) return true;
            }
            break;
        case "statement_let":
            if (!traverse(node.name, callback)) return true;
            if (node.type && !traverse(node.type, callback)) return true;
            if (!traverse(node.expression, callback)) return true;
            break;
        case "statement_destruct":
            for (const [_, [field, name]] of node.identifiers) {
                if (!traverse(field, callback)) return true;
                if (!traverse(name, callback)) return true;
            }
            if (!traverse(node.expression, callback)) return true;
            break;
        case "destruct_end":
            break;
        case "statement_return":
            if (node.expression && !traverse(node.expression, callback)) {
                return true;
            }
            break;
        case "statement_expression":
            if (!traverse(node.expression, callback)) return true;
            break;
        case "statement_assign":
            if (!traverse(node.path, callback)) return true;
            if (!traverse(node.expression, callback)) return true;
            break;
        case "statement_augmentedassign":
            if (!traverse(node.path, callback)) return true;
            if (!traverse(node.expression, callback)) return true;
            break;
        case "statement_condition":
            if (!traverse(node.condition, callback)) return true;
            for (const stmt of node.trueStatements) {
                if (!traverse(stmt, callback)) return true;
            }
            if (
                node.falseStatements?.some((stmt) => !traverse(stmt, callback))
            ) {
                return true;
            }
            if (node.elseif && !traverse(node.elseif, callback)) return true;
            break;
        case "statement_while":
        case "statement_until":
            if (!traverse(node.condition, callback)) return true;
            for (const stmt of node.statements) {
                if (!traverse(stmt, callback)) return true;
            }
            break;
        case "statement_repeat":
            if (!traverse(node.iterations, callback)) return true;
            for (const stmt of node.statements) {
                if (!traverse(stmt, callback)) return true;
            }
            break;
        case "statement_try":
            for (const stmt of node.statements) {
                if (!traverse(stmt, callback)) return true;
            }
            if (node.catchBlock !== undefined) {
                if (!traverse(node.catchBlock.catchName, callback)) {
                    return true;
                }
                for (const stmt of node.catchBlock.catchStatements) {
                    if (!traverse(stmt, callback)) return true;
                }
            }
            break;
        case "statement_foreach":
            if (!traverse(node.keyName, callback)) return true;
            if (!traverse(node.valueName, callback)) return true;
            if (!traverse(node.map, callback)) return true;
            for (const stmt of node.statements) {
                if (!traverse(stmt, callback)) return true;
            }
            break;
        case "statement_block":
            for (const stmt of node.statements) {
                if (!traverse(stmt, callback)) return true;
            }
            break;
        case "destruct_mapping":
            if (!traverse(node.field, callback)) return true;
            if (!traverse(node.name, callback)) return true;
            break;
        case "type_id":
            break;
        case "optional_type":
            if (!traverse(node.typeArg, callback)) return true;
            break;
        case "map_type":
            if (!traverse(node.keyType, callback)) return true;
            if (
                node.keyStorageType &&
                !traverse(node.keyStorageType, callback)
            ) {
                return true;
            }
            if (!traverse(node.valueType, callback)) return true;
            if (
                node.valueStorageType &&
                !traverse(node.valueStorageType, callback)
            ) {
                return true;
            }
            break;
        case "bounced_message_type":
            if (!traverse(node.messageType, callback)) return true;
            break;
        case "op_binary":
            if (!traverse(node.left, callback)) return true;
            if (!traverse(node.right, callback)) return true;
            break;
        case "op_unary":
            if (!traverse(node.operand, callback)) return true;
            break;
        case "field_access":
            if (!traverse(node.aggregate, callback)) return true;
            if (!traverse(node.field, callback)) return true;
            break;
        case "method_call":
            if (!traverse(node.self, callback)) return true;
            if (!traverse(node.method, callback)) return true;
            for (const arg of node.args) {
                if (!traverse(arg, callback)) return true;
            }
            break;
        case "static_call":
            if (!traverse(node.function, callback)) return true;
            for (const arg of node.args) {
                if (!traverse(arg, callback)) return true;
            }
            break;
        case "struct_instance":
            if (!traverse(node.type, callback)) return true;
            for (const arg of node.args) {
                if (!traverse(arg, callback)) return true;
            }
            break;
        case "struct_value":
            if (!traverse(node.type, callback)) return true;
            for (const arg of node.args) {
                if (!traverse(arg, callback)) return true;
            }
            break;
        case "struct_field_initializer":
            if (!traverse(node.field, callback)) return true;
            if (!traverse(node.initializer, callback)) return true;
            break;
        case "struct_field_value":
            if (!traverse(node.field, callback)) return true;
            if (!traverse(node.initializer, callback)) return true;
            break;
        case "init_of":
            if (!traverse(node.contract, callback)) return true;
            for (const arg of node.args) {
                if (!traverse(arg, callback)) return true;
            }
            break;
        case "conditional":
            if (!traverse(node.condition, callback)) return true;
            if (!traverse(node.thenBranch, callback)) return true;
            if (!traverse(node.elseBranch, callback)) return true;
            break;
        case "id":
        case "func_id":
        case "number":
        case "boolean":
        case "string":
        case "null":
        case "simplified_string":
        case "comment_value":
        case "address":
        case "cell":
        case "slice":
            break;
        case "typed_parameter":
            if (!traverse(node.name, callback)) return true;
            if (!traverse(node.type, callback)) return true;
            break;
    }
    return true;
}
