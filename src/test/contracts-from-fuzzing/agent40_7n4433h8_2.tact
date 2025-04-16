contract TestGetterModification {
    counter: Int;

    init() {
        self.counter = 20;
    }

    // Getter function that modifies the state variable
    get fun modifyCounter(): Int {
        self.counter += 5;
        return self.counter;
    }

    // Additional getter that only reads the counter
    get fun readCounter(): Int {
        return self.counter;
    }
}

// Some entry point if needed (this is purely illustrative, as getters are off-chain accessors)
