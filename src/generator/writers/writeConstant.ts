import { Address, beginCell, Cell, Builder } from "@ton/core";
import { WriterContext } from "../Writer";

export function writeString(str: string, ctx: WriterContext) {
    const cell = beginCell().storeStringTail(str).endCell();
    return writeRawSlice("string", `String "${str}"`, cell, ctx);
}
export function writeBuffer(buf: Buffer, ctx: WriterContext) {
    const cell = beginCell();
    writeBufferRec(buf, cell);
    return writeRawSlice("string", `Binary "${buf.toString('base64')}"`, cell.endCell(), ctx);
}

/**
 * Stores buffer in cell recursively, by storing max amount of data in current
 * cell, and rest in the reference
 * @param src - original buffer to store
 * @param builder - cell builder, where to store
 */
export function writeBufferRec(src: Buffer, builder: Builder) {
    if (src.length > 0) {
        const bytes = Math.floor(builder.availableBits / 8);
        if (src.length > bytes) {
            const a = src.subarray(0, bytes);
            const t = src.subarray(bytes);
            builder = builder.storeBuffer(a);
            const bb = beginCell();
            writeBufferRec(t, bb);
            builder = builder.storeRef(bb.endCell());
        } else {
            builder = builder.storeBuffer(src);
        }
    }
}



export function writeComment(str: string|Buffer, ctx: WriterContext) {
    const builder =  beginCell().storeUint(0, 32);
    let cell: Cell;
    if(str instanceof Buffer) {
        writeBufferRec(str, builder);
        cell = builder.endCell();
    }
    else cell = builder.storeStringTail(str).endCell();
    //                                            .toString('base64') for string would return the same string
    return writeRawCell("comment", `Comment "${str.toString('base64')}"`, cell, ctx);
}

export function writeAddress(address: Address, ctx: WriterContext) {
    return writeRawSlice(
        "address",
        address.toString(),
        beginCell().storeAddress(address).endCell(),
        ctx,
    );
}

export function writeCell(cell: Cell, ctx: WriterContext) {
    return writeRawCell(
        "cell",
        "Cell " + cell.hash().toString("base64"),
        cell,
        ctx,
    );
}

function writeRawSlice(
    prefix: string,
    comment: string,
    cell: Cell,
    ctx: WriterContext,
) {
    const h = cell.hash().toString("hex");
    const t = cell.toBoc({ idx: false }).toString("hex");
    const k = "slice:" + prefix + ":" + h;
    if (ctx.isRendered(k)) {
        return `__gen_slice_${prefix}_${h}`;
    }
    ctx.markRendered(k);
    ctx.fun(`__gen_slice_${prefix}_${h}`, () => {
        ctx.signature(`slice __gen_slice_${prefix}_${h}()`);
        ctx.comment(comment);
        ctx.context("constants");
        ctx.asm(`asm "B{${t}} B>boc <s PUSHSLICE"`);
    });
    return `__gen_slice_${prefix}_${h}`;
}

function writeRawCell(
    prefix: string,
    comment: string,
    cell: Cell,
    ctx: WriterContext,
) {
    const h = cell.hash().toString("hex");
    const t = cell.toBoc({ idx: false }).toString("hex");
    const k = "cell:" + prefix + ":" + h;
    if (ctx.isRendered(k)) {
        return `__gen_cell_${prefix}_${h}`;
    }
    ctx.markRendered(k);
    ctx.fun(`__gen_cell_${prefix}_${h}`, () => {
        ctx.signature(`cell __gen_cell_${prefix}_${h}()`);
        ctx.comment(comment);
        ctx.context("constants");
        ctx.asm(`asm "B{${t}} B>boc PUSHREF"`);
    });
    return `__gen_cell_${prefix}_${h}`;
}
