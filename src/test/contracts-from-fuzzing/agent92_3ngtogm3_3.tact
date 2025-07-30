contract TestArbitraryText {
    // Test receiver for arbitrary text messages using a parameter
    receive(str: String) {
        // No operation
    }

    fun dummy() : Int {
        return 2;
    }
}
