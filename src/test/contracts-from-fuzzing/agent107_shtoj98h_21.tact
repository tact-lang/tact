contract MixFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Slice;
    e: Cell;
    f: String;

    init() {
        self.a = 42;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = "hello world";
    }
}
