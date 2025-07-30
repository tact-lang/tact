contract TestReturnBehavior {
    fun earlyReturnInNestedBlock(a: Int): Int {
         if (a > 0) {
             { let b: Int = a * 2; if (b > 10) { return b; } }
         }
         return a;
    }

    fun multipleReturns(a: Int): Int {
         if (a == 0) { return 0; }
         if (a < 0) { return -1; }
         return 1;
    }

    fun optionalReturn(x: Int): Int? {
         if (x > 0) { return x; }
         return null;
    }

    get fun getTest(): Int {
         if (1 == 1) { return 100; }
         return 200;
    }

    receive () {
         return;
    }
}
