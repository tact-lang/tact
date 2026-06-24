contract NoDefaults {
    val: Int;
    flag: Bool;
    text: String;

    init() {
        self.val = 123;
        self.flag = false;
        self.text = "hello";
    }
}