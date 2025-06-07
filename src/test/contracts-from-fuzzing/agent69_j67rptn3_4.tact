contract Test {
    fun earlyReturn(x: Int): Int {
        if (x == 0) { 
            return 0; 
        }
        return x;
    }
}
