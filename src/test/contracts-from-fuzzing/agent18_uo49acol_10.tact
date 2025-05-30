extends fun toCoinsString2(self: Int): String {
    return self.toFloatString(9);
}

contract TestExtensionUsing() {
    fun test() {
        let s: String = 5.toCoinsString2();
        dump(s); // Expected output: "0.000000005"
    }

    receive() {
        self.test();
    }
}
