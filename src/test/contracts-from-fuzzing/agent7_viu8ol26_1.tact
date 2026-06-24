contract TestContract {
    value: Int;
    flag: Bool;
    text: String;
    addr: Address;

    init() {
        self.value = 42;
        self.flag = true;
        self.text = "test";
        self.addr = myAddress();
    }
}
