import { MatchResult } from "ohm-js";
import path from "path";
import { cwd } from "process";
import { ASTRef } from "./grammar/ast";

export class TactError extends Error {
    readonly ref: ASTRef;
    constructor(message: string, ref: ASTRef) {
        super(message);
        this.ref = ref;
    }
}

export class TactParseError extends TactError {
    constructor(message: string, ref: ASTRef) {
        super(message, ref);
    }
}

/// This will be split at least into two categories: typechecking and codegen errors
export class TactCompilationError extends TactError {
    constructor(message: string, ref: ASTRef) {
        super(message, ref);
    }
}

export class TactConstEvalError extends TactCompilationError {
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
        const file = path.relative(cwd(), sourceInfo.file);
        return `${file}:${loc.lineNum}:${loc.colNum}: `;
    } else {
        return "";
    }
}

export function throwParseError(matchResult: MatchResult, path: string): never {
    const interval = matchResult.getInterval();
    const source = new ASTRef(interval, path);
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const message = `Parse error: expected ${(matchResult as any).getExpectedText()}\n`;
    throw new TactParseError(
        `${locationStr(source)}${message}\n${interval.getLineAndColumnMessage()}`,
        source,
    );
}

export function throwCompilationError(message: string, source: ASTRef): never {
    throw new TactCompilationError(
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
