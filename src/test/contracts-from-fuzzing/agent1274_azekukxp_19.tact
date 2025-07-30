contract DefaultOptionalMix {
    a: Int = 123;
    b: Int?;
    c: Bool = true;
    d: String?;
    e: Address;

    init() {
        self.b = null;
        self.d = null;
        self.e = myAddress();
    }
}