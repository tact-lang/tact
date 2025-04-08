contract FieldOrder {
    a: Int as uint8;
    b: Int as int257;
    c: Int as coins;
    d: Bool;
    e: String;
    f: Address;
    init() {
        self.a = 3;
        self.b = -5;
        self.c = 1000;
        self.d = true;
        self.e = "order";
        self.f = myAddress();
    }
}
