contract OptionalPrimitives {
    one: Int?;
    two: Bool?;

    init() {
        self.one = null;
        self.two = true;
    }
}