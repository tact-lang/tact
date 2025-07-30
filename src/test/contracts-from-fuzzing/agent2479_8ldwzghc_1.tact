contract LargeFieldsContract {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Builder;
    g: Slice;
    h: String;
    i: Int;
    j: Bool;
    k: String;
    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = beginCell();
        self.g = emptyCell().asSlice();
        self.h = "another";
        self.i = 42;
        self.j = false;
        self.k = "end";
    }
}