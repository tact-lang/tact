contract TestTry {
    receive() {}
    
    fun testTry(): Int {
        try {
            return 1;
        } catch (err) {
            return 2;
        }
    }
}
