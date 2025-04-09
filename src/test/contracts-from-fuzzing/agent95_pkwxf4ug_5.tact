contract TestEscapes2 {
    receive() {
        // Test string literal with tab, carriage return, and backslash escape sequences
        let s: String = "Tab\tReturn\rBackslash\\";
        dump(s.asSlice());
    }
}
