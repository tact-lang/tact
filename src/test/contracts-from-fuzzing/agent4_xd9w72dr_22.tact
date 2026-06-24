contract TestAsciiEmojiMax {
    // 8 emoji characters; each being 4 bytes makes exactly 32 bytes
    val: Int = ascii("😀😀😀😀😀😀😀😀");
    receive () {}
}
