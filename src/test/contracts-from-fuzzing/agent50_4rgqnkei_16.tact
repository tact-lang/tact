contract TestNestedTry(x: Int) {
    // x is a persistent state variable provided as a contract parameter
    fun test() {
         let orig = self.x;
         // Outer try block
         try {
             // Inner try block
             try {
                 self.x += 5;  // attempt to add 5
                 throw(100);    // force error
             } catch (innerErr) {
                 dump(innerErr); // should dump 100
             }
             // After inner try-catch, the changes from inner try block should have been rolled back.
             // So, self.x should equal orig.
             throwUnless(0, self.x == orig);
             // Now, modify x successfully
             self.x += 10;
             dump(self.x); // expect orig + 10
         } catch (outerErr) {
             dump(9999); // This should not happen
         }
    }
    
    receive() {
         self.test();
         cashback(sender());
    }
}
