contract TestAsciiBoundary {
    // Exactly 32 ASCII characters
    // "0123456789ABCDEF0123456789ABCDEF" is 32 bytes long
    val: Int = ascii("0123456789ABCDEF0123456789ABCDEF");
    receive () {}
}
