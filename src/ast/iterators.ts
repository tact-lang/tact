import { AstNode } from "./ast";

/**
 * Recursively iterates over each node in an AstNode and applies a callback to each AST element.
 * @public
 * @param node The node to traverse.
 * @param callback The callback function to apply to each AST element.
 */
export function traverse(node: AstNode, callback: (node: AstNode) => void) {
    traverseAndCheck(node, (n) => {
        callback(n);
        return true;
    });
}

/**
 * Recursively iterates over each node in an AstNode and applies a callback to each AST element.
 * @public
 * @param node The node to traverse.
 * @param callback The callback function to apply to each AST element, if returns false, does not traverse child nodes
 */
export function traverseAndCheck(
    node: AstNode,
    callback: (node: AstNode) => boolean,
) {
    if (!callback(node)) {
        return;
    }

    switch (node.kind) {
        case "module":
            node.imports.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            node.items.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "import":
            traverseAndCheck(node.path, callback);
            break;
        case "primitive_type_decl":
            traverseAndCheck(node.name, callback);
            break;
        case "function_def":
            node.attributes.forEach((attr) => {
                traverseAndCheck(attr, callback);
            });
            traverseAndCheck(node.name, callback);
            if (node.return) traverseAndCheck(node.return, callback);
            node.params.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            node.statements.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "asm_function_def":
            node.shuffle.args.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            node.shuffle.ret.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            traverseAndCheck(node.name, callback);
            if (node.return) traverseAndCheck(node.return, callback);
            node.params.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "function_decl":
            node.attributes.forEach((attr) => {
                traverseAndCheck(attr, callback);
            });
            traverseAndCheck(node.name, callback);
            if (node.return) traverseAndCheck(node.return, callback);
            node.params.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "native_function_decl":
            traverseAndCheck(node.name, callback);
            traverseAndCheck(node.nativeName, callback);
            node.params.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            if (node.return) traverseAndCheck(node.return, callback);
            break;
        case "function_attribute":
            switch (node.type) {
                case "get":
                    {
                        if (node.methodId)
                            traverseAndCheck(node.methodId, callback);
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
            traverseAndCheck(node.name, callback);
            traverseAndCheck(node.type, callback);
            traverseAndCheck(node.initializer, callback);
            break;
        case "constant_decl":
            traverseAndCheck(node.name, callback);
            traverseAndCheck(node.type, callback);
            break;
        case "struct_decl":
        case "message_decl":
            traverseAndCheck(node.name, callback);
            if (node.kind === "message_decl" && node.opcode !== null) {
                traverseAndCheck(node.opcode, callback);
            }
            node.fields.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "contract":
        case "trait":
            traverseAndCheck(node.name, callback);
            node.traits.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            node.declarations.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "field_decl":
            traverseAndCheck(node.name, callback);
            traverseAndCheck(node.type, callback);
            if (node.initializer) traverseAndCheck(node.initializer, callback);
            if (node.as) traverseAndCheck(node.as, callback);
            break;
        case "receiver":
            node.statements.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "bounce":
            traverseAndCheck(node.param, callback);
            break;
        case "internal":
        case "external":
            traverseAndCheck(node.subKind, callback);
            break;
        case "fallback":
            break;
        case "comment":
            traverseAndCheck(node.comment, callback);
            break;
        case "simple":
            traverseAndCheck(node.param, callback);
            break;
        case "contract_init":
            node.params.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            node.statements.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "statement_let":
            traverseAndCheck(node.name, callback);
            if (node.type) traverseAndCheck(node.type, callback);
            traverseAndCheck(node.expression, callback);
            break;
        case "statement_destruct":
            node.identifiers.forEach(([field, name], _) => {
                traverseAndCheck(field, callback);
                traverseAndCheck(name, callback);
            });
            traverseAndCheck(node.expression, callback);
            break;
        case "destruct_end":
            break;
        case "statement_return":
            if (node.expression) traverseAndCheck(node.expression, callback);
            break;
        case "statement_expression":
            traverseAndCheck(node.expression, callback);
            break;
        case "statement_assign":
            traverseAndCheck(node.path, callback);
            traverseAndCheck(node.expression, callback);
            break;
        case "statement_augmentedassign":
            traverseAndCheck(node.path, callback);
            traverseAndCheck(node.expression, callback);
            break;
        case "statement_condition":
            traverseAndCheck(node.condition, callback);
            node.trueStatements.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            if (node.falseStatements) {
                node.falseStatements.forEach((e) => {
                    traverseAndCheck(e, callback);
                });
            }
            if (node.elseif) traverseAndCheck(node.elseif, callback);
            break;
        case "statement_while":
        case "statement_until":
            traverseAndCheck(node.condition, callback);
            node.statements.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "statement_repeat":
            traverseAndCheck(node.iterations, callback);
            node.statements.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "statement_try":
            node.statements.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            if (node.catchBlock !== undefined) {
                traverseAndCheck(node.catchBlock.catchName, callback);
                node.catchBlock.catchStatements.forEach((e) => {
                    traverseAndCheck(e, callback);
                });
            }
            break;
        case "statement_foreach":
            traverseAndCheck(node.keyName, callback);
            traverseAndCheck(node.valueName, callback);
            traverseAndCheck(node.map, callback);
            node.statements.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "statement_block":
            node.statements.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "destruct_mapping":
            traverseAndCheck(node.field, callback);
            traverseAndCheck(node.name, callback);
            break;
        case "type_id":
            break;
        case "optional_type":
            traverseAndCheck(node.typeArg, callback);
            break;
        case "map_type":
            traverseAndCheck(node.keyType, callback);
            if (node.keyStorageType)
                traverseAndCheck(node.keyStorageType, callback);
            traverseAndCheck(node.valueType, callback);
            if (node.valueStorageType)
                traverseAndCheck(node.valueStorageType, callback);
            break;
        case "bounced_message_type":
            traverseAndCheck(node.messageType, callback);
            break;
        case "op_binary":
            traverseAndCheck(node.left, callback);
            traverseAndCheck(node.right, callback);
            break;
        case "op_unary":
            traverseAndCheck(node.operand, callback);
            break;
        case "field_access":
            traverseAndCheck(node.aggregate, callback);
            traverseAndCheck(node.field, callback);
            break;
        case "method_call":
            traverseAndCheck(node.self, callback);
            traverseAndCheck(node.method, callback);
            node.args.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "static_call":
            traverseAndCheck(node.function, callback);
            node.args.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "struct_instance":
            traverseAndCheck(node.type, callback);
            node.args.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "struct_value":
            traverseAndCheck(node.type, callback);
            node.args.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "struct_field_initializer":
            traverseAndCheck(node.field, callback);
            traverseAndCheck(node.initializer, callback);
            break;
        case "struct_field_value":
            traverseAndCheck(node.field, callback);
            traverseAndCheck(node.initializer, callback);
            break;
        case "init_of":
            traverseAndCheck(node.contract, callback);
            node.args.forEach((e) => {
                traverseAndCheck(e, callback);
            });
            break;
        case "conditional":
            traverseAndCheck(node.condition, callback);
            traverseAndCheck(node.thenBranch, callback);
            traverseAndCheck(node.elseBranch, callback);
            break;
        case "id":
        case "func_id":
        case "number":
        case "boolean":
        case "string":
        case "null":
        case "simplified_string":
        case "address":
        case "cell":
        case "slice":
            break;
        case "typed_parameter":
            traverseAndCheck(node.name, callback);
            traverseAndCheck(node.type, callback);
            break;
    }
}
