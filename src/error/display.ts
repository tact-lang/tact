/**
 * Describes DSL for displaying errors
 */

import { SrcInfo } from "../grammar";

/**
 * @deprecated Use `Logger` from src/error/logger-util.ts
 */
export interface ErrorDisplay<T> {
    // Specify main error location
    at: (loc: SrcInfo, body: T) => T;

    // Regular string
    text: (text: string) => T;

    // Text with substitutions
    sub: (text: TemplateStringsArray, ...subst: T[]) => T;

    // Reference some code location
    link: (text: string, loc: SrcInfo) => T;
}
