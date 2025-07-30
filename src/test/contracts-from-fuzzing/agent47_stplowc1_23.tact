contract TestFloatStringInvalidLow {
    // This test uses an invalid parameter for toFloatString. According to docs, digits must be in the interval (0, 78), so 0 is invalid and should trigger an exception with exit code 134 (Invalid argument).
    receive() {
        let s: String = (42).toFloatString(0);
        s;
    }
}
