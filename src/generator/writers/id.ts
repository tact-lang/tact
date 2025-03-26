import type * as Ast from "../../ast/ast";
import { idText } from "../../ast/ast-helpers";

export function funcIdOf(ident: Ast.Id | string): string {
    if (typeof ident === "string") {
        return "$" + ident;
    }
    return "$" + idText(ident);
}

export function funcInitIdOf(ident: Ast.Id | string): string {
    if (typeof ident === "string") {
        return ident + "$init";
    }
    return idText(ident) + "$init";
}
