contract TestLoopReturn2 {
    fun loopReturn2(n: Int): Int {
         repeat (n) {
             if (n % 2 == 0) {
                 return n;
             }
         }
         return -1;
    }
    receive() {}
}

contract TestNestedBlockReturn {
    fun deepReturn(x: Int): Int {
         { 
             { 
                 { if (x > 100) { return x; } }
             }
         }
         return 0;
    }
    receive() {}
}
