contract TestGetter {
    value: Int;

    init() {
        self.value = 100;
    }

    // A getter function that simply returns the value without modifying state
    get fun getValue(): Int {
        return self.value;
    }
}
