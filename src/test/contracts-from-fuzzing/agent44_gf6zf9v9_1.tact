contract StateGetterTest {
    counter: Int = 0;

    // Getter function that attempts to modify the state variable 'counter'
    get fun inc() : Int {
        self.counter = self.counter + 1;
        return self.counter;
    }

    // Regular function to read the value
    fun read() : Int {
        return self.counter;
    }
}

// The following code is only to test the getter behavior. In practice, calling the getter might be done externally.
// Here, we trigger the getter by compiling the contract (the runtime behavior might be simulated during off-chain calls).
