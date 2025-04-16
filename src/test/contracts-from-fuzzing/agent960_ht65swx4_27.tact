contract OptionalToplevel {
    num: Int?;
    txt: String?;
    flag: Bool?;
    init() {
        self.num = null;
        self.txt = null;
        self.flag = null;
    }
}