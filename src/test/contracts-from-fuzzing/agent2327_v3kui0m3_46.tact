contract LargeInitAssign {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = myAddress();
        self.e = null;
        self.f = null;
    }
}
