import { AstNode, FactoryAst } from "./ast";
import { throwInternalCompilerError } from "../errors";

export function cloneNode<T extends AstNode>(
    src: T,
    { cloneAstNode }: FactoryAst,
): T {
    const recurse = <T extends AstNode>(src: T): T => {
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
                path: recurse(src.path),
                expression: recurse(src.expression),
            });
        } else if (src.kind === "statement_augmentedassign") {
            return cloneAstNode({
                ...src,
                path: recurse(src.path),
                expression: recurse(src.expression),
            });
        } else if (src.kind === "statement_let") {
            return cloneAstNode({
                ...src,
                type: src.type ? cloneAstNode(src.type) : null,
                expression: recurse(src.expression),
            });
        } else if (src.kind === "statement_condition") {
            return cloneAstNode({
                ...src,
                condition: recurse(src.condition),
                trueStatements: src.trueStatements.map(recurse),
                falseStatements: src.falseStatements
                    ? src.falseStatements.map(recurse)
                    : null,
                elseif: src.elseif ? recurse(src.elseif) : null,
            });
        } else if (src.kind === "struct_field_initializer") {
            return cloneAstNode({
                ...src,
                initializer: recurse(src.initializer),
            });
        } else if (src.kind === "statement_expression") {
            return cloneAstNode({
                ...src,
                expression: recurse(src.expression),
            });
        } else if (src.kind === "op_binary") {
            return cloneAstNode({
                ...src,
                left: recurse(src.left),
                right: recurse(src.right),
            });
        } else if (src.kind === "op_unary") {
            return cloneAstNode({
                ...src,
                operand: recurse(src.operand),
            });
        } else if (src.kind === "struct_instance") {
            return cloneAstNode({
                ...src,
                args: src.args.map(recurse),
            });
        } else if (src.kind === "method_call") {
            return cloneAstNode({
                ...src,
                self: recurse(src.self),
                args: src.args.map(recurse),
            });
        } else if (src.kind === "field_access") {
            return cloneAstNode({
                ...src,
                aggregate: recurse(src.aggregate),
            });
        } else if (src.kind === "static_call") {
            return cloneAstNode({
                ...src,
                args: src.args.map(recurse),
            });
        } else if (src.kind === "conditional") {
            return cloneAstNode({
                ...src,
                condition: recurse(src.condition),
                thenBranch: recurse(src.thenBranch),
                elseBranch: recurse(src.elseBranch),
            });
        } else if (src.kind === "statement_return") {
            return cloneAstNode({
                ...src,
                expression: src.expression ? recurse(src.expression) : null,
            });
        } else if (src.kind === "statement_repeat") {
            return cloneAstNode({
                ...src,
                iterations: recurse(src.iterations),
                statements: src.statements.map(recurse),
            });
        } else if (src.kind === "statement_until") {
            return cloneAstNode({
                ...src,
                condition: recurse(src.condition),
                statements: src.statements.map(recurse),
            });
        } else if (src.kind === "statement_while") {
            return cloneAstNode({
                ...src,
                condition: recurse(src.condition),
                statements: src.statements.map(recurse),
            });
        } else if (src.kind === "statement_try") {
            return cloneAstNode({
                ...src,
                statements: src.statements.map(recurse),
            });
        } else if (src.kind === "statement_try_catch") {
            return cloneAstNode({
                ...src,
                statements: src.statements.map(recurse),
                catchStatements: src.catchStatements.map(recurse),
            });
        } else if (src.kind === "statement_foreach") {
            return cloneAstNode({
                ...src,
                map: recurse(src.map),
                statements: src.statements.map(recurse),
            });
        } else if (src.kind === "function_def") {
            return cloneAstNode({
                ...src,
                return: src.return ? cloneAstNode(src.return) : null,
                statements: src.statements.map(recurse),
                params: src.params.map(recurse),
            });
        } else if (src.kind === "function_decl") {
            return cloneAstNode({
                ...src,
                return: src.return ? cloneAstNode(src.return) : null,
                params: src.params.map(recurse),
            });
        } else if (src.kind === "native_function_decl") {
            return cloneAstNode({
                ...src,
                return: src.return ? cloneAstNode(src.return) : null,
                params: src.params.map(recurse),
            });
        } else if (src.kind === "receiver") {
            return cloneAstNode({
                ...src,
                statements: src.statements.map(recurse),
            });
        } else if (src.kind === "typed_parameter") {
            return cloneAstNode({
                ...src,
                type: cloneAstNode(src.type),
            });
        } else if (src.kind === "init_of") {
            return cloneAstNode({
                ...src,
                args: src.args.map(recurse),
            });
        } else if (src.kind === "constant_def") {
            return cloneAstNode({
                ...src,
                type: cloneAstNode(src.type),
                initializer: recurse(src.initializer),
            });
        } else if (src.kind === "constant_decl") {
            return cloneAstNode({
                ...src,
                type: cloneAstNode(src.type),
            });
        }

        throwInternalCompilerError(`Not implemented for ${src.kind}`);
    };

    return recurse(src);
}
