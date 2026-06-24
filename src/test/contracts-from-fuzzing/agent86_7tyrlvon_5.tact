contract MixedOptions {
    one: Int?;
    two: Bool;
    three: String?;
    four: Bool?;
    five: Int;

    init() {
        self.one = null;
        self.two = true;
        self.three = null;
        self.four = false;
        self.five = 123;
    }
}