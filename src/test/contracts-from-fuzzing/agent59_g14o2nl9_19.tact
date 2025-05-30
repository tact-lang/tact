contract TestNestedReturn {
    fun test(x: Int): Int {
       if (x > 0) {
           {
              if (x == 1) {
                  return 100;
              }
           }
           return x;
       } else {
           return x - 1;
       }
    }
}
