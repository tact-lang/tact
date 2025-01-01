/**
 * Render error message to JSON for tests
 */

import { throwInternalCompilerError } from "../errors";
import { SrcInfo } from "../grammar";
import { srcInfoEqual } from "../grammar/src-info";
import { ErrorDisplay } from "./display";

export type ErrorJson = ErrorSub | ErrorText | ErrorLink | ErrorAt;

export type ErrorText = { kind: "text"; text: string };
export type ErrorSub = { kind: "sub"; parts: string[]; subst: ErrorJson[] };
export type ErrorLink = { kind: "link"; text: string; loc: SrcInfo };
export type ErrorAt = { kind: "at"; body: ErrorJson; loc: SrcInfo };

export const errorJsonEqual = (left: ErrorJson, right: ErrorJson): boolean => {
    switch (left.kind) {
        case "link": {
            return (
                left.kind === right.kind &&
                left.text === right.text &&
                srcInfoEqual(left.loc, right.loc)
            );
        }
        case "at": {
            return (
                left.kind === right.kind &&
                errorJsonEqual(left.body, right.body) &&
                srcInfoEqual(left.loc, right.loc)
            );
        }
        case "text": {
            return left.kind === right.kind && left.text === right.text;
        }
        case "sub": {
            if (left.kind !== right.kind) {
                return false;
            }
            if (left.parts.length !== right.parts.length) {
                return false;
            }
            if (left.parts.some((part, index) => part != right.parts[index])) {
                return false;
            }
            if (left.subst.length !== right.subst.length) {
                return false;
            }
            return left.subst.every((leftChild, index) => {
                const rightChild = right.subst[index];
                if (typeof rightChild === "undefined") {
                    throwInternalCompilerError(
                        "Impossible: by this moment array lengths must match",
                    );
                }
                return errorJsonEqual(leftChild, rightChild);
            });
        }
    }
};

export const displayToJson: ErrorDisplay<ErrorJson> = {
    text: (text) => ({ kind: "text", text }),
    sub: (parts, ...subst) => ({ kind: "sub", parts: [...parts], subst }),
    link: (text, loc) => ({ kind: "link", text, loc }),
    at: (loc, body) => ({ kind: "at", body, loc }),
};
