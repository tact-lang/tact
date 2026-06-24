contract OptionalReturn {
    fun f(x: Int): Int? {
         if (x == 0) { return null; } else { return x; }
    }
}
