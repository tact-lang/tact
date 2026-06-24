contract MixedTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    builder: Builder;

    init() {
        self.i = 10;
        self.b = true;
        self.s = "x";
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = self.c.asSlice();
        self.builder = beginCell();
    }
}
