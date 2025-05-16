contract Primitives {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    str: String;
    o1: Int?;
    o2: String?;

    init() {
        self.i = 42;
        self.b = true;
        self.a = myAddress();
        self.c = emptyCell();
        self.s = self.c.asSlice();
        self.str = "string";
        self.o1 = null;
        self.o2 = "opt";
    }
}