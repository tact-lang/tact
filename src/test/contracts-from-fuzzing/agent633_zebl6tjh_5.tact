contract ManyFields {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Bool = true;
    e: Bool = false;
    f: Address;
    g: Cell;
    h: Slice;
    i: String = "test";

    init() {
        self.f = myAddress();
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
    }
}