contract RegReturns {
    fun earlyReturn(x: Int): Int {
        if (x > 0) {
            { return x; }
        }
        return -x;
    }
    
    receive() {}
}
