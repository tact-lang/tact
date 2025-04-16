contract TestNested {
    fun nestedReturn(n: Int): Int {
         {
             if (n > 0) {
                 return n;
             }
         }
         return -n;
    }
}
