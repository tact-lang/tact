contract TestRecInline {
    // Inline recursive function: returns the number of recursions
    inline fun rec(x: Int): Int {
         if (x == 0) {
             return 0;
         } else {
             return self.rec(x - 1) + 1;
         }
    }

    fun test(): Int {
         return self.rec(3);
    }

    receive() {}
}
