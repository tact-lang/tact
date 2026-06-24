contract TestContract {
    // Precisely 32 ASCII characters.
    x: Int = ascii("1234567890abcdefghijklmnopqrstuv");

    receive() {
        // no-op
    }
}
