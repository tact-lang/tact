contract TestAscii32 {
    // Test ascii() with a string of exactly 32 bytes (all ASCII characters) - should compile successfully
    a: Int = ascii("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"); // 32 'a's

    receive() {
        self.a;
    }
}
