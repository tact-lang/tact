contract NoDefaults {
    value: Int;
    flag: Bool;

    init() {
        self.value = 10;
        self.flag = true;
    }
}