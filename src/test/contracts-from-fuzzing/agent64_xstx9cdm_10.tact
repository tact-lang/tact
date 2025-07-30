extends fun toCoinsString2(self: Int): String {
    return self.toFloatString(9);
}

contract TestExtension() {
    fun run() {
        // Use the extension function to convert an Int to a coin string
        let s: String = 5.toCoinsString2();
        dump(s); // Expected output: "0.000000005"
    }
    
    receive() {
        self.run();
        cashback(sender());
    }
}

// Dummy contract to ensure TestExtension is used
contract DummyExtension() {}