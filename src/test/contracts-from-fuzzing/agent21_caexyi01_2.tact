contract TestGetter {
    value: Int;

    init() {
        self.value = 10;
    }

    // getter function that just returns the stored value
    get fun getValue(): Int {
        return self.value;
    }
}
