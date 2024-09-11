import { AstId, idText } from "../../grammar/ast";

export function funcIdOf(ident: AstId | string): string {
    if (typeof ident === "string") {
        return "$" + ident;
    }
    return "$" + idText(ident);
}

export function funcInitIdOf(ident: AstId | string): string {
    if (typeof ident === "string") {
        return ident + "$init";
    }
    return idText(ident) + "$init";
}
