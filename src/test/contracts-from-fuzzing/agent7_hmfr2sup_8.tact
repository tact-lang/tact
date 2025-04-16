contract Test {
    // Test 8: Overlapping string receivers: one specific text and one for arbitrary string messages
    receive("hello") {
    }
    
    receive(msg: String) {
    }
    
    fun dummy() {}
}
