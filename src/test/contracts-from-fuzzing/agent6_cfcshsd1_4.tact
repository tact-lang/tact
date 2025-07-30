contract Goo {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Getter function that attempts to modify a state variable
    // According to documentation, getters should not modify state,
    // but in practice, runtime modifications are possible but not persistent.
    get fun rewrite(): Int {
        self.counter = self.counter + 1;  // attempt to modify state
        return self.counter;
    }
}
