contract OptionalFields {
    num: Int?;
    flag: Bool?;
    txt: String?;

    init() {
        self.num = null;
        self.flag = null;
        self.txt = null;
    }
}