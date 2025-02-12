/**
 * Describes DSL for displaying errors
 */

import type { SrcInfo } from "../grammar";

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
