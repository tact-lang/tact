contract Sha256Test() {
    // Compile-time evaluation of sha256
    // Expected behavior: sha256("hello") is computed at compile time, yielding a constant Int value.
    const shaValue: Int = sha256("hello");

    // Function to retrieve the computed sha256 value
    fun getSha(): Int {
        return self.shaValue;
    }

    // Dummy receive to ensure the contract is fully compiled
    receive() {}
}
