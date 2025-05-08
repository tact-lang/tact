contract MixedTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Int?;
    h: Bool?;
    i: String;
    j: String?;

    init() {
        self.a = 10;
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = null;
        self.h = null;
        self.i = "hello";
        self.j = null;
    }
}