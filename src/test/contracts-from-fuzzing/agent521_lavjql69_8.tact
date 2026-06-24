contract PrimitiveTypesContract {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = emptyCell();
        self.e = self.d.asSlice();
        self.f = myAddress();
    }
}