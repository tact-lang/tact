contract TestNestedReturn2 {
    fun test(x: Int) : Int {
         if (x > 10) {
             { return x - 10; }
         }
         return x + 10;
    }
}
