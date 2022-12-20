import { getStringId } from "../../types/resolveStrings";
import { WriterContext } from "../Writer";

export function writeString(str: string, ctx: WriterContext) {
    let id = getStringId(str, ctx.ctx);
    ctx.fun(`__gen_str_${id}`, () => {
        ctx.append(`;; String "${str}"`);
        ctx.append(`slice __gen_str_${id}() asm """<b "${str}" $, b> <s PUSHSLICE """;`);
    });
}