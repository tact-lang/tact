contract OptionalAndNormal {
    a: Int = 1;
    b: Int?;
    c: Bool = true;
    d: Bool?;
    s: String?;
    addr: Address;

    init() {
        self.b = null;
        self.d = true;
        self.s = "string";
        self.addr = myAddress();
    }

    receive() {
        let _ = self.a + (self.b != null ? self.b!! : 0);
    }
}