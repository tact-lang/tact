contract Test {
    // Test 7: Function returning an optional Int
    fun f(): Int? {
         if (true) {
            return null;
         }
         return 5;
    }

    // Test 8: Function with return inside nested blocks
    fun g(): Int {
         if (true) {
             {
                 if (false) {
                     return 10;
                 } else {
                     return 20;
                 }
             }
         }
         return 30;
    }

    receive () {}
}
