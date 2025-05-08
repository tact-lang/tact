contract TestPrim() {
    fun test() {
        // Primitive types: Int, Bool, Address, Cell, String, Builder, Slice
        let a: Int = 42;
        let b: Bool = true;
        let c: Address = myAddress();
        let d: Cell = emptyCell();
        let s: String = "Hello, Tact!";
        let bb: Builder = beginCell().storeUint(1, 1);
        let cellVal: Cell = bb.endCell();
        let sliceVal: Slice = cellVal.asSlice();
        let extracted: Int = sliceVal.loadUint(1);
        
        dump(a);
        dump(b);
        dump(s);
    }

    receive() {
        self.test();
    }
}
