contract TestText {
    // Test specific text comment receiver
    receive("hello") {
        // Handle message with specific comment 'hello'
    }

    fun dummy() : Int {
        return 1;
    }
}
