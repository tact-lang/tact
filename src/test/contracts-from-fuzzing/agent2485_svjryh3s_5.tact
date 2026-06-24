struct Inner {
    z: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract NestedStructs {
    outer: Outer;

    init() {
        self.outer = Outer{ middle: Middle{ inner: Inner{ z: 42 } } };
    }
}