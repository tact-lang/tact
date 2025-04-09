contract ContractWithManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Bool?;
    f: Int?;
    g: String?;
    h: Address?;
    i: Cell;
    j: Slice;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = myAddress();
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = null;
        self.i = emptyCell();
        self.j = emptyCell().asSlice();
    }
}