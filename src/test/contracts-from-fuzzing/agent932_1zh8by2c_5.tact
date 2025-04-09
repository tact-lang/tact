contract ManyBasicTypes {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "hello";
    g: Int? = null;
    h: Bool? = null;
    i: Cell? = null;

    init() {
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.g = 123;
        self.h = true;
        self.i = emptyCell();
    }
}
