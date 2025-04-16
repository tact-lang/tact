contract Test1 {
    // receive function required
    receive() {}
    
    // Regular function with early return in if branch
    fun add(a: Int, b: Int): Int {
        if (a > 0) {
            return a + b;
        }
        return 0;
    }
}
