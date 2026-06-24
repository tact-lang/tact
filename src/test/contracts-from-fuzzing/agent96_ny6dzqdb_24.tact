// test large contract with mixed types and many fields
contract BigMix {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;

    init() {
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
    }
}