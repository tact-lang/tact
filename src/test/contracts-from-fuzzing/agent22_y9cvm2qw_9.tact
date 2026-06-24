contract TestReturnComplex2 {

    fun complexReturns(x: Int): Int {
       if (x > 0) {
           if (x % 2 == 0) { 
               return x;
           } else {
                if (x == 3) { 
                    return 999;
                } else {
                    return 42;
                }
           }
       }
       return -1;
    }

    fun conditionalReturnEdge(a: Int, b: Int): Int {
        if (a > b) { { return a; } } else if (a == b) { return a + b; } else { return b; }
    }

}
