contract Test {
    receive() {
        // Create a cell storing 42 in 10 bits
        let cell: Cell = beginCell().storeUint(42, 10).asCell();
        let s: Slice = cell.beginParse();

        // Use extension function bits() to count data bits in the slice
        let numBits: Int = s.bits();

        dump(numBits);
    }
}
