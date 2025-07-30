contract TestReturn {
    fun compute(x: Int): Int {
       if (x > 10) {
           return x;
       }
       return 0;
    }
}
