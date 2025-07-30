contract TestOps {
    receive() {}
    
    fun test(): Int {
        return 1 + 2 * 3; // Expect 1 + (2 * 3) = 7
    }
}
