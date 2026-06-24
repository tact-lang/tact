contract TestAsciiExact {
    // 26 lowercase letters + 6 uppercase letters = 32 bytes
    a: Int = ascii("abcdefghijklmnopqrstuvwxyzABCDEF");

    receive() {
    }
}
