// Many persistent fields of diverse primitive types
contract DiverseFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Slice;
    i: Builder;
    j: Address;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = false;
        self.e = "x";
        self.f = null;
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = beginCell();
        self.j = myAddress();
    }
}