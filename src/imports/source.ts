import { throwInternalCompilerError } from "../error/errors";

export type Path = {
    readonly parts: readonly string[];
    readonly stepsUp: number;
};

export const Path = (parts: readonly string[], stepsUp: number) => {
    if (stepsUp < 0) {
        throwInternalCompilerError('Negative number of ../ in path');
    }
    return { parts, stepsUp };
};

export type SourceRelative = {
    readonly path: Path;
    readonly code: string;
    readonly origin: ItemOrigin;
};

export type Language = "func" | "tact";

export type SourceReference = {
    readonly source: SourceRelative;
    readonly language: Language;
};

export type ItemOrigin = "stdlib" | "user";

/**
 * @deprecated To be replaced by SourceRelative
 */
export type SourceAbsolute = {
    /**
     * @deprecated Paths must be relative
     */
    readonly path: string;
    readonly code: string;
    readonly origin: ItemOrigin;
};
