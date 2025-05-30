contract TestBuilderSlice {
    fun test() {
        // Create a Builder, store an unsigned 7-bit number 42,
        // then convert to Cell and Slice and load back the value.
        let b: Builder = beginCell().storeUint(42, 7);
        let cellFromB: Cell = b.asCell();
        let s: Slice = b.asSlice();
        let loaded: Int = s.loadUint(7); // expected to be 42
        dump(loaded);
    }
    receive() { self.test(); }
}
