contract RecursionReturnFixed {
    fun countdown(n: Int): Int {
         if (n <= 0) { return 0; } else { return self.countdown(n - 1) + 1; }
    }
}
