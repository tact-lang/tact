extends fun toCoinsString2(self: Int): String {
    return self.toFloatString(9);
}

contract TestExtension {
    fun test() {
        let coinStr = 5.toCoinsString2();
        dump(coinStr); // expected output: "0.000000005"
    }

    receive() {
        self.test();
    }
}
