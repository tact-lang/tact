contract FieldTypes {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: String;
    f: Address;
    g: Int?;
    h: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = emptyCell().asSlice();
        self.e = "abc";
        self.f = myAddress();
        self.g = null;
        self.h = null;
    }
}