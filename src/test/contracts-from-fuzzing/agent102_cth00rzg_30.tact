contract OptionalInitPartial {
    a: Int?;
    b: Bool?;

    init() {
        self.a = 1;
        self.b = null;
    }
}