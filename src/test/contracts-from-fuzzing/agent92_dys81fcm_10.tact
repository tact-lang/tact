contract ImplicitReturnPath {
    fun f(x: Int): Int {
         if (x > 10) { { return 100; } } else { { } }
         return 42;
    }
}
