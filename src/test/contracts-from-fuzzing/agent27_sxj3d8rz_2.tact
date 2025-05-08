contract OpTest {
    receive() {
        // Test arithmetic: operator precedence
        dump(1 + 2 * 3); // Expected dump: 7
    }
}
