import { ASTRef, throwError } from "./ast";

export function checkVariableName(name: string, ref: ASTRef) {
    if (name.startsWith('__gen')) {
        throwError(`Variable name cannot start with "__gen"`, ref);
    }
    if (name.startsWith('__tact')) {
        throwError(`Variable name cannot start with "__tact"`, ref);
    }
}