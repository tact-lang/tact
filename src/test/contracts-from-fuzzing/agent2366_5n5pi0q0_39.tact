contract NestedOptMix {
    a: Int?;
    b: Bool;
    c: String?;
    d: Address;
    e: Slice?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = myAddress();
        self.e = null;
    }
}