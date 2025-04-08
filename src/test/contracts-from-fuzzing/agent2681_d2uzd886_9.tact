contract ManyPrimitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    slice: Slice;
    builder: Builder;

    init() {
        self.i = 10;
        self.b = true;
        self.s = "test";
        self.a = myAddress();
        self.c = emptyCell();
        self.slice = self.c.asSlice();
        self.builder = beginCell();
    }
}