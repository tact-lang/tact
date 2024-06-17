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

export class TactConstEvalError extends TactSyntaxError {
    fatal: boolean = false;
    constructor(message: string, fatal: boolean, ref: ASTRef) {
        super(message, ref);
        this.fatal = fatal;
    }
}

function locationStr(sourceInfo: ASTRef): string {
    if (sourceInfo.file) {
        const loc = sourceInfo.interval.getLineAndColumn() as {
            lineNum: number;
            colNum: number;
        };
        return `${sourceInfo.file}:${loc.lineNum}:${loc.colNum}: `;
    } else {
        return "";
    }
}

export function throwSyntaxError(message: string, source: ASTRef): never {
    throw new TactSyntaxError(
        `${locationStr(source)}${message}\n${source.interval.getLineAndColumnMessage()}`,
        source,
    );
}

export function throwConstEvalError(
    message: string,
    fatal: boolean,
    source: ASTRef,
): never {
    throw new TactConstEvalError(
        `${locationStr(source)}${message}\n${source.interval.getLineAndColumnMessage()}`,
        fatal,
        source,
    );
}
