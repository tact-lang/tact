contract OnlyOptionals {
    one: Int?;
    two: Bool?;
    three: String?;
    four: Address?;
    init() {
        self.one = null;
        self.two = null;
        self.three = null;
        self.four = null;
    }
}