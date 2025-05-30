// Many optionals in contract persistent fields
contract ManyOpts {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    s: String?;
    addr: Address?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.s = "abc";
        self.addr = null;
    }
}