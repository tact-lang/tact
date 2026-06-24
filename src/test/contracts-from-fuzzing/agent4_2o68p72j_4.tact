contract TestCRC32() {
    receive() {
        // Verify that crc32("000DEADBEEF000") is evaluated correctly
        // Expected value: 1821923098 as given in the documentation
        require(crc32("000DEADBEEF000") == 1821923098, "crc32 evaluation failed");

        cashback(sender());
    }
}
