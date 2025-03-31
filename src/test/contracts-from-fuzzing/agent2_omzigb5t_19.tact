contract TestAscii8 {
    // Eight 4-byte Unicode code points (emojis are 4 bytes)
    a: Int = ascii("💩💩💩💩💩💩💩💩");
    receive() {}
}
