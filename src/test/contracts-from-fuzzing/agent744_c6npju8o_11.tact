contract MixedPrimitives {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "hello";

    init() {
        self.a = 42;
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "world";
    }
}