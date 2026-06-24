contract OptionalPersist {
    count: Int?;
    flag: Bool?;
    addr: Address?;
    txt: String?;
    init() {
        self.count = null;
        self.flag = null;
        self.addr = null;
        self.txt = null;
    }
}