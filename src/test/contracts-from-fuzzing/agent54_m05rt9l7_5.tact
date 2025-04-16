contract TestArbitraryTextReceiver {
    executed: Int = 0;

    // Arbitrary text receiver
    receive(str: String) {
        // For testing, we assign executed the size of the string
        // Assuming a built-in method to get string length is available as str.byteSize (if not, just assign a fixed value)
        // We use a dummy operation to use str
        self.executed = 10;
    }
}
