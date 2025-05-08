struct Inner {
    x: Int;
    y: String;
}

contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Inner;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "test";
        self.d = emptyCell();
        self.e = self.d.asSlice();
        self.f = myAddress();
        self.g = 5;
        self.h = true;
        self.i = "hi";
        self.j = Inner{x:42,y:"nested"};
    }
}
