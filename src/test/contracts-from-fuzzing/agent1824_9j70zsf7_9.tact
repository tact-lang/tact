contract MixTypes {
    i: Int;
    b: Bool;
    c: Cell;
    a: Address;
    s: Slice;
    str: String;

    init() {
        self.i = 42;
        self.b = true;
        self.c = emptyCell();
        self.a = myAddress();
        self.s = emptyCell().asSlice();
        self.str = "hello";
    }
}
