import { Address, beginCell, Cell } from "ton-core";
import { getStringId } from "../../types/resolveStrings";
import { WriterContext } from "../Writer";

export function writeString(str: string, ctx: WriterContext) {
    let id = getStringId(str, ctx.ctx);
    ctx.fun(`__gen_str_${id}`, () => {
        let boc = beginCell().storeStringTail(str).endCell().toBoc({ idx: false }).toString('hex');
        ctx.append(`;; String "${str}"`);
        ctx.append(`slice __gen_str_${id}() asm "B{${boc}} B>boc <s PUSHSLICE";`);
    });
}

export function writeAddress(address: Address, ctx: WriterContext) {
    return writeSlice('address', ';; ' + address.toString(), beginCell().storeAddress(address).endCell(), ctx);
}

export function writeSlice(prefix: string, comment: string, cell: Cell, ctx: WriterContext) {
    let h = cell.hash().toString('hex');
    let k = prefix + ':' + h;
    if (ctx.isRendered(k)) {
        return `__gen_slice_${prefix}_${h}`;
    }
    ctx.markRendered(k);
    ctx.fun(`__gen_slice_${prefix}_${h}`, () => {
        ctx.append(`;; ${comment}`);
        ctx.append(`slice __gen_slice_${prefix}_${h}() asm "B{${cell.toBoc({ idx: false }).toString('hex')}} B>boc <s PUSHSLICE";`);
    });
    return `__gen_slice_${prefix}_${h}`;
}