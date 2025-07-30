contract NullablePrimitives {
    num: Int? = null;
    flag: Bool? = null;
    text: String? = null;
    addr: Address? = null;

    init() {
        self.num = null;
        self.flag = null;
        self.text = null;
        self.addr = null;
    }
}