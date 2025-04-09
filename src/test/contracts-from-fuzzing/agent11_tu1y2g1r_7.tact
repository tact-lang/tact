extends fun toCoinsString2(self: Int): String {
    return self.toFloatString(9);
}

contract TestExtensionExpressions {
    fun test() {
        // This should dump "0.000000005" (5 expressed as a 9-decimal fixed length float string)
        dump(5.toCoinsString2());
    }

    receive() {
        self.test();
    }
}
