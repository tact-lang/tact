contract OptionalBoolFields {
    a: Bool?;
    b: Bool?;

    init() {
        self.a = null;
        self.b = true;
    }
}