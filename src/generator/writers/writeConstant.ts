import { Address, beginCell, Cell } from "@ton/core";
import { WriterContext } from "../Writer";

export function writeString(str: string, ctx: WriterContext) {
    let cell = beginCell().storeStringTail(str).endCell();
    return writeRawSlice('string', `String "${str}"`, cell, ctx);
}

export function writeStringCell(str: string, ctx: WriterContext) {
    let cell = beginCell().storeStringTail(str).endCell();
    return writeRawCell('string', `String "${str}"`, cell, ctx);
}

export function writeComment(str: string, ctx: WriterContext) {
    let cell = beginCell().storeUint(0, 32).storeStringTail(str).endCell();
    return writeRawCell('comment', `Comment "${str}"`, cell, ctx);
}

export function writeAddress(address: Address, ctx: WriterContext) {
    return writeRawSlice('address', address.toString(), beginCell().storeAddress(address).endCell(), ctx);
}

export function writeCell(cell: Cell, ctx: WriterContext) {
    return writeRawCell('cell', 'Cell ' + cell.hash().toString('base64'), cell, ctx);
}

function writeRawSlice(prefix: string, comment: string, cell: Cell, ctx: WriterContext) {
    let h = cell.hash().toString('hex');
    let t = cell.toBoc({ idx: false }).toString('hex');
    let k = 'slice:' + prefix + ':' + h;
    if (ctx.isRendered(k)) {
        return `__gen_slice_${prefix}_${h}`;
    }
    ctx.markRendered(k);
    ctx.fun(`__gen_slice_${prefix}_${h}`, () => {
        ctx.signature(`slice __gen_slice_${prefix}_${h}()`);
        ctx.comment(`${comment}`);
        ctx.context('constants');
        ctx.asm(`asm "B{${t}} B>boc <s PUSHSLICE"`);
    });
    return `__gen_slice_${prefix}_${h}`;
}

function writeRawCell(prefix: string, comment: string, cell: Cell, ctx: WriterContext) {
    let h = cell.hash().toString('hex');
    let t = cell.toBoc({ idx: false }).toString('hex');
    let k = 'cell:' + prefix + ':' + h;
    if (ctx.isRendered(k)) {
        return `__gen_cell_${prefix}_${h}`;
    }
    ctx.markRendered(k);
    ctx.fun(`__gen_cell_${prefix}_${h}`, () => {
        ctx.signature(`cell __gen_cell_${prefix}_${h}()`);
        ctx.comment(`${comment}`);
        ctx.context('constants');
        ctx.asm(`asm "B{${t}} B>boc PUSHREF"`);
    });
    return `__gen_cell_${prefix}_${h}`;
}