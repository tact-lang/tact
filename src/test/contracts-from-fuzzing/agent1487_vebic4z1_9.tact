contract MixTypes {
    i1: Int;
    b1: Bool;
    s1: String;
    c1: Cell;
    sl1: Slice;
    a1: Address;

    init() {
        self.i1 = 1;
        self.b1 = true;
        self.s1 = "hello";
        self.c1 = emptyCell();
        self.sl1 = emptyCell().asSlice();
        self.a1 = myAddress();
    }
}