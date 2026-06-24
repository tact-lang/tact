// Test 1: Getter state modification

contract GetterMod {
    // Persistent state variable declared using contract field syntax
    x: Int = 5;

    // Initialization function
    init() {
        self.x = 5;
    }

    // Getter function that modifies state; according to docs it should only read but actually modification is allowed at runtime (not persistent)
    get fun inc(): Int {
        self.x = self.x + 1;
        return self.x;
    }

    // Dummy receiver to allow deployment
    receive() { }
}

// Note: We compile the contract; actual runtime results might show that the modification doesn't persist after the TVM run
