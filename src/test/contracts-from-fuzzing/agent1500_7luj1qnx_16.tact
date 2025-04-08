contract NoDefaults {
    a: Int;
    b: Bool;
    c: Slice;
    d: Address;

    init() {
        self.a = 3;
        self.b = false;
        self.c = emptyCell().asSlice();
        self.d = myAddress();
    }
}