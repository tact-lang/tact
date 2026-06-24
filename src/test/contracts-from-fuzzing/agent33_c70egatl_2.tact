const TON_ONE: Int = ton("1"); // expected: 1000000000
const TON_HALF: Int = ton("0.5"); // expected: 500000000
const ASCII_LIGHTNING: Int = ascii("⚡"); // expected: 14850721
const CRC32_TEST: Int = crc32("000DEADBEEF000"); // expected: 1821923098

contract TestConstants() {
    receive() {
        // Check compile-time constant evaluations
        require(TON_ONE == 1000000000, "ton(\"1\") did not evaluate to 1000000000");
        require(TON_HALF == 500000000, "ton(\"0.5\") did not evaluate to 500000000");
        require(ASCII_LIGHTNING == 14850721, "ascii(\"⚡\") did not evaluate to 14850721");
        require(CRC32_TEST == 1821923098, "crc32(\"000DEADBEEF000\") did not evaluate to 1821923098");
        
        // Send a confirmation message
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: "OK".asComment(),
        });
    }
}
