struct InnerA {
    aa: Int;
    bb: Bool;
}

struct InnerB {
    cc: String;
    dd: Int?;
}

struct InnerC {
    ee: Bool?;
    ff: String;
}

struct Container {
    a: InnerA;
    b: InnerB;
    c: InnerC;
}

contract MultiNest {
    store: Container;

    init() {
        self.store = Container{
            a: InnerA{ aa: 1, bb: true },
            b: InnerB{ cc: "x", dd: null },
            c: InnerC{ ee: null, ff: "y" }
        };
    }
}