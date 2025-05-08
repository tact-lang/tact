contract MapNullComparisonTest {
    receive() {
        // Test comparing an empty map to null. According to documentation,
        // an empty map is equivalent to null and m == null should be true.
        let m: map<Int, Int> = emptyMap();
        if (m == null) {
            dump(1); // Expected output: 1 (true)
        } else {
            dump(0);
        }
    }
}
