contract ReturnTest {
    // Regular function with early return
    fun earlyReturn(): Int {
         if (true) {
             return 42;
         }
         return 0;
    }
    
    // Function with nested block return
    fun nestedBlockReturn(a: Int): Int {
         if (a > 0) {
             { return a * 2; }
         } else {
             return -a;
         }
    }
    
    // Function with a return inside a repeat loop
    fun loopReturn(): Int {
         repeat (10) {
             if (true) {
                 return 100;
             }
         }
         return -1;
    }
    
    // Getter with multiple return paths
    get fun testGetter(): Int {
         if (true) {
             return 50;
         }
         return 0;
    }
    
    // Receiver function where return is allowed only without a value
    receive () {
         return;
    }
}
