contract LoadUintTest {
    receive() {
        // This test attempts to load 300 bits from a slice that only contains 7 bits.
        // According to documentation, this should throw an exception with exit code 5 (Integer out of expected range) or exit code 9 (Cell underflow) at runtime.
        let s: Slice = beginCell().storeUint(42, 7).endCell().beginParse();
        dump(s.loadUint(300));
    }
}
