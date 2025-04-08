contract OptionalRoot {
    num: Int?;
    flag: Bool?;
    addr: Address?;
    s: String?;

    init() {
        self.num = null;
        self.flag = true;
        self.addr = null;
        self.s = "abc";
    }
}