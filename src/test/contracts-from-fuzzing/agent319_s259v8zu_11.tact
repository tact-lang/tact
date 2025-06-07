contract TestContract {
    a: Int = 1;
    b: Int? = null;
    c: Bool = true;
    d: Bool? = false;
    e: Address;
    f: Address? = null;
    g: Cell;
    h: Cell? = null;

    init() {
        self.e = myAddress();
        self.f = null;
        self.g = emptyCell();
        self.h = null;
    }
}