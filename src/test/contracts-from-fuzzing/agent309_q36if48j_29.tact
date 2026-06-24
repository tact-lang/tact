contract OptionalsWithDefaults {
    a: Int?;
    b: Int = 5;

    init() {
        self.a = null;
    }
}