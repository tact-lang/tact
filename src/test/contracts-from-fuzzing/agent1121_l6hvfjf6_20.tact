contract OptionalStringField {
    message: String?;

    init() {
        self.message = null;
    }
}