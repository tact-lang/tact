contract TestRollback(counter: Int) {
    // This contract uses contract parameters to initialize a persistent state variable 'counter'
    // We'll try to modify it in a try block and check that the state is rolled back
    fun tryRoll() {
         let orig = self.counter;
         // Try to add 10 to counter and then throw an error to force rollback
         try {
             self.counter += 10;
             throw(42);
         } catch (e) {
             // After rollback, self.counter should remain unchanged
             dump(self.counter); // expect orig value
         }
    }

    receive() {
         self.tryRoll();
         cashback(sender());
    }
}
