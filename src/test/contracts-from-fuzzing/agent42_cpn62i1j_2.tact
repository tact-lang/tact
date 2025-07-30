contract TestConst {
    receive() {
        // Using built-in compile-time functions and constants
        // ascii: Expected 14850721 (0xE29AA1, 3-byte encoding for ⚡)
        dump(ascii("⚡"));
        
        // crc32: Expected value for "000DEADBEEF000" (as per documentation, 1821923098)
        dump(crc32("000DEADBEEF000"));
        
        // ton: Expected: 1 Toncoin = 1000000000 nanoToncoin
        dump(ton("1"));
        
        // sha256: Compile-time computed sha256 for "abc"
        dump(sha256("abc"));

        // End execution
        return;
    }
}
