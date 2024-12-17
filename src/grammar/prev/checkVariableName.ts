import { throwCompilationError } from "../../errors";
import { SrcInfo } from "./src-info";

export function checkVariableName(name: string, loc: SrcInfo) {
    if (name.startsWith("__gen")) {
        throwCompilationError(`Variable name cannot start with "__gen"`, loc);
    }
    if (name.startsWith("__tact")) {
        throwCompilationError(`Variable name cannot start with "__tact"`, loc);
    }
}
