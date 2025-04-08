struct Inner {
    x: Int;
    y: Int;
    z: Bool;
}

contract ManyVariables {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Cell;
    j: Slice;
    k: Int;
    l: Inner; // nested struct

    init() {
        self.a = 1;
        self.b = false;
        self.c = "abc";
        self.d = myAddress();
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = null;
        self.i = emptyCell();
        self.j = emptyCell().asSlice();
        self.k = 100;
        self.l = Inner{ x: 7, y: 8, z: true };
    }
}