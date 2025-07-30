contract OnlyFields {
    a: Int;
    b: Bool;
    c: Slice;
    d: Address;
    e: String;

    init() {
        self.a = 1;
        self.b = false;
        self.c = emptyCell().asSlice();
        self.d = myAddress();
        self.e = "hello";
    }
}