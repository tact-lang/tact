contract Test {
    fun conditionalReturn(x: Int): Int {
         if (x > 0) {
             return 1;
         } else {
             return 0;
         }
    }
}
