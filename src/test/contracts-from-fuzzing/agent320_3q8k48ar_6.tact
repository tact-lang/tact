contract OptionalPrimitives {
    amount: Int?;
    flag: Bool?;
    text: String?;
    hash: Cell?;
    addr: Address?;
    init() {
        self.amount = null;
        self.flag = null;
        self.text = null;
        self.hash = null;
        self.addr = null;
    }
}