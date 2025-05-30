contract OptionalAndDefaults {
    count: Int = 100;
    flag: Bool;
    optStr: String?;

    init() {
        self.flag = false;
        self.optStr = null;
    }
}
