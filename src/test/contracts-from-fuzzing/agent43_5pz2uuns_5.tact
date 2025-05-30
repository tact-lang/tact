contract Test {
    receive() {
        // Test a string literal with various escape sequences
        let s: String = "Line1\nLine2\rLine3\tLine4\vLine5\bLine6\fLine7\x22Line8\u0041Line9\u{1F602}";
        dump(s);
    }
}
