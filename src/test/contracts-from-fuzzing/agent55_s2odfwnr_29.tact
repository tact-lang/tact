contract MixedTypes {
    a: Int = 1;
    b: Bool = true;
    c: Int?;
    d: Bool?;
    e: String = "hi";
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;

    init() {
        self.g = myAddress();
        self.i = emptyCell();
        self.k = self.i.asSlice();
        self.c=null; self.d=null; self.f=null;
        self.h=null; self.j=null; self.l=null;
    }
}
