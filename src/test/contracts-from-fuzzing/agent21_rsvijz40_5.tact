contract TestGetterModification {
    // Persistent state variable initialized to 0
    counter: Int = 0;

    // Getter function that attempts to modify the state variable
    // According to the documentation, getters are not supposed to modify state variables,
    // but in practice, the state modification doesn't persist after the TVM run.
    get fun getAndIncrement(): Int {
        self.counter = self.counter + 1;
        return self.counter;
    }

    // A normal function to read the counter for verification purposes
    fun readCounter(): Int {
        return self.counter;
    }

    receive() {}
}
