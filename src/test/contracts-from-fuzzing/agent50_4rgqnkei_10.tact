contract TryTest(x: Int) {
    // x is a persistent state variable
    
    // A function that increments x
    fun inc() {
         self.x = self.x + 1;
    }

    receive() {
         try {
              self.inc();
              throw(777);
         } catch (err) {
              // In theory, all changes made during the try block should be rolled back
              // Thus, self.x should remain as its original value
              dump(self.x); // expected output: 0 if x was initially 0
         }
         cashback(sender());
    }
}
