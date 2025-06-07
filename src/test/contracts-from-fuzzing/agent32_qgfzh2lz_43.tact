contract OptionalFalse {
    x: Bool?;
    init() {
        self.x = false;
        self.x = null;
    }
}
