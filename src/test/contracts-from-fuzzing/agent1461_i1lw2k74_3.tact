struct A {
    x: Int;
    y: Bool;
    s: String;
}

contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Address?;
    nested: A;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = myAddress();
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.nested = A{ x: 3, y: false, s: "nested" };
    }
}