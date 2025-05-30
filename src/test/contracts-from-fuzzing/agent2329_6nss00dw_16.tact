contract MultitypeState {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = myAddress();
        self.e = emptyCell().asSlice();
    }
}
