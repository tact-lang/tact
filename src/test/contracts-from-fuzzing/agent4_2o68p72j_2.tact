contract TestAscii() {
    receive() {
        // Verify that ascii("⚡") is evaluated at compile time correctly
        // Expected: 14850721
        require(ascii("⚡") == 14850721, "ascii evaluation failed");

        // Minimal valid operation
        cashback(sender());
    }
}
