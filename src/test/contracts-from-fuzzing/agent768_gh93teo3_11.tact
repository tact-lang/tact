contract OptFields {
    count: Int?;
    flag: Bool?;
    text: String?;

    init() {
        self.count = null;
        self.flag = true;
        self.text = "hello";
    }
}