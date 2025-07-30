contract ManyFieldTypes {
    i: Int = 1;
    b: Bool = true;
    addr: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    c: Cell; // leave uninitialized, init in constructor
    s: String = "hello";
    sl: Slice; // initialized in constructor
    bu: Builder; // initialized in constructor
    optI: Int? = null;
    optB: Bool? = null;

    init() {
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.bu = beginCell();
    }
}