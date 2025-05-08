contract OptionalMix {
    a: Int?;
    b: String;
    c: Bool?;
    d: Address;

    init() {
        self.a = null;
        self.b = "mix";
        self.c = null;
        self.d = myAddress();
    }
}