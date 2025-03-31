contract TestLoopEarlyReturn {
    fun test(x: Int) : Int {
        repeat (3) {
            if (x > 0) {
                return x;
            }
        }
        return -x;
    }
    
    receive () {}
}
