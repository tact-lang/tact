contract NestedTry {
    receive() {
         // Initialize variable result with 0
         let result: Int = 0;
         try {
             try {
                 throw(200);
             } catch (x) {
                 // x is an Int exit code from inner try
                 result = x + 1; // should be 201
             }
         } catch (y) {
             // This catch will not be executed because the inner try was caught
             result = y + 2;
         }
         // Use result in a dummy way
         let _ = result;
         cashback(sender());
    }
}
