contract UnicodeEscapeTest {
    receive() {
        let unicodeShort = "Hello,\u26A1World!";
        let unicodeLong = "Hello,\u{1F600}World!";
    }
}