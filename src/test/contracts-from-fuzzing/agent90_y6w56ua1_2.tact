contract TestReturnB {
    fun test(x: Int): Int {
         if (x > 0) {
             return x;
         } else if (x == 0) {
             return 0;
         } else {
             { return -x; }
         }
    }
}
