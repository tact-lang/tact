contract TestContract {
    flag: Bool;
    score: Int as uint32;
    addr: Address;
    note: String;

    init() {
        self.flag = true;
        self.score = 77;
        self.addr = myAddress();
        self.note = "test";
    }
}