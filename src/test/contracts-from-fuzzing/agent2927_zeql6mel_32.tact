contract SimpleOptionalPrimitives {
    one: Bool?;
    two: Int?;

    init() {
        self.one = null;
        self.two = 999;
    }
}