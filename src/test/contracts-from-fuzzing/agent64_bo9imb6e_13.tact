contract TestGetterMutation {
    counter: Int = 0;

    receive() {}

    // Getter that modifies state (side-effect not persisted)
    get fun getIncrement(): Int {
        self.counter += 1;
        return self.counter;
    }
}
