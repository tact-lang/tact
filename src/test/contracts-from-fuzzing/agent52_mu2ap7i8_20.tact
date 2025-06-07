contract TestGetterSideEffects {
    v: Int = 10;

    receive() {}

    // Getter that modifies state variable, note that changes are not persisted
    get fun getAndModify(): Int {
        self.v += 1;
        return self.v;
    }
}
