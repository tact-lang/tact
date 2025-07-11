struct VarIntStruct {
    a: Int as varint16;
    b: Int as varint32;
    d: Int as varuint16;
    e: Int as varuint32;
}

message ReadFwdFeeMsg {
}

contract StdlibTest {

    v: Int = 0;

    init() {
        // Nothing to do
    }

    receive() {
        // Deploy
    }

    receive(msg: ReadFwdFeeMsg) {
        let cs = context().raw;
        cs.loadAddress(); // dest
        cs.loadCoins();   // value
        cs.skipBits(1);   // skip extra
        cs.loadCoins();   // ihr_fee
        let cellFwdFee = cs.loadCoins(); // fwd_fee
        let contextFwdFee = context().readForwardFee();
        self.reply(beginCell()
            .storeCoins(contextFwdFee)
            .storeCoins(getOriginalFwdFee(cellFwdFee, false))
            .endCell());
    }

    get fun sliceEmpty(sc: Slice): Bool {
        return sc.empty();
    }

    get fun sliceBits(sc: Slice): Int {
        return sc.bits();
    }

    get fun sliceRefs(sc: Slice): Int {
        return sc.refs();
    }

    get fun storeBool(bl: Builder, b: Bool): Builder {
        return bl.storeBool(b);
    }

    get fun loadBool(sc: Slice): Bool {
        return sc.loadBool();
    }

    get fun storeBit(bl: Builder, b: Bool): Builder {
        return bl.storeBit(b);
    }

    get fun loadBit(sc: Slice): Bool {
        return sc.loadBit();
    }


    get fun tvm_2023_07_upgrade(): Int {
        return gasConsumed();
    }

    get fun tvm_2024_04_upgrade(): Int {
        return getComputeFee(1000, false) + getStorageFee(1000, 1000, 1000, false) + getForwardFee(1000, 1000, false) + getSimpleComputeFee(1000, false) + getSimpleForwardFee(1000, 1000, false) + getOriginalFwdFee(1000, false) + myStorageDue();
    }

    get fun storeMaybeRef(bl: Builder, c: Cell?): Builder {
        return bl.storeMaybeRef(c);
    }

    get fun loadMaybeRef(c: Slice): Cell? {
        return c.loadMaybeRef();
    }

    get fun preloadMaybeRef(c: Slice): Cell? {
        return c.preloadMaybeRef();
    }

    get fun parseStdAddress(slice: Slice): StdAddress {
        return parseStdAddress(slice);
    }

    get fun forceBasechain(addr: Address): Bool {
        forceBasechain(addr);
        return true;
    }

    get fun forceWorkchain(addr: Address, workchain: Int, exitCode: Int): Bool {
        forceWorkchain(addr, workchain, exitCode);
        return true;
    }

    get fun skipRef(c: Slice): Slice {
        c.skipRef();
        return c;
    }

    get fun skipMaybeRef(c: Slice): Slice {
        c.skipMaybeRef();
        return c;
    }

    get fun skipBool(c: Slice): Slice {
        c.skipBool();
        return c;
    }

    get fun skipCoins(c: Slice): Slice {
        c.skipCoins();
        return c;
    }

    get fun skipAddress(c: Slice): Slice {
        c.skipAddress();
        return c;
    }

    get fun builderDepth(bl: Builder): Int {
        return bl.depth();
    }

    get fun skipLastBits(sc: Slice, n: Int): Slice {
        return sc.skipLastBits(n);
    }

    get fun firstBits(sc: Slice, n: Int): Slice {
        return sc.firstBits(n);
    }

    get fun lastBits(sc: Slice, n: Int): Slice {
        return sc.lastBits(n);
    }

    get fun sliceDepth(sc: Slice): Int {
        return sc.depth();
    }

    get fun computeDataSizeCell(c: Cell?, maxCells: Int): DataSize {
        return c.computeDataSize(maxCells);
    }

    get fun computeDataSizeSlice(sc: Slice, maxCells: Int): DataSize {
        return sc.computeDataSize(maxCells);
    }

    get fun cellDepth(c: Cell?): Int {
        return c.depth();
    }

    get fun curLt(): Int {
        return curLt();
    }

    get fun blockLt(): Int {
        return blockLt();
    }

    get fun setGasLimit(gl: Int): Int {
        setGasLimit(gl);
        let x = 0;
        repeat (100) {
            x += 1;
        }
        return gasConsumed();
    }

    get fun getSeed(): Int {
        return getSeed();
    }

    get fun setSeed(seed: Int): Int {
        setSeed(seed);
        return getSeed();
    }

    get fun myCode(): Cell {
        return myCode();
    }

    get fun varIntegers1(): Int {
        let x = beginCell().storeVarInt16(1000).storeVarInt32(200).storeVarUint16(30).storeVarUint32(4).endCell().beginParse();
        let a = x.loadVarInt16();
        let b = x.loadVarInt32();
        let d = x.loadVarUint16();
        let e = x.loadVarUint32();
        return a + b + d + e;
    }

    get fun varIntegers2(): Int {
        let s = VarIntStruct{
            a: 1000,
            b: 200,
            d: 30,
            e: 4
        };
        let c = s.toCell();
        let cs = c.beginParse();
        let a = cs.loadVarInt16();
        let b = cs.loadVarInt32();
        let d = cs.loadVarUint16();
        let e = cs.loadVarUint32();
        return a + b + d + e;
    }
}
