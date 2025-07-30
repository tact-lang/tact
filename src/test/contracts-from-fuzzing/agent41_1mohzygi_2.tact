contract Test {
    // Test for specific text receiver: receive("hello")
    receive("hello") {
        // Dummy operation
        let a = 1 + 2;
    }

    // Include a getter to force compilation of the receiver
    get fun dummy(): Int {
        return 42;
    }
}
