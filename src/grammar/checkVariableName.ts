import { ASTRef } from "./ast";
import { throwSyntaxError } from "../errors";

export function checkVariableName(name: string, ref: ASTRef) {
    if (name.startsWith("__gen")) {
        throwSyntaxError(`Variable name cannot start with "__gen"`, ref);
    }
    if (name.startsWith("__tact")) {
        throwSyntaxError(`Variable name cannot start with "__tact"`, ref);
    }
}
