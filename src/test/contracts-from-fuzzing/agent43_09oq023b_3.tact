contract TestNested {
    fun test(x: Int): Int {
        {
           if (x == 0) {
               return 42;
           }
        }
        return x;
    }
}
