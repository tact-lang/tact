contract OptionalDefaults {
    n: Int?;
    flag: Bool?;

    init() {
        self.n = null;
        self.flag = null;
    }
}