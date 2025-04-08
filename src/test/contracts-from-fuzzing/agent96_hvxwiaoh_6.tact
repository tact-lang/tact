contract MixedPrimitives {
    a: Int;
    b: Bool = false;
    c: String = "hi";
    d: Address;
    e: Cell;
    f: Slice;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }

    receive() {}
}