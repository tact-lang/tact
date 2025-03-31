contract Test {
    receive() {
        let s1: String = "Line\nSecond";
        let s2: String = "Quote: \"";
        let s3: String = "Hex: \x41"; // Should produce 'Hex: A'
        let s4: String = "Unicode: \u{1F600}"; // 😀
        let s5: String = "C:\\path\\to\\file";
        let dummy = s1;
    }
}
