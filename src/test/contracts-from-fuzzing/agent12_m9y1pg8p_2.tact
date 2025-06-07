contract TestGetterModify {
    value: Int;

    init() {
        self.value = 0;
    }

    // Getter function that incorrectly attempts to modify state
    get fun modifyGetter(): Int {
        self.value = 42; // This should be an error as per documentation
        return self.value;
    }
}
