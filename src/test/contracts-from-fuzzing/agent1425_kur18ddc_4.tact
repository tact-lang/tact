struct Point { x: Int; y: Int; }

contract TestContract {
    a: Int;
    b: Bool;
    c: Address?;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Slice?;
    l: Point;
    m: Point?;
    n: Point;
    o: Bool;

    init() {
        self.a = 0;
        self.b = false;
        self.c = null;
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "";
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = Point{ x: 1, y: 2 };
        self.m = null;
        self.n = Point{ x: -5, y: 5 };
        self.o = true;
    }

    receive() {}
}