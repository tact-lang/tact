extends fun toCoinsString2(self: Int): String {
    return self.toFloatString(9);
}

contract TestExtension {
    fun test() {
        let res: String = 5.toCoinsString2();
        dump(res); // Expected output: "0.000000005"
    }
    receive() { self.test(); }
}
