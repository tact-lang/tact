contract OptionalMixed {
    a: Int?;
    b: Bool?;
    c: Address;
    d: String;
    e: Slice?;

    init() {
        self.a = null;
        self.b = true;
        self.c = myAddress();
        self.d = "hi";
        self.e = null;
    }
}