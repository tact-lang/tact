struct Inner {
    y: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{ middle: Middle{ inner: Inner{ y: 5 } } };
    }
}