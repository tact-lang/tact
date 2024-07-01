import { MatchResult } from "ohm-js";
import path from "path";
import { cwd } from "process";
import { AstId, SrcInfo } from "./grammar/ast";
import { ItemOrigin } from "./grammar/grammar";

export class TactError extends Error {
    readonly ref: SrcInfo;
    constructor(message: string, ref: SrcInfo) {
        super(message);
        this.ref = ref;
    }
}

export class TactParseError extends TactError {
    constructor(message: string, ref: SrcInfo) {
        super(message, ref);
    }
}

/// This will be split at least into two categories: typechecking and codegen errors
export class TactCompilationError extends TactError {
    constructor(message: string, ref: SrcInfo) {
        super(message, ref);
    }
}

export class TactInternalCompilerError extends TactError {
    constructor(message: string, ref: SrcInfo) {
        super(message, ref);
    }
}

export class TactConstEvalError extends TactCompilationError {
    fatal: boolean = false;
    constructor(message: string, fatal: boolean, ref: SrcInfo) {
        super(message, ref);
        this.fatal = fatal;
    }
}

function locationStr(sourceInfo: SrcInfo): string {
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

export function throwParseError(
    matchResult: MatchResult,
    path: string,
    origin: ItemOrigin,
): never {
    const interval = matchResult.getInterval();
    const source = new SrcInfo(interval, path, origin);
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const message = `Parse error: expected ${(matchResult as any).getExpectedText()}\n`;
    throw new TactParseError(
        `${locationStr(source)}${message}\n${interval.getLineAndColumnMessage()}`,
        source,
    );
}

export function throwCompilationError(message: string, source: SrcInfo): never {
    throw new TactCompilationError(
        `${locationStr(source)}${message}\n${source.interval.getLineAndColumnMessage()}`,
        source,
    );
}

export function throwInternalCompilerError(
    message: string,
    source: SrcInfo,
): never {
    throw new TactInternalCompilerError(
        `${locationStr(source)}\n[INTERNAL COMPILER ERROR]: ${message}\nPlease report at https://github.com/tact-lang/tact/issues\n${source.interval.getLineAndColumnMessage()}`,
        source,
    );
}

export function throwConstEvalError(
    message: string,
    fatal: boolean,
    source: SrcInfo,
): never {
    throw new TactConstEvalError(
        `${locationStr(source)}${message}\n${source.interval.getLineAndColumnMessage()}`,
        fatal,
        source,
    );
}

export function idTextErr(ident: string): string;
export function idTextErr(ident: AstId): string;
export function idTextErr(ident: AstId | string): string {
    if (typeof ident === "string") {
        return `"${ident}"`;
    }
    return `"${ident.text}"`;
}
