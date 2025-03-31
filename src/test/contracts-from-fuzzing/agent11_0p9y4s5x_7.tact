contract MultiReturn {
    fun complexReturn(x: Int): Int {
         if (x < 0) { 
             return -x;
         }
         {
             if (x == 0) {
                 return 0;
             }
         }
         return x;
    }
}
