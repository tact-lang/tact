contract TestNestedReturn {
    fun nestedReturn(x: Int): Int {
         if (x < 0) {
             { return -x; }
         } else {
             return x + 10;
         }
    }
}
