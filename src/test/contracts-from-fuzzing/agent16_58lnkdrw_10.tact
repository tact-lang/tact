contract TestAscii {
    // Test the compile-time ascii function on a valid ASCII string
    a: Int = ascii("AB");

    receive() {
        // Nothing to do
    }
}
