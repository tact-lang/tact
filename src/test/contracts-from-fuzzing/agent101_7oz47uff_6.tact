contract TestReturnLoop {
    // Test21: Return inside a while loop block, with loop not executing
    fun testWhile(): Int {
         while (false) { return 1; }
         return 2;
    }

    // Test22: Return inside a repeat loop block, loop executes once
    fun testRepeat(): Int {
         repeat (1) {
             return 3;
         }
         return 0;
    }

    // Test23: Return from do...until loop block
    fun testDoUntil(): Int {
         let x: Int = 1;
         do {
             if (x == 1) {
                 return 4;
             }
         } until (false);
         return 0;
    }

    receive() {}
}
