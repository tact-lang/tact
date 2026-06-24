contract TestCell() {
    // Test constant evaluation of cell built-in compile-time function by converting to Slice and dumping the bit-length
    const C: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    fun showcase() {
        dump(self.C.asSlice().bits());
    }

    receive() {
        self.showcase();
        return;
    }
}
