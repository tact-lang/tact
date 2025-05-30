struct Inner {
    a: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract TripleNest {
    data: Outer;

    init() {
        self.data = Outer {
            middle: Middle {
                inner: Inner { a: 123 }
            }
        };
    }
}
