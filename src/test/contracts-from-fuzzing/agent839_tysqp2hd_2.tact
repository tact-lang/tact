contract MixedPrimitives {
    a: Int as uint8;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;

    init() {
        self.a = 42;
        self.b = true;
        self.c = myAddress();
        self.d = "Hello";
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}