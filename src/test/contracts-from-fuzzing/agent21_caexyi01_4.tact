contract TestAugmentedInvalidGetter {
    value: Int;

    init() {
        self.value = 10;
    }

    // Attempt to use augmented assignment in getter
    get fun getValue(): Int {
        self.value += 1;
        return self.value;
    }
}
