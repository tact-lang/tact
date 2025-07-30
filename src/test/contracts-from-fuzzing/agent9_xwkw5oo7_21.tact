contract TestTailRec2 {
    fun factorial(n: Int): Int {
         if (n <= 1) {
             return 1;
         }
         return n * self.factorial(n - 1);
    }
}
