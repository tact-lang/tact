import { stringToCell } from "ton";
import { getStringId } from "../../types/resolveStrings";
import { WriterContext } from "../Writer";

export function writeString(str: string, ctx: WriterContext) {
    let id = getStringId(str, ctx.ctx);
    ctx.fun(`__gen_str_${id}`, () => {
        let boc = stringToCell(str).toBoc({ idx: false }).toString('hex');
        ctx.append(`;; String "${str}"`);
        ctx.append(`slice __gen_str_${id}() asm "B{${boc}} B>boc <s PUSHSLICE";`);
    });
}