contract OptionalInit {
    number: Int?;
    flag: Bool?;
    text: String?;

    init() {
        self.number = null;
        self.flag = null;
        self.text = null;
    }
}