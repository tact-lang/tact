import { ASTNode, cloneASTNode } from "./ast";

export function cloneNode<T extends ASTNode>(src: T): T {
    if (src.kind === "boolean") {
        return cloneASTNode(src);
    } else if (src.kind === "id") {
        return cloneASTNode(src);
    } else if (src.kind === "null") {
        return cloneASTNode(src);
    } else if (src.kind === "number") {
        return cloneASTNode(src);
    } else if (src.kind === "string") {
        return cloneASTNode(src);
    } else if (src.kind === "lvalue_ref") {
        return cloneASTNode(src);
    } else if (src.kind === "statement_assign") {
        return cloneASTNode({
            ...src,
            path: src.path.map(cloneNode),
            expression: cloneNode(src.expression),
        });
    } else if (src.kind === "statement_augmentedassign") {
        return cloneASTNode({
            ...src,
            path: src.path.map(cloneNode),
            expression: cloneNode(src.expression),
        });
    } else if (src.kind === "statement_let") {
        return cloneASTNode({
            ...src,
            type: src.type ? cloneASTNode(src.type) : null,
            expression: cloneNode(src.expression),
        });
    } else if (src.kind === "statement_condition") {
        return cloneASTNode({
            ...src,
            expression: cloneNode(src.expression),
            trueStatements: src.trueStatements.map(cloneNode),
            falseStatements: src.falseStatements
                ? src.falseStatements.map(cloneNode)
                : null,
            elseif: src.elseif ? cloneNode(src.elseif) : null,
        });
    } else if (src.kind === "new_parameter") {
        return cloneASTNode({
            ...src,
            exp: cloneNode(src.exp),
        });
    } else if (src.kind === "statement_expression") {
        return cloneASTNode({
            ...src,
            expression: cloneNode(src.expression),
        });
    } else if (src.kind === "op_binary") {
        return cloneASTNode({
            ...src,
            left: cloneNode(src.left),
            right: cloneNode(src.right),
        });
    } else if (src.kind === "op_unary") {
        return cloneASTNode({
            ...src,
            right: cloneNode(src.right),
        });
    } else if (src.kind === "op_new") {
        return cloneASTNode({
            ...src,
            args: src.args.map(cloneNode),
        });
    } else if (src.kind === "op_call") {
        return cloneASTNode({
            ...src,
            src: cloneNode(src.src),
            args: src.args.map(cloneNode),
        });
    } else if (src.kind === "op_field") {
        return cloneASTNode({
            ...src,
            src: cloneNode(src.src),
        });
    } else if (src.kind === "op_static_call") {
        return cloneASTNode({
            ...src,
            args: src.args.map(cloneNode),
        });
    } else if (src.kind === "conditional") {
        return cloneASTNode({
            ...src,
            condition: cloneNode(src.condition),
            thenBranch: cloneNode(src.thenBranch),
            elseBranch: cloneNode(src.elseBranch),
        });
    } else if (src.kind === "statement_return") {
        return cloneASTNode({
            ...src,
            expression: src.expression ? cloneNode(src.expression) : null,
        });
    } else if (src.kind === "statement_repeat") {
        return cloneASTNode({
            ...src,
            iterations: cloneNode(src.iterations),
            statements: src.statements.map(cloneNode),
        });
    } else if (src.kind === "statement_until") {
        return cloneASTNode({
            ...src,
            condition: cloneNode(src.condition),
            statements: src.statements.map(cloneNode),
        });
    } else if (src.kind === "statement_while") {
        return cloneASTNode({
            ...src,
            condition: cloneNode(src.condition),
            statements: src.statements.map(cloneNode),
        });
    } else if (src.kind === "statement_try") {
        return cloneASTNode({
            ...src,
            statements: src.statements.map(cloneNode),
        });
    } else if (src.kind === "statement_try_catch") {
        return cloneASTNode({
            ...src,
            statements: src.statements.map(cloneNode),
            catchStatements: src.catchStatements.map(cloneNode),
        });
    } else if (src.kind === "statement_foreach") {
        return cloneASTNode({
            ...src,
            statements: src.statements.map(cloneNode),
        });
    } else if (src.kind === "def_function") {
        return cloneASTNode({
            ...src,
            return: src.return ? cloneASTNode(src.return) : null,
            statements: src.statements ? src.statements.map(cloneNode) : null,
            args: src.args.map(cloneNode),
        });
    } else if (src.kind === "def_native_function") {
        return cloneASTNode({
            ...src,
            return: src.return ? cloneASTNode(src.return) : null,
            args: src.args.map(cloneNode),
        });
    } else if (src.kind === "def_receive") {
        return cloneASTNode({
            ...src,
            statements: src.statements.map(cloneNode),
        });
    } else if (src.kind === "def_argument") {
        return cloneASTNode({
            ...src,
            type: cloneASTNode(src.type),
        });
    } else if (src.kind === "init_of") {
        return cloneASTNode({
            ...src,
            args: src.args.map(cloneNode),
        });
    } else if (src.kind === "def_constant") {
        return cloneASTNode({
            ...src,
            type: cloneASTNode(src.type),
            value: src.value ? cloneNode(src.value) : src.value,
        });
    }

    throw Error("Not implemented for " + src.kind);
}
