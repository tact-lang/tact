contract EmptyFieldsTest {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: String?;

    init() {
        self.a = 0;
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "";
        self.g = null;
        self.h = null;
    }
}