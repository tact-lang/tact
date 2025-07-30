const TEST_ASCII: Int = ascii("⚡");

contract TestASCII {
    receive() {
        // Dump the compile-time computed value: expected 14850721
        dump(TEST_ASCII);
        cashback(sender());
    }
}
