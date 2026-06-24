contract TestContract {
    a: Int = 1;
    b: Bool;
    c: String = "x";
    d: Cell;
    e: Slice;
    f: Address;
    g: Int? = null;
    h: Bool?;
    i: String = "";
    j: Int = -1;
    k: Bool = false;
    l: Address;
    m: Int;
    n: String = "hi";
    o: Bool;

    init() {
        self.b = true;
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.h = null;
        self.l = myAddress();
        self.m = 42;
        self.o = true;
    }
}