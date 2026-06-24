contract ManyOptionals {
    flag: Bool?;
    number: Int?;
    text: String?;
    addr: Address?;

    init() {
        self.flag = null;
        self.number = null;
        self.text = null;
        self.addr = null;
    }
}