contract OptionalConfusion {
    value: Int?;

    init() {
        self.value = null;
        self.value = 123;
    }
}