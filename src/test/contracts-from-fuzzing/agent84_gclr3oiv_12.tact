contract TestTernaryReturn {
    fun f(x: Int): Int {
        return (x > 3 ? x : 0);
    }
    
    receive() {}
}
