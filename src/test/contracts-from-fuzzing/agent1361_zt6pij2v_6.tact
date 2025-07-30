contract OptionalFields {
    num: Int?;
    flag: Bool?;
    addr: Address?;
    strVal: String?;
    init() {
        self.num = null;
        self.flag = true;
        self.addr = null;
        self.strVal = null;
    }
}
