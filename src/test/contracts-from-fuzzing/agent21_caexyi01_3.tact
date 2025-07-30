contract TestInvalidGetter {
    value: Int;

    init() {
        self.value = 10;
    }

    // This should error because getters must not modify state
    get fun getValue(): Int {
        self.value = 20;
        return self.value;
    }
}
