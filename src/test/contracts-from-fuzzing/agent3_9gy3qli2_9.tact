fun testOverflow() {
    // Attempt to store an Int using 1024 bits, which exceeds the cell limit (1023 bits)
    dump(beginCell().storeInt(42, 1024).endCell());
}

contract TestOverflow {
    receive() {
        testOverflow();
    }
}
