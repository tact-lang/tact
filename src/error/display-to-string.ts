/**
 * Render error message to string for compiler CLI
 */

import { ErrorDisplay } from "./display";
import { locationStr } from "./errors";

/**
 * @deprecated Use `Logger` from src/error/logger-util.ts
 */
export const displayToString: ErrorDisplay<string> = {
    text: (text) => text,
    sub: (parts, ...subst) => {
        const [head, ...tail] = parts;
        if (!head) {
            return "";
        }
        return tail.reduce((acc, part, index) => {
            const sub = subst[index];
            return acc + sub + part;
        }, head);
    },
    link: (text, _loc) => text,
    at: (loc, body) => {
        return `${locationStr(loc)}${body}\n${loc.interval.getLineAndColumnMessage()}`;
    },
};
