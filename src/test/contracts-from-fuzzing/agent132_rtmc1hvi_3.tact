contract Test3 {
    fun f(x: Int): Int {
        if (true) {
            { 
                return x + 1;
            }
        }
        return x;
    }
}
