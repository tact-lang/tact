contract TestContract {
    x: Int;
    b: Bool;
    s: String;
    addr: Address;

    init() {
        self.x = 0;
        self.b = true;
        self.s = "abc";
        self.addr = myAddress();
    }
}