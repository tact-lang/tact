contract TestOptionalReturn {
    fun maybeReturn(x: Int): Int? {
         if (x > 0) {
             return x;
         }
         return null;
    }
    
    receive () {}
}
