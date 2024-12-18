/**
 * Render error message to string for compiler CLI
 */

import { relative } from "path";
import { cwd } from "process";
import { SrcInfo } from "../grammar";
import { ErrorDisplay } from "./display";

const locationStr = (sourceInfo: SrcInfo): string => {
    if (!sourceInfo.file) {
        return "";
    }

    const loc = sourceInfo.interval.getLineAndColumn() as {
        lineNum: number;
        colNum: number;
    };

    const file = relative(cwd(), sourceInfo.file);
    return `${file}:${loc.lineNum}:${loc.colNum}: `;
}

export const displayToString: ErrorDisplay<string> = {
    text: (text) => text,
    sub: (parts, ...subst) => {
        const [head, ...tail] = parts;
        if (!head) {
            return '';
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
    // type: (type) => String(type),
};