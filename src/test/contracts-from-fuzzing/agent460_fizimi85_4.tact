struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract LotsOfFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Cell;
    k: Point;
    l: Int as uint32;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = null;
        self.h = false;
        self.i = "world";
        self.j = emptyCell();
        self.k = Point{ x: 42, y: -42 };
        self.l = 123456;
    }
}