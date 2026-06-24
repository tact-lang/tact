contract MixedOptionDefaults {
    one: Int?;
    two: Int?;
    three: String? = null;
    four: Bool = true;

    init() {
        self.one = 1;
        self.two = null;
        self.three = "hi";
        self.four = false;
    }
}