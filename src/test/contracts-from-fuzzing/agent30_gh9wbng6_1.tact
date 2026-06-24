const A: Int = ascii("⚡");
const B: Int = ton("1");
const C: Int = crc32("deadbeef");

contract Test {
    // Receiver to ensure the constants are actually compiled and used
    receive() {
        // Dump the constants to verify their compile-time computed values
        dump(A);
        dump(B);
        dump(C);
    }
}
