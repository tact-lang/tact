contract TestContract {
    num: Int;
    flag: Bool;
    addr: Address;
    text: String;

    init() {
        self.num = 1;
        self.flag = true;
        self.addr = myAddress();
        self.text = "init";
    }

    receive() {
        self.num += 1;
        self.flag = !self.flag;
    }
}