struct Nested {
    inner1: Bool;
    inner2: String;
}

contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Address;
    f: Cell;
    g: String;
    h: Bool;
    i: Nested;
    j: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
        self.d = emptyCell().asSlice();
        self.e = myAddress();
        self.f = emptyCell();
        self.g = "again";
        self.h = false;
        self.i = Nested{
            inner1: true,
            inner2: "nest",
        };
        self.j = 999;
    }

    receive() {}
}