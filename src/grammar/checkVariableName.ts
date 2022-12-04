import { ASTRef, throwError } from "../ast/ast";

let blacklisted = [
    "for",
    "if",
    "while",
    "else",
    "return",
    "break",
    "continue",
    "switch",
    "case",
    "default",
    "function",
    "let",
    "const",
    "new",
    "self",
    "this",
    "true",
    "false",
    "null",
    "undefined",
    "class",
    "extends",
    "super",
    "import",
    "export",
    "from",
    "as",
    "try",
    "catch",
    "finally",
    "throw",
    "in",
    "of",
    "typeof",
    "instanceof",
    "void",
    "delete",
    "with",
    "debugger",
    "yield",
    "await",
    "async",
    "enum",
    "static",
    "get",
    "set",
    "cons"
];

export function checkVariableName(name: string, ref: ASTRef) {
    if (name.startsWith('__gen')) {
        throwError(`Variable name cannot start with "__gen"`, ref);
    }
    if (name.startsWith('__tact')) {
        throwError(`Variable name cannot start with "__tact"`, ref);
    }
    if (blacklisted.includes(name)) {
        throwError(`Variable name cannot be a reserved word`, ref);
    }
}