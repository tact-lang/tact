// Similar, with default nulls or literals only, avoiding myAddress() and emptyCell()
contract TestContract {
    a: Int = 0;
    b: Bool = false;
    c: Address; // no default
    d: Cell;    // no default
    e: String = "hello";
    f: Int? = null;
    g: Bool? = null;
    h: Address? = null;
    i: Cell? = null;
    j: String? = null;

    init() {
        self.a = 42;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = "world";
        self.f = 1;
        self.g = true;
        self.h = null;
        self.i = null;
        self.j = "!";
    }
}
