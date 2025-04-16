contract TestNullByte {
    receive() {
        // Test a string literal containing a null byte using valid hex escape \x00
        let s: String = "Null byte: \x00 inside";
    }
}
