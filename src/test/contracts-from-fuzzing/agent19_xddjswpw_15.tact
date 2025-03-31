contract Test {
    // According to docs, ascii() can handle up to 32 bytes.
    // Each "⚡" is 3 bytes (E2 9A A1). 8 copies => 24 bytes total, which should be valid.
    const eightLightning: Int = ascii("⚡⚡⚡⚡⚡⚡⚡⚡");
}
