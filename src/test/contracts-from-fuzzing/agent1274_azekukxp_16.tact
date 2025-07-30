contract OptionalStringField {
    msg: String?;

    init() {
        self.msg = null;
    }
}