struct Innermost {
    i: Int as uint4;
    j: Int as int8;
    k: Int as uint16;
}

struct Inner {
    innermost: Innermost;
    f: Bool;
}

struct Outer {
    g: Int;
    inner: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            g: 5,
            inner: Inner{
                innermost: Innermost{ i: 7, j: -8, k: 255 },
                f: true
            }
        };
    }
}