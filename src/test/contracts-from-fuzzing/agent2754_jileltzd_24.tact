struct Inner {
    a: Int;
    b: Int;
}

struct Middle {
    c: Inner;
    d: Inner;
}

struct Outer {
    e: Middle;
    f: Middle;
}

contract MultiLayer {
    data: Outer;

    init() {
        self.data = Outer{
            e: Middle{ c: Inner{a:1, b:2}, d: Inner{a:3,b:4} },
            f: Middle{ c: Inner{a:5,b:6}, d: Inner{a:7,b:8} }
        };
    }
}
