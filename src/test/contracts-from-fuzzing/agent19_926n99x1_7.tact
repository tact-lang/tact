contract Test4 {
    fun multi_ret(x: Int): Int {
         if (x < 0) {
             return -1;
         } else if (x == 0) {
             return 0;
         }
         return x;
    }
}
