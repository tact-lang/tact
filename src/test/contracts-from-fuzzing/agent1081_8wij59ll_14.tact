contract OptionalBool {
    f1: Bool?;
    f2: Bool?;

    init() {
        self.f1 = true;
        self.f2 = null;
    }
}