contract ManyPrimitives {
    a: Bool;
    b: Int;
    c: Int?;
    d: String;
    e: Cell;
    f: Builder;
    g: Slice;
    h: Address;

    init() {
        self.a = true;
        self.b = 123;
        self.c = null;
        self.d = "test";
        self.e = emptyCell();
        self.f = beginCell();
        self.g = emptyCell().asSlice();
        self.h = myAddress();
    }
}