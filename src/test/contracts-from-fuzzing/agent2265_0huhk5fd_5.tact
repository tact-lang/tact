contract ManyOptionals {
    one: Int?;
    two: Bool?;
    three: Address?;
    four: Cell?;
    five: Slice?;
    six: String?;

    init() {
        self.one = null;
        self.two = null;
        self.three = null;
        self.four = null;
        self.five = null;
        self.six = null;
    }
}