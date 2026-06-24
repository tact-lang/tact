const CONST_ASCII: Int = ascii("⚡");

contract TestAscii() {
    receive() {
        // expected value: 14850721 (0xE29AA1)
        dump(CONST_ASCII);
    }
}
