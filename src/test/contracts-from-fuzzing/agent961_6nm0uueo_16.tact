contract ManyPersistentFieldsContract {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: Int?;
    i: Bool?;
    j: String?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "test";
        self.d = emptyCell();
        self.e = self.d.asSlice();
        self.f = beginCell();
        self.g = myAddress();
        self.h = null;
        self.i = true;
        self.j = null;
    }
}