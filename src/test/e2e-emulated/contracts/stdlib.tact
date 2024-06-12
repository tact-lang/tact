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
}