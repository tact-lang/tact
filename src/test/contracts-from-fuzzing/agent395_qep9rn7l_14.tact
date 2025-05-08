contract MixedOptionalConcrete {
    a: Int = 1;
    b: String? = null;
    c: Address;
    d: Bool? = null;
    e: Cell;
    f: Int? = null;
    g: Bool = true;

    init() {
        self.c = myAddress();
        self.e = emptyCell();
        self.f = 7;
    }
}
