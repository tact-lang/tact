contract TestWhileReturn {
    fun whileReturn(n: Int): Int {
         let i: Int = 0;
         while (i < n) {
             if (i == 3) {
                 return i;
             }
             i = i + 1;
         }
         return 0;
    }
}
