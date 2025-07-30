contract OptionalMultiple {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;

    init() {
        self.a = 10;
        self.b = null;
        self.c = null;
        self.d = myAddress();
    }
}