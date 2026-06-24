contract ManyTypes {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Address;
    f: String;
    g: Cell;
    h: Slice;
    i: Builder;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = myAddress();
        self.f = "test";
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = beginCell();
    }
}