struct Nested {
    n: Int;
}

contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Nested;
    i: Nested?;
    j: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = self.e.asSlice();
        self.g = null;
        self.h = Nested{ n: 42 };
        self.i = null;
        self.j = "";
    }
}
