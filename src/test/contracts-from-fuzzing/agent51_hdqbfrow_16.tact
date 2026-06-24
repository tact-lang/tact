contract TestRepeatReturn {
    fun test(x: Int): Int {
         repeat (x) {
             if (x == 5) {
                 return 7;
             }
         }
         return 0;
    }
}
