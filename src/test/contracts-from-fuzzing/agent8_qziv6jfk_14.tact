contract TestGetterModify {
    counter: Int = 0;

    receive() {}

    // Getter that modifies the state variable. According to the documentation, although getters are allowed to modify state, changes are not persisted.
    get fun modifyCounter(): Int {
        self.counter += 1;
        return self.counter;
    }
}
