contract TestCompileTimeAscii {
    receive() {
        // Test compile-time evaluation of ascii literal:
        // Expected output is an integer representation of the unicode character ⚡.
        dump(ascii("⚡"));
    }
}
