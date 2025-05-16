contract TestContract {
    addr: Address;
    flag: Bool;
    comments: String;

    init() {
        self.addr = myAddress();
        self.flag = true;
        self.comments = "persistent";
    }

    receive() {}
}