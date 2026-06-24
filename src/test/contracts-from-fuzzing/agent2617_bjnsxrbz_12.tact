contract MixedFields {
    a: Int;
    b: Bool = false;
    c: String;
    d: Cell;
    e: Slice;
    f: String?;
    g: Bool?;
    h: Int?;
    i: Address;
    j: Cell?;
    init() {
        self.a = 42;
        self.c = "hello";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = null;
        self.g = null;
        self.h = null;
        self.i = myAddress();
        self.j = null;
    }
}