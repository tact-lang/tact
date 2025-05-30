contract OptionalsWithDefaults {
    flag: Bool? = null;
    count: Int? = null;

    init() {
        self.flag = true;
        self.count = 777;
    }
}
