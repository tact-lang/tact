extends fun toCoinsString2(self: Int): String {
    return self.toFloatString(9);
}

contract TestExtension {
    fun run() {
        dump(5.toCoinsString2()); // expected output: "0.000000005"
    }
    receive() {
        self.run();
    }
}
