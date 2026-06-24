contract OptionalFieldOrder {
    first: Int?;
    second: Int;
    third: Int?;
    fourth: Int;

    init() {
        self.first = null;
        self.second = 2;
        self.third = null;
        self.fourth = 4;
    }
}