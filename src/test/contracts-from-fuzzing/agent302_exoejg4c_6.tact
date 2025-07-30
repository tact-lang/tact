contract ManyFields {
    a: Int;
    b: Int as uint8;
    c: Int as int16;
    d: Bool;
    e: Bool?;
    f: Address;
    g: Address?;
    h: String;
    i: String?;
    j: Slice;
    k: Cell;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.e = null;
        self.f = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.g = null;
        self.h = "hello";
        self.i = null;
        self.j = emptyCell().asSlice();
        self.k = emptyCell();
    }
}