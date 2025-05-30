contract OptionalField {
    data: Int?;

    init() {
        self.data = 42;
    }

    receive() {}
}