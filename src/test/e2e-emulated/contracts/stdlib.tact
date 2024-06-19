contract StdlibTest {

    v: Int = 0;

    init() {
        // Nothing to do
    }

    receive() {
        // Deploy
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
        return getComputeFee(0, 1000) + getStorageFee(0, 1000, 1000, 1000) + getForwardFee(0, 1000, 1000) + getSimpleComputeFee(0, 1000) + getSimpleForwardFee(0, 1000, 1000) + getOriginalFwdFee(0, 1000) + myStorageDue();
    }
}