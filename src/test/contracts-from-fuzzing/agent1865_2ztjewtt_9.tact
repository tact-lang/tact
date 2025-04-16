contract ZeroInit {
    n: Int;
    b: Bool;
    s: String;
    addr: Address;

    init() {
        self.n = 0;
        self.b = false;
        self.s = "";
        self.addr = myAddress();
    }
}