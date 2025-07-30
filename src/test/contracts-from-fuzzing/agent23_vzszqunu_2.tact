contract TestConsts() {
    // Function to test compile-time evaluation of built-in functions
    fun run() {
         // ascii("⚡") should produce 14850721
         dump(ascii("⚡"));
         // ton("1") should produce 1000000000 (1 Toncoin = 10^9 nanoToncoins)
         dump(ton("1"));
         // crc32("000DEADBEEF000") should produce 1821923098
         dump(crc32("000DEADBEEF000"));
    }

    // Call run() when receiving any message
    receive() {
         self.run();
    }
}
