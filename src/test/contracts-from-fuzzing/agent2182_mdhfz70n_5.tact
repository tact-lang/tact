contract InlineDefaults {
    count: Int = 5;
    flag: Bool = true;
    text: String = "hello";

    init() {
        self.count = 10;
        self.flag = false;
        self.text = "world";
    }
}