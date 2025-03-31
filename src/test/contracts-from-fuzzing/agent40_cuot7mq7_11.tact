contract TestTernary {
    receive() {}
    
    fun abs(x: Int): Int {
        return (x >= 0) ? x : -x;
    }
    
    fun testAbs(): Int {
        return abs(-42);
    }
}
