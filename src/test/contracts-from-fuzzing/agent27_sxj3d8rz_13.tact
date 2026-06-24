contract TernaryTest {
    receive() {
        dump(true  ? 1 : 2);  // Expected: 1
        dump(false ? 1 : 2);  // Expected: 2
    }
}
