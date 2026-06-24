struct Outer {
    a: Int;
    inner: Inner;
}

struct Inner {
    b: Int;
    deeper: Deeper;
}

struct Deeper {
    c: Int;
}

contract MultiLevel {
    field: Outer;

    init() {
        self.field = Outer{
            a: 1,
            inner: Inner{b: 2, deeper: Deeper{c: 3}}
        };
    }
}