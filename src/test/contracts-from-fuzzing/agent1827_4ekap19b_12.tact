contract OptionalsWithDefaults {
    id: Int? = null;
    flag: Bool? = null;
    text: String? = null;

    init() {
        self.id = 42;
        self.flag = true;
        self.text = "hi";
    }
}