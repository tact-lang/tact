contract NullableString {
    message: String?;

    init() {
        self.message = null;
    }
}