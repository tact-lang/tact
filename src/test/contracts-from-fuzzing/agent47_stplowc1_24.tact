contract TestFloatStringInvalidHigh {
    // According to docs, toFloatString requires digits in (0, 78).
    // Using 78 should be invalid and trigger an exception at runtime (exit code 134: Invalid argument),
    // so we test that behavior by invoking toFloatString with 78.
    receive() {
        let s: String = (42).toFloatString(78);
        s;
    }
}
