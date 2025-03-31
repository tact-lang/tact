contract TestGetterModification {
    state: Int;

    init() {
        self.state = 0;
    }

    // getter function attempting to modify contract state
    get fun wrongGetter(): Int {
        self.state = self.state + 1;
        return self.state;
    }
}
