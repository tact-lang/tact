contract TestNestedBlockReturn2 {
    fun nestedBlockReturn(x: Int): Int {
         if (x == 0) {
             { return 100; }
         }
         return 200;
    }
}
