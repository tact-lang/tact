contract TestChainFunctionCall {
    fun increment(x: Int): Int { return x + 1; }

    receive() {
         dump(self.increment(self.increment(5)));
         // Expected output: 7
    }
}
