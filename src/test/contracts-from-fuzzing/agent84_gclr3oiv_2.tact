contract Test2 {
    fun f(a: Int): Int {
         if (a > 0) {
            return a;
         } else {
            return -a;
         }
    }
    
    receive() {}
}
