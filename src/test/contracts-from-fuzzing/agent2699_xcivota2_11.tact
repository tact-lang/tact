contract OptionalBoolInitialized {
    a: Bool?;
    b: Bool?;

    init() {
        self.a = true;
        self.b = null;
    }
}