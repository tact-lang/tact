contract OptionalStringStorage {
    message: String?;

    init() {
        self.message = null;
    }
}