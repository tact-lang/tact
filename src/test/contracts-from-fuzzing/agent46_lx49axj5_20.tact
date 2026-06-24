contract TestExactAsciiEdge {
    receive() {
        // This test uses a string with exactly 8 Unicode characters,
        // where each character is represented as 4 bytes in UTF-8 (for example, the emoji "😀" U+1F600).
        // 8 * 4 = 32 bytes, which is the maximum that ascii() supports.
        let a: Int = ascii("😀😀😀😀😀😀😀😀");
        a;
    }
}
