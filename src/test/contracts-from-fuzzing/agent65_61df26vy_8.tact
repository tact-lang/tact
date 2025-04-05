extends fun toCoinsString2(self: Int): String {
    return self.toFloatString(9);
}

contract TestExtension {
    fun test() {
        // Calling the extension function which converts integer to a coins string with 9 decimals
        let s: String = 5.toCoinsString2();
        dump(s); // Expected: "0.000000005"
    }
    receive() { self.test(); }
}
