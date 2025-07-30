struct Inner {
    s: String;
    b: Bool;
}

contract ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Inner;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
        self.d = emptyCell();
        self.e = self.d.asSlice();
        self.f = myAddress();
        self.g = Inner{s: "foo", b: false};
    }
}