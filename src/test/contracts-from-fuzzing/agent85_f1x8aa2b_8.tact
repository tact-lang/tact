contract OptionalFieldNull {
    data: Int?;

    init() {
        self.data = null;
    }

    receive() {}
}