contract ManyTypes {
    a: Int = -128;
    b: Int as uint4 = 7;
    c: Bool = false;
    d: Bool? = null;
    e: Address;
    f: String = "test";
    g: Cell;
    h: Slice;

    init() {
        self.a = 42;
        self.b = 8;
        self.c = true;
        self.d = true;
        self.e = myAddress();
        self.f = "hello";
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
    }
}