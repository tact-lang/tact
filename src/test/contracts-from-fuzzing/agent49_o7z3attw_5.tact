const HASH: Int = sha256("hello");

contract Test {
    receive() {
        // Use the compile-time computed SHA256 hash constant
        let h = HASH;
    }
}
