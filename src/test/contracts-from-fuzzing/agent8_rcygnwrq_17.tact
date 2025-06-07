contract Test {
    receive() {
         // Test ascii() with a string literal of exactly 32 bytes
         // "12345678901234567890123456789012" is 32 characters long
         let hv: Int = ascii("12345678901234567890123456789012");
    }
}
