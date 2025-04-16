contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "s";
    g: Int? = null;
    h: Bool? = null;
    i: Address? = null;
    j: Cell? = null;
    k: Slice? = null;
    l: String? = null;
    
    init() {
        self.a = 5;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.g = 10;
        self.h = false;
        self.i = myAddress();
        self.l = "changed";
    }
}
