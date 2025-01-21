import { AstNode, FactoryAst } from "./ast";
import { throwInternalCompilerError } from "../error/errors";

export function cloneNode<T extends AstNode>(
    src: T,
    { cloneNode }: FactoryAst,
): T {
    const recurse = <T extends AstNode>(src: T): T => {
        if (src.kind === "boolean") {
            return cloneNode(src);
        } else if (src.kind === "id") {
            return cloneNode(src);
        } else if (src.kind === "null") {
            return cloneNode(src);
        } else if (src.kind === "number") {
            return cloneNode(src);
        } else if (src.kind === "string") {
            return cloneNode(src);
        } else if (src.kind === "statement_assign") {
            return cloneNode({
                ...src,
                path: recurse(src.path),
                expression: recurse(src.expression),
            });
        } else if (src.kind === "statement_augmentedassign") {
            return cloneNode({
                ...src,
                path: recurse(src.path),
                expression: recurse(src.expression),
            });
        } else if (src.kind === "statement_let") {
            return cloneNode({
                ...src,
                type: src.type ? cloneNode(src.type) : null,
                expression: recurse(src.expression),
            });
        } else if (src.kind === "statement_condition") {
            return cloneNode({
                ...src,
                condition: recurse(src.condition),
                trueStatements: src.trueStatements.map(recurse),
                falseStatements: src.falseStatements
                    ? src.falseStatements.map(recurse)
                    : null,
                elseif: src.elseif ? recurse(src.elseif) : null,
            });
        } else if (src.kind === "statement_block") {
            return cloneNode({
                ...src,
                statements: src.statements.map(recurse),
            });
        } else if (src.kind === "struct_field_initializer") {
            return cloneNode({
                ...src,
                initializer: recurse(src.initializer),
            });
        } else if (src.kind === "statement_expression") {
            return cloneNode({
                ...src,
                expression: recurse(src.expression),
            });
        } else if (src.kind === "op_binary") {
            return cloneNode({
                ...src,
                left: recurse(src.left),
                right: recurse(src.right),
            });
        } else if (src.kind === "op_unary") {
            return cloneNode({
                ...src,
                operand: recurse(src.operand),
            });
        } else if (src.kind === "struct_instance") {
            return cloneNode({
                ...src,
                args: src.args.map(recurse),
            });
        } else if (src.kind === "method_call") {
            return cloneNode({
                ...src,
                self: recurse(src.self),
                args: src.args.map(recurse),
            });
        } else if (src.kind === "field_access") {
            return cloneNode({
                ...src,
                aggregate: recurse(src.aggregate),
            });
        } else if (src.kind === "static_call") {
            return cloneNode({
                ...src,
                args: src.args.map(recurse),
            });
        } else if (src.kind === "conditional") {
            return cloneNode({
                ...src,
                condition: recurse(src.condition),
                thenBranch: recurse(src.thenBranch),
                elseBranch: recurse(src.elseBranch),
            });
        } else if (src.kind === "statement_return") {
            return cloneNode({
                ...src,
                expression: src.expression ? recurse(src.expression) : null,
            });
        } else if (src.kind === "statement_repeat") {
            return cloneNode({
                ...src,
                iterations: recurse(src.iterations),
                statements: src.statements.map(recurse),
            });
        } else if (src.kind === "statement_until") {
            return cloneNode({
                ...src,
                condition: recurse(src.condition),
                statements: src.statements.map(recurse),
            });
        } else if (src.kind === "statement_while") {
            return cloneNode({
                ...src,
                condition: recurse(src.condition),
                statements: src.statements.map(recurse),
            });
        } else if (src.kind === "statement_try") {
            return cloneNode({
                ...src,
                statements: src.statements.map(recurse),
                catchBlock: src.catchBlock
                    ? {
                          catchName: src.catchBlock.catchName,
                          catchStatements:
                              src.catchBlock.catchStatements.map(recurse),
                      }
                    : undefined,
            });
        } else if (src.kind === "statement_foreach") {
            return cloneNode({
                ...src,
                map: recurse(src.map),
                statements: src.statements.map(recurse),
            });
        } else if (src.kind === "function_def") {
            return cloneNode({
                ...src,
                return: src.return ? cloneNode(src.return) : null,
                statements: src.statements.map(recurse),
                params: src.params.map(recurse),
            });
        } else if (src.kind === "function_decl") {
            return cloneNode({
                ...src,
                return: src.return ? cloneNode(src.return) : null,
                params: src.params.map(recurse),
            });
        } else if (src.kind === "native_function_decl") {
            return cloneNode({
                ...src,
                return: src.return ? cloneNode(src.return) : null,
                params: src.params.map(recurse),
            });
        } else if (src.kind === "receiver") {
            return cloneNode({
                ...src,
                statements: src.statements.map(recurse),
            });
        } else if (src.kind === "typed_parameter") {
            return cloneNode({
                ...src,
                type: cloneNode(src.type),
            });
        } else if (src.kind === "init_of") {
            return cloneNode({
                ...src,
                args: src.args.map(recurse),
            });
        } else if (src.kind === "constant_def") {
            return cloneNode({
                ...src,
                type: cloneNode(src.type),
                initializer: recurse(src.initializer),
            });
        } else if (src.kind === "constant_decl") {
            return cloneNode({
                ...src,
                type: cloneNode(src.type),
            });
        }

        throwInternalCompilerError(`Not implemented for ${src.kind}`);
    };

    return recurse(src);
}
