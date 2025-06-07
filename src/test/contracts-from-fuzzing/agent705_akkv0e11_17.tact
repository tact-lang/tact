struct BigNest {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    x: Int;
    s: InnerString;
}

struct Inner2 {
    b: Bool;
    s: InnerString;
}

struct InnerString {
    value: String;
}

contract ComplexNest {
    data: BigNest;

    init() {
        self.data = BigNest{
            inner1: Inner1 { x: 5, s: InnerString{ value:"hi" } },
            inner2: Inner2 { b: true, s: InnerString{ value:"yo" } }
        };
    }
}