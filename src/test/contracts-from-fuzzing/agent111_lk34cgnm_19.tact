contract TestNestedLoopReturn {
    fun test(x: Int): Int {
        repeat (3) {
            {
                if (x < 100) {
                    return x + 2;
                }
            }
        }
        return x;
    }
    
    receive () {}
}
