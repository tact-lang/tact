contract MultitypeFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    
    init() {
        self.a = 1;
        self.b = true;
        self.c = "foo";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = self.e.asSlice();
    }
}
