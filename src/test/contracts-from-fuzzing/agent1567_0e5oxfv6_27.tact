struct Outer {
    a: Int;
    b: Bool;
    inner: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
    s: String;
    deeper: Deeper;
}

struct Deeper {
    d1: Int;
    d2: Bool;
}

contract RecursiveLike {
    data: Outer;

    init() {
        self.data = Outer{
            a: 1,
            b: false,
            inner: Inner{
                x: 2,
                y: true,
                s: "ok",
                deeper: Deeper{
                    d1: 3,
                    d2: false
                }
            }
        };
    }
}