contract TestOptionalReturn {
    fun test(x: Int): Int? {
         if (x > 5) {
             return x;
         } else {
             return null;
         }
    }
}
