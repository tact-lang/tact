contract OptionalPrimitive {
    num: Int?;
    flag: Bool?;
    addr: Address?;
    data: Cell?;
    text: String?;

    init() {
        self.num = null;
        self.flag = null;
        self.addr = null;
        self.data = null;
        self.text = null;
    }
}