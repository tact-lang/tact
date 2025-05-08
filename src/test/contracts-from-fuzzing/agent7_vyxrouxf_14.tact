contract TestAsciiEmoji8 {
    // 8 four-byte emoji (😀) => total 32 bytes, exactly the limit
    value: Int = ascii("😀😀😀😀😀😀😀😀");

    receive() {}
}
