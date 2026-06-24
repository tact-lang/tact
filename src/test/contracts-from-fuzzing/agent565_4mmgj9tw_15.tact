contract MixManyFields {
    a: Int = 0;
    b: Bool = true;
    c: String = "asd";
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: String?;
    i: Bool?;
    j: Address?;

    init() {
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = null;
        self.h = null;
        self.i = true;
        self.j = null;
    }
}