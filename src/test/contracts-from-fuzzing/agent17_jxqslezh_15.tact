contract TryCatchTest(counter: Int) {
    // In Tact, contract parameters are persistent state variables
    receive() {
        // The changes in the try block should be rolled back if an exception occurs
        try {
            self.counter += 100;
            throw(999);
        } catch (exitCode) {
            // This change should persist
            self.counter += 1;
        }
        cashback(sender());
    }
    
    get fun result(): Int {
        return self.counter;
    }
}
