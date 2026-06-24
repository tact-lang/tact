const TEST_SHA: Int = sha256("hello");

contract TestSha() {
    receive() {
        dump(TEST_SHA); // Expected: the compile-time computed SHA256 hash of "hello" as an Int
    }
}
