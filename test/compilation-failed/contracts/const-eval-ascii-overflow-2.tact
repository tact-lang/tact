contract AsciiOverflow {
    get fun getAscii_fail(): Int {
        return ascii("⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡");
    }
}