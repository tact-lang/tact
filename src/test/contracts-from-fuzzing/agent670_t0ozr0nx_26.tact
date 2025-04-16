contract BoolOptionalFields {
    a: Bool?;
    b: Bool?;

    init() {
        self.a = null;
        self.b = true;
    }
}