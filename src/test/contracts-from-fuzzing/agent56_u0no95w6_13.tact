contract OptionalBoolAndInt {
    flag: Bool?;
    count: Int?;

    init() {
        self.flag = true;
        self.count = null;
    }
}