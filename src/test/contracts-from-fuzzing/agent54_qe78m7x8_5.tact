extends fun toCoinsString2(self: Int): String {
    return self.toFloatString(9);
}

contract TestExtension {
    receive() {
        let result: String = 5.toCoinsString2();
        require(result == "0.000000005", "Extension function evaluation failed");
        cashback(sender());
    }
}
