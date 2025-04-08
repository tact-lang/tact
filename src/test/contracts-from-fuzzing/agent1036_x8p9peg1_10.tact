contract OptionalVars {
    flag: Bool?;
    number: Int?;
    text: String?;

    init() {
        self.flag = true;
        self.number = 55;
        self.text = "optional";
    }
}