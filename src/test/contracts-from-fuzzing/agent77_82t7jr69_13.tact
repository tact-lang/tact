struct Nested {
    foo: Bool?;
    bar: Int;
}

contract TestContract {
    a: Int;
    b: Bool;
    c: String?;
    d: Address;
    e: Slice;
    f: Cell;
    g: Int?;
    h: Bool?;
    i: String;
    j: Address?;
    k: Nested;

    init() {
        self.a = 123;
        self.b = true;
        self.c = null;
        self.d = myAddress();
        self.e = emptyCell().asSlice();
        self.f = emptyCell();
        self.g = null;
        self.h = null;
        self.i = "hello";
        self.j = null;
        self.k = Nested{foo: false, bar: 42};
    }
}