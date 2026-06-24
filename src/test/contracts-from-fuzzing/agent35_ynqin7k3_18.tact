contract InitOnlyDefaults {
    number: Int;
    flag: Bool;
    text: String;

    init() {
        self.number = 5;
        self.flag = true;
        self.text = "abc";
    }
}