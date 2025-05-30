contract OptionalMix {
    a: Int?;
    b: Bool;
    c: String?;
    d: Address;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = myAddress();
    }
}