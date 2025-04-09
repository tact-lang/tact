contract AllPrimitiveTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;

    init() {
        self.a = 123;
        self.b = true;
        self.c = "abc";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = self.e.asSlice();
    }
}
