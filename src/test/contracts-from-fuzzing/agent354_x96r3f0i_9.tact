contract MixedTypesFields {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    addr: Address;

    init() {
        self.i = 42;
        self.b = true;
        self.s = "hi";
        self.c = emptyCell();
        self.addr = myAddress();
    }
}
