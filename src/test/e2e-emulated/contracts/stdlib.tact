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
}