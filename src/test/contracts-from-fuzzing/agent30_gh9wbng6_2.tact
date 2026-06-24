const A: Int = ascii("⚡"); // Expected: 14850721 or equivalent
const B: Int = ton("1");   // Expected: 1000000000
const C: Int = crc32("deadbeef"); // Compile-time CRC32 value of "deadbeef"
const D: Int = sha256("hey, I'll produce the SHA256 number at compile-time"); // Compile-time SHA256 value

contract TestConstants {
    // A receiver function to force the constants to be compiled and inlined
    receive() {
        // Dump the constants to verify their computed values at compile-time
        dump(A);
        dump(B);
        dump(C);
        dump(D);
    }
}
