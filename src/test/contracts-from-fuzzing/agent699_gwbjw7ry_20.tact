contract OptPrims {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;

    init() {
        self.a = 10;
        self.b = false;
        self.c = "test";
        self.d = myAddress();
    }
}
