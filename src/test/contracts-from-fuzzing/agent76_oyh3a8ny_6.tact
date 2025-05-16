contract TestEscapedCarriageReturn {
    receive() {
        // Test string literal with escaped carriage return character
        let s: String = "Line1\rLine2";
    }
}
