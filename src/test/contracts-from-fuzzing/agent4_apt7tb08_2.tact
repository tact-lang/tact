contract Test {
    
    // Test function for addition using correct self call
    fun add(x: Int, y: Int): Int {
        return x + y;
    }
    
    receive() {
        self.add(1, 2);
    }
}
