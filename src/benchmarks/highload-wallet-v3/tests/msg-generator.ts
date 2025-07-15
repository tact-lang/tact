import type {
    CommonMessageInfoExternalIn,
    CommonMessageInfoExternalOut,
    Message,
    MessageRelaxed,
    StateInit,
} from "@ton/core";
import {
    Cell,
    ExternalAddress,
    beginCell,
    storeMessage,
    storeMessageRelaxed,
} from "@ton/core";
import { randomAddress } from "@ton/test-utils";
export class MsgGenerator {
    constructor(readonly wc: number) {}

    generateExternalOutWithBadSource() {
        const ssrcInvalid = beginCell()
            .storeUint(2, 2) // addr_std$10
            .storeUint(0, 1) // anycast nothing
            .storeInt(this.wc, 8) // workchain_id: -1
            .storeUint(1, 10)
            .endCell();

        return beginCell()
            .storeUint(3, 2) // ext_out_msg_info$11
            .storeBit(0) // src:INVALID
            .storeSlice(ssrcInvalid.beginParse())
            .endCell();
    }
    generateExternalOutWithBadDst() {
        const src = randomAddress(-1);
        return beginCell()
            .storeUint(3, 2) // ext_out_msg_info$11
            .storeAddress(src) // src:MsgAddressInt
            .storeBit(0) // dest:INVALID
            .endCell();
    }
    generateExternalInWithBadSource() {
        const ssrcInvalid = beginCell()
            .storeUint(1, 2) // addrExtern$01
            .storeUint(128, 9)
            .storeUint(0, 10)
            .endCell();

        return beginCell()
            .storeUint(2, 2) //ext_in_msg_info$11
            .storeSlice(ssrcInvalid.beginParse()) // src:INVALID
            .endCell();
    }
    generateExternalInWithBadDst() {
        const src = new ExternalAddress(BigInt(Date.now()), 256);
        return beginCell()
            .storeUint(2, 2) //ext_in_msg_info$10
            .storeAddress(src) // src:MsgAddressExt
            .storeBit(0) // dest:INVALID
            .endCell();
    }
    generateInternalMessageWithBadGrams() {
        const src = randomAddress(this.wc);
        const dst = randomAddress(this.wc);
        return beginCell()
            .storeUint(0, 1) // int_msg_info$0
            .storeUint(0, 1) // ihr_disabled:Bool
            .storeUint(0, 1) // bounce:Bool
            .storeUint(0, 1) // bounced:Bool
            .storeAddress(src) // src:MsgAddress
            .storeAddress(dst) // dest:MsgAddress
            .storeUint(8, 4) // len of nanograms
            .storeUint(1, 1) // INVALID GRAMS amount
            .endCell();
    }
    generateInternalMessageWithBadInitStateData() {
        const ssrc = randomAddress(this.wc);
        const sdest = randomAddress(this.wc);

        const init_state_with_bad_data = beginCell()
            .storeUint(0, 1) // maybe (##5)
            .storeUint(1, 1) // Maybe TickTock
            .storeUint(1, 1) // bool Tick
            .storeUint(0, 1) // bool Tock
            .storeUint(1, 1) // code: Maybe Cell^
            .storeUint(1, 1) // data: Maybe Cell^
            .storeUint(1, 1); // library: Maybe ^Cell
        // bits for references but no data

        return beginCell()
            .storeUint(0, 1) // int_msg_info$0
            .storeUint(0, 1) // ihr_disabled:Bool
            .storeUint(0, 1) // bounce:Bool
            .storeUint(0, 1) // bounced:Bool
            .storeAddress(ssrc) // src:MsgAddress
            .storeAddress(sdest) // dest:MsgAddress
            .storeCoins(0) //
            .storeMaybeRef(null) // extra currencies
            .storeCoins(0) // ihr_fee
            .storeCoins(0) // fwd_fee
            .storeUint(1000, 64) // created_lt:uint64
            .storeUint(1000, 32) // created_at:uint32
            .storeUint(1, 1) // Maybe init_state
            .storeUint(1, 1) // Either (X ^X) init state
            .storeRef(init_state_with_bad_data.endCell())
            .storeUint(0, 1) // Either (X ^X) body
            .endCell();
    }

    *generateBadMsg() {
        // Meh
        yield this.generateExternalInWithBadDst();
        yield this.generateExternalOutWithBadDst();
        yield this.generateExternalInWithBadSource();
        yield this.generateExternalOutWithBadSource();
        yield this.generateInternalMessageWithBadGrams();
        yield this.generateInternalMessageWithBadInitStateData();
    }
    generateExternalInMsg(
        info?: Partial<CommonMessageInfoExternalIn>,
        body?: Cell,
        init?: StateInit,
    ) {
        const msgInfo: CommonMessageInfoExternalIn = {
            type: "external-in",
            dest: info?.dest ?? randomAddress(this.wc),
            src: info?.src,
            importFee: info?.importFee ?? 0n,
        };
        const newMsg: Message = {
            info: msgInfo,
            body: body ?? Cell.EMPTY,
            init,
        };
        return beginCell().store(storeMessage(newMsg)).endCell();
    }
    generateExternalOutMsg(
        info?: Partial<CommonMessageInfoExternalOut>,
        body?: Cell,
    ) {
        const msgInfo: CommonMessageInfoExternalOut = {
            type: "external-out",
            createdAt: info?.createdAt ?? 0,
            createdLt: info?.createdLt ?? 0n,
            src: info?.src ?? randomAddress(this.wc),
            dest: info?.dest,
        };
        const newMsg: MessageRelaxed = {
            info: msgInfo,
            body: body ?? Cell.EMPTY,
        };
        return beginCell().store(storeMessageRelaxed(newMsg)).endCell();
    }
}
