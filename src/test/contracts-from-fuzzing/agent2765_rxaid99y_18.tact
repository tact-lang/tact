contract NoDefaults {
    num: Int;
    flag: Bool;
    text: String;

    init() {
        self.num = 3;
        self.flag = false;
        self.text = "abc";
    }
}