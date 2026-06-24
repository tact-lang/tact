contract TestAscii32 {
    // 26 + 6 = 32 bytes exactly
    a: Int = ascii("abcdefghijklmnopqrstuvwxyzABCDEF");

    receive() {}
}
