contract TestMultipleReturns {
    fun multiReturn(x: Int): Int {
         if (x < 0) { return -x; }
         { if (x == 0) { return 0; } }
         repeat (3) {
             if (x == 42) { return 42; }
         }
         return x;
    }
    
    receive() {}
}
