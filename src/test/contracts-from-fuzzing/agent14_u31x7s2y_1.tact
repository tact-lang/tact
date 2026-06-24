contract Test {
    fun early_return(a: Int): Int {
         if (a > 0) {
             return a;
         }
         return -a;
    }
}
