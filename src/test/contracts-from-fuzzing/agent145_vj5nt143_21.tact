contract OptionalInits {
    num: Int?;
    flag: Bool?;
    text: String?;

    init() {
        self.num = 10;
        self.flag = false;
        self.text = "non-null";
    }
}
