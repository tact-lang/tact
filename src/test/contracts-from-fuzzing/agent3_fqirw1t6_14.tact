contract TestGetter {
    state: Int;

    init() {
        self.state = 42;
    }

    // Getter function that modifies the contract's state at runtime (changes not persisted post-TVM execution)
    get fun changeState(): Int {
        self.state = self.state + 1;
        return self.state;
    }

    // Getter function that simply returns the current state
    get fun readState(): Int {
        return self.state;
    }
}
