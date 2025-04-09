contract Test {
    // Test basic empty message receiver
    receive() {
        // performing no operations
    }

    // adding a dummy function to ensure full compilation
    fun dummy() : Int {
        return 0;
    }
}