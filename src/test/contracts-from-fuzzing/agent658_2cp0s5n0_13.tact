contract OptionalInPersistent {
    count: Int?;
    flag: Bool?;
    text: String?;
    someone: Address?;

    init() {
        self.count = null;
        self.flag = null;
        self.text = null;
        self.someone = null;
    }
}