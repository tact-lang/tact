contract Test2 {
    fun nested_ret(x: Int): Int {
         if (x > 0) {
             {
                 { return x; }
             }
         }
         return 0;
    }
}
