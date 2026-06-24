contract TestCT {
    // Testing built-in compile-time functions
    // ton("1") should evaluate to 1000000000
    const TON_ONE: Int = ton("1");
    
    // ascii("⚡") should evaluate to 14850721 (as per docs)
    const ASCII_LIGHTNING: Int = ascii("⚡");

    // crc32("deadbeef") computed compile-time constant
    const CRC32_DEADBEEF: Int = crc32("deadbeef");

    // sha256("Hello, Tact!") computed at compile-time
    const SHA256_HELLO: Int = sha256("Hello, Tact!");

    get fun getTon(): Int {
        return self.TON_ONE; // expecting 1000000000
    }

    get fun getAscii(): Int {
        return self.ASCII_LIGHTNING; // expecting 14850721
    }

    get fun getCRC32(): Int {
        return self.CRC32_DEADBEEF; // value computed at compile time
    }

    get fun getSHA256(): Int {
        return self.SHA256_HELLO; // value computed at compile time
    }

    // Dummy receive function to trigger full compilation
    receive() {
        cashback(sender());
    }
}
