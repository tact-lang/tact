contract MultiReturn {
    fun f(x: Int): Int {
         { { if (x == 7) { return 777; } } }
         return x + 13;
    }
}
