contract TryCatchTest {
    // Persistent state variable with initial value 10
    counter: Int = 10;
    
    receive() {
        // Execute a try block that modifies state
        try {
            self.counter += 5; // Update counter from 10 to 15
            throw(777);        // Force an error with exit code 777
        } catch (exitCode) {
            // The state change in the try block should be rolled back,
            // so counter should remain 10
            dump(self.counter);  // Expected to dump 10
        }
        
        // Forward the remaining value back to the sender
        cashback(sender());
    }
}
