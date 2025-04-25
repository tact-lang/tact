import type * as Ast from "@/next/ast";
import { emptyPath, fromString } from "@/next/fs";
import type { Language, Range } from "@/next/ast/common";
import type { SourceLogger } from "@/error/logger-util";

const detectLanguage = (path: string): Language | undefined => {
    if (path.endsWith(".fc") || path.endsWith(".func")) {
        return "func";
    }

    if (path.endsWith(".tact")) {
        return "tact";
    }

    return undefined;
};

const guessExtension = (
    importText: string,
): { language: Language; guessedPath: string } => {
    const language = detectLanguage(importText);
    if (language) {
        return { guessedPath: importText, language };
    } else {
        return { guessedPath: `${importText}.tact`, language: "tact" };
    }
};

const stdlibPrefix = "@stdlib/";

export const ImportErrors = <M, R>(l: SourceLogger<M, R>) => ({
    importWithBackslash: () => (loc: Range) => {
        return l.at(loc).error(l.text`Import path can't contain "\\"`);
    },
    noFolderImports: () => (loc: Range) => {
        return l.at(loc).error(l.text`Cannot import a folder`);
    },
    invalidImport: () => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Import must start with ./, ../ or @stdlib/`);
    },
    escapingImport: () => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Standard library imports should be inside its root`);
    },
});

export type ImportErrors<M, R> = ReturnType<typeof ImportErrors<M, R>>;

export function parseImportString(
    importText: string,
    range: Range,
    err: ImportErrors<string, void>
): Ast.ImportPath {
    if (importText.endsWith("/")) {
        err.noFolderImports()(range);
        importText = importText.slice(0, -1);
    }

    if (importText.includes("\\")) {
        err.importWithBackslash()(range);
        importText = importText.replace(/\\/g, "/");
    }

    const { guessedPath, language } = guessExtension(importText);

    if (guessedPath.startsWith(stdlibPrefix)) {
        const path = fromString(guessedPath.substring(stdlibPrefix.length));

        if (path.stepsUp !== 0) {
            err.importWithBackslash()(range);
        }

        return {
            path,
            type: "stdlib",
            language,
        };
    } else if (
        guessedPath.startsWith("./") ||
        guessedPath.startsWith("../")
    ) {
        return {
            path: fromString(guessedPath),
            type: "relative",
            language,
        };
    } else {
        err.invalidImport()(range);
        return {
            path: emptyPath,
            type: "relative",
            language: "tact",
        };
    }
}
