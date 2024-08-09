import { AstNode, cloneAstNode } from "./ast";
import { throwInternalCompilerError } from "../errors";

export function cloneNode<T extends AstNode>(src: T): T {
    if (src.kind === "boolean") {
        return cloneAstNode(src);
    } else if (src.kind === "id") {
        return cloneAstNode(src);
    } else if (src.kind === "null") {
        return cloneAstNode(src);
    } else if (src.kind === "number") {
        return cloneAstNode(src);
    } else if (src.kind === "string") {
        return cloneAstNode(src);
    } else if (src.kind === "statement_assign") {
        return cloneAstNode({
            ...src,
            path: cloneNode(src.path),
            expression: cloneNode(src.expression),
        });
    } else if (src.kind === "statement_augmentedassign") {
        return cloneAstNode({
            ...src,
            path: cloneNode(src.path),
            expression: cloneNode(src.expression),
        });
    } else if (src.kind === "statement_let") {
        return cloneAstNode({
            ...src,
            type: src.type ? cloneAstNode(src.type) : null,
            expression: cloneNode(src.expression),
        });
    } else if (src.kind === "statement_condition") {
        return cloneAstNode({
            ...src,
            condition: cloneNode(src.condition),
            trueStatements: src.trueStatements.map(cloneNode),
            falseStatements: src.falseStatements
                ? src.falseStatements.map(cloneNode)
                : null,
            elseif: src.elseif ? cloneNode(src.elseif) : null,
        });
    } else if (src.kind === "struct_field_initializer") {
        return cloneAstNode({
            ...src,
            initializer: cloneNode(src.initializer),
        });
    } else if (src.kind === "statement_expression") {
        return cloneAstNode({
            ...src,
            expression: cloneNode(src.expression),
        });
    } else if (src.kind === "op_binary") {
        return cloneAstNode({
            ...src,
            left: cloneNode(src.left),
            right: cloneNode(src.right),
        });
    } else if (src.kind === "op_unary") {
        return cloneAstNode({
            ...src,
            operand: cloneNode(src.operand),
        });
    } else if (src.kind === "struct_instance") {
        return cloneAstNode({
            ...src,
            args: src.args.map(cloneNode),
        });
    } else if (src.kind === "method_call") {
        return cloneAstNode({
            ...src,
            self: cloneNode(src.self),
            args: src.args.map(cloneNode),
        });
    } else if (src.kind === "field_access") {
        return cloneAstNode({
            ...src,
            aggregate: cloneNode(src.aggregate),
        });
    } else if (src.kind === "static_call") {
        return cloneAstNode({
            ...src,
            args: src.args.map(cloneNode),
        });
    } else if (src.kind === "conditional") {
        return cloneAstNode({
            ...src,
            condition: cloneNode(src.condition),
            thenBranch: cloneNode(src.thenBranch),
            elseBranch: cloneNode(src.elseBranch),
        });
    } else if (src.kind === "statement_return") {
        return cloneAstNode({
            ...src,
            expression: src.expression ? cloneNode(src.expression) : null,
        });
    } else if (src.kind === "statement_repeat") {
        return cloneAstNode({
            ...src,
            iterations: cloneNode(src.iterations),
            statements: src.statements.map(cloneNode),
        });
    } else if (src.kind === "statement_until") {
        return cloneAstNode({
            ...src,
            condition: cloneNode(src.condition),
            statements: src.statements.map(cloneNode),
        });
    } else if (src.kind === "statement_while") {
        return cloneAstNode({
            ...src,
            condition: cloneNode(src.condition),
            statements: src.statements.map(cloneNode),
        });
    } else if (src.kind === "statement_try") {
        return cloneAstNode({
            ...src,
            statements: src.statements.map(cloneNode),
        });
    } else if (src.kind === "statement_try_catch") {
        return cloneAstNode({
            ...src,
            statements: src.statements.map(cloneNode),
            catchStatements: src.catchStatements.map(cloneNode),
        });
    } else if (src.kind === "statement_foreach") {
        return cloneAstNode({
            ...src,
            statements: src.statements.map(cloneNode),
        });
    } else if (src.kind === "function_def") {
        return cloneAstNode({
            ...src,
            return: src.return ? cloneAstNode(src.return) : null,
            statements: src.statements.map(cloneNode),
            params: src.params.map(cloneNode),
        });
    } else if (src.kind === "function_decl") {
        return cloneAstNode({
            ...src,
            return: src.return ? cloneAstNode(src.return) : null,
            params: src.params.map(cloneNode),
        });
    } else if (src.kind === "native_function_decl") {
        return cloneAstNode({
            ...src,
            return: src.return ? cloneAstNode(src.return) : null,
            params: src.params.map(cloneNode),
        });
    } else if (src.kind === "receiver") {
        return cloneAstNode({
            ...src,
            statements: src.statements.map(cloneNode),
        });
    } else if (src.kind === "typed_parameter") {
        return cloneAstNode({
            ...src,
            type: cloneAstNode(src.type),
        });
    } else if (src.kind === "init_of") {
        return cloneAstNode({
            ...src,
            args: src.args.map(cloneNode),
        });
    } else if (src.kind === "constant_def") {
        return cloneAstNode({
            ...src,
            type: cloneAstNode(src.type),
            initializer: cloneNode(src.initializer),
        });
    } else if (src.kind === "constant_decl") {
        return cloneAstNode({
            ...src,
            type: cloneAstNode(src.type),
        });
    }

    throwInternalCompilerError(`Not implemented for ${src.kind}`);
}
