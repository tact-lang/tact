contract BigMix {
    a: Int = 1;
    b: Int? = null;
    c: String = "str";
    d: String?;
    e: Bool = false;
    f: Bool?;
    g: Address;
    h: Cell;

    init() {
        self.b = 42;
        self.d = null;
        self.f = null;
        self.g = myAddress();
        self.h = emptyCell();
    }
}