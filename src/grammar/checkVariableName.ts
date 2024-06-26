import { ASTRef } from "./ast";
import { throwCompilationError } from "../errors";

export function checkVariableName(name: string, ref: ASTRef) {
    if (name.startsWith("__gen")) {
        throwCompilationError(`Variable name cannot start with "__gen"`, ref);
    }
    if (name.startsWith("__tact")) {
        throwCompilationError(`Variable name cannot start with "__tact"`, ref);
    }
}
