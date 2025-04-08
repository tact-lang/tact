contract PartialInit {
    x: Int = 5;
    y: Int;
    flag: Bool;
    message: String;
    addr: Address;

    init() {
        self.y = 10;
        self.flag = true;
        self.message = "hi";
        self.addr = myAddress();
    }
}