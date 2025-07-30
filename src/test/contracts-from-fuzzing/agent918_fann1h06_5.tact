contract ManyTypes {
    i: Int;
    b: Bool;
    a1: Address;
    c1: Cell;
    s1: Slice;
    str: String;
    optI: Int?;
    optB: Bool?;

    init() {
        self.i = 1;
        self.b = false;
        self.a1 = myAddress();
        self.c1 = emptyCell();
        self.s1 = self.c1.asSlice();
        self.str = "hello";
        self.optI = null;
        self.optB = true;
    }
}