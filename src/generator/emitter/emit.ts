import { Maybe } from "@ton/core/dist/utils/maybe";
import { trimIndent } from "../../utils/text";
import { WrittenFunction } from "../Writer";
import { createPadded } from "./createPadded";

export function emit(args: {
    header?: Maybe<string>;
    functions?: Maybe<WrittenFunction[]>;
}) {
    // Emit header
    let res = "";
    if (args.header) {
        res = trimIndent(args.header);
    }

    // Emit functions
    if (args.functions) {
        for (const f of args.functions) {
            if (f.name === "$main") {
                continue;
            } else {
                if (res !== "") {
                    res += "\n\n";
                }
                if (f.comment) {
                    for (const s of f.comment.split("\n")) {
                        res += `;; ${s}\n`;
                    }
                }
                if (f.code.kind === "generic") {
                    let sig = f.signature;
                    if (f.flags.has("impure")) {
                        sig = `${sig} impure`;
                    }
                    if (f.flags.has("inline")) {
                        sig = `${sig} inline`;
                    } else {
                        sig = `${sig} inline_ref`;
                    }

                    res += `${sig} {\n${createPadded(f.code.code)}\n}`;
                } else if (f.code.kind === "asm") {
                    let sig = f.signature;
                    if (f.flags.has("impure")) {
                        sig = `${sig} impure`;
                    }
                    res += `${sig} ${f.code.code};`;
                } else {
                    throw new Error(`Unknown function body kind`);
                }
            }
        }

        // Emit main
        const m = args.functions.find((v) => v.name === "$main");
        if (m) {
            if (m.code.kind !== "generic") {
                throw new Error(`Main function should have generic body`);
            }
            if (res !== "") {
                res += "\n\n";
            }
            res += m.code.code;
        }
    }

    return res;
}
