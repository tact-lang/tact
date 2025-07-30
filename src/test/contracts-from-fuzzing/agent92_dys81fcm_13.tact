contract ReturnInRepeat {
    fun f(n: Int): Int {
         repeat (n) {
             if (n == 5) {
                 return 42;
             }
         }
         return -1;
    }
}
