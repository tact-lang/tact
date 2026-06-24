extends fun toCoinsString3(self: Int): String {
    return self.toFloatString(9);
}

contract TestExtension() {
    fun test() {
        // Expecting 5 to be represented as a float with 9 decimal places: "0.000000005"
        let s: String = 5.toCoinsString3();
        dump(s);
    }
    receive() { self.test(); }
}
