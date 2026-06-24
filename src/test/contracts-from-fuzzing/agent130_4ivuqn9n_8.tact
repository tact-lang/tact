contract Mix {
    i: Int = 5;
    b: Bool = true;
    s: String = "test";
    o: Int? = null;
    addr: Address;
    init() {
        self.addr = myAddress();
    }

    receive() {
        self.i = self.i + 1;
        self.b = !self.b;
        self.o = null;
        self.s = "done";
    }
}