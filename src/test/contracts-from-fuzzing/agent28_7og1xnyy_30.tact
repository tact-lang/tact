contract TestInvalidFloatString {
    receive() {
        // Test Int.toFloatString with an invalid 'digits' parameter (0), which is outside the allowed range (0 < digits < 78).
        // According to documentation, this should throw an exception with exit code 134 (Invalid argument).
        try {
            let s: String = (42).toFloatString(0);
            dump(s); // Should not reach here
        } catch (e) {
            dump(e); // Expect exit code 134
        }
    }
}
