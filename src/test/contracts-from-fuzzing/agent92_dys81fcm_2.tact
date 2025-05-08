contract NestedReturn {
    fun f(x: Int): Int {
         { if (x > 10) { return 100; } }
         return x;
    }
}