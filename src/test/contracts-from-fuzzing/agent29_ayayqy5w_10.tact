contract Test {
    receive() {
        // Test a string literal with multiple, mixed valid escape sequences
        // Expected to translate the escapes as follows:
        //   \n -> newline, \t -> tab, \x20 -> space, \u0041 -> 'A'
        let s: String = "Mixed escapes: \n \t \x20 \u0041";
    }
}
