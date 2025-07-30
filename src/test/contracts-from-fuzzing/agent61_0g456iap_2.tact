const ASCII_VAL: Int = ascii("⚡");

contract TestAscii() {
    get fun getAscii(): Int {
        return ASCII_VAL; // expected 14850721
    }
}
