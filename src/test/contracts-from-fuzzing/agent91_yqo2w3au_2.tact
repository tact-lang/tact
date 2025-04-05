contract TestPrimitive() {
    fun test() {
        // Testing primitive types as per documentation
        let a: Int = 42;
        let b: Bool = true;
        let s: String = "hello";
        let addr: Address = myAddress();
        let emptyC: Cell = emptyCell();
        let bb: Builder = beginCell().storeUint(1, 1);
        let cellResult: Cell = bb.endCell();
        let sliceResult: Slice = cellResult.asSlice();
        dump(a);
        dump(b);
        dump(s);
        dump(addr);
        dump(emptyC);
        dump(cellResult);
        dump(sliceResult);
    }

    receive() {
        self.test();
    }
}
