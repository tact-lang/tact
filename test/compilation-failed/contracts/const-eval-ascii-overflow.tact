contract AsciiOverflow {
    get fun getAscii_fail(): Int {
        return ascii("000000000000000000000000000000000");
    }
}