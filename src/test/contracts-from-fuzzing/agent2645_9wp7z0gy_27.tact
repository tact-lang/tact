contract OptionalBool {
    b: Bool?;

    init() {
        self.b = null;
        self.b = true;
    }
}
