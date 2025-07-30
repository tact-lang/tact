contract LoopReturn {
    fun test(x: Int): Int {
         repeat (10) {
              if (x == 5) { return 5; }
         }
         return 0;
    }
}
