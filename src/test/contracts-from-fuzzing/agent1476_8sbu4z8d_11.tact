contract OnlyOptionalFields {
    flag: Bool?;
    count: Int?;
    text: String?;

    init() {
        self.flag = null;
        self.count = null;
        self.text = null;
    }
}