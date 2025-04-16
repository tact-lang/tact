contract ReorderedFields {
    addr: Address;
    flag: Bool;
    text: String;
    opt1: Int?;
    num: Int;
    opt2: String?;

    init() {
        self.addr = myAddress();
        self.flag = true;
        self.text = "order";
        self.opt1 = null;
        self.num = 42;
        self.opt2 = null;
    }
}