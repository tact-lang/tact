contract Test {
    // 8 copies of 😀, each is 4 bytes => 32 bytes total
    // According to docs, ascii() allows up to 32 bytes, or up to 8 code points of 4 bytes each.

    const eightSmileys: Int = ascii("😀😀😀😀😀😀😀😀");
}
