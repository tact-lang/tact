contract Defaults {
    one: Int = 1;
    two: String = "two";
    three: Bool = true;
    four: Int?;
    five: String?;

    init() {
        self.four = null;
        self.five = "hmmm";
    }
}