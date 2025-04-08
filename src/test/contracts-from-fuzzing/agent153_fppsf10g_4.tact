contract OptionalField {
    value: Int?;

    init() {
        self.value = null;
    }

    receive() {
        self.value = 123;
    }
}