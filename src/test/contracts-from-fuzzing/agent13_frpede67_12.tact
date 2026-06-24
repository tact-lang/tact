// test removing all asm-based static defaults, these must be set only in init()
contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Address? = null;
    e: Cell? = null;
    f: Slice? = null;
    g: Int? = null;
    h: Bool? = null;
    i: String? = null;
    j: Address? = null;
    k: Cell? = null;
    l: Slice? = null;

    init() {
        self.a = 2;
        self.b = false;
        self.c = "hello";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = 3;
        self.h = true;
        self.i = "world";
        self.j = myAddress();
        self.k = emptyCell();
        self.l = emptyCell().asSlice();
    }
}