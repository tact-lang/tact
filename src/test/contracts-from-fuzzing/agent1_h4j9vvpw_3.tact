contract MaxValidUnicodeTest {
    receive() {
        let maxValidUnicode = "\u{10FFFF}";
    }
}