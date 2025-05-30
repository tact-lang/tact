contract OnlyDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "hi";
    addr: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");

    init() {
        self.a = 10;
        self.b = true;
        self.s = "bye";
        self.addr = myAddress();
    }

    receive() {
        let _ = self.addr;
    }
}