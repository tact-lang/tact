import { ASTRef } from "./grammar/ast";

export class TactSourceError extends Error {
    readonly ref: ASTRef;
    constructor(message: string, ref: ASTRef) {
        super(message);
        this.ref = ref;
    }
}

export class TactSyntaxError extends TactSourceError {
    constructor(message: string, ref: ASTRef) {
        super(message, ref);
    }
}