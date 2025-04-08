contract ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;

    init() {
        self.a = 123;
        self.b = true;
        self.c = "abc";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = null;
        self.h = false;
        self.i = null;
    }
}