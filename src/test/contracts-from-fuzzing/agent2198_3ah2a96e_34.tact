contract OptionalDefault {
    a: Int?;
    b: Bool = true;

    init() {
        self.a = null;
    }
}