contract NullByDefault {
    one: Int?;
    two: Int?;
    three: Int?;

    init() {
        self.one = null;
        self.two = null;
        self.three = null;
    }
}