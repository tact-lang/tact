const CHECK: Int = crc32("deadbeef");

contract Test {
    receive() {
        // Use the constant computed at compile time
        let x = CHECK;
    }
}
