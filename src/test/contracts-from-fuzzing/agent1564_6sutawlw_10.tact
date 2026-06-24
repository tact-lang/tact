struct Inner {
    val: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract NestedManyLayers {
    outer: Outer;

    init() {
        self.outer = Outer{ middle: Middle{ inner: Inner{ val: 7 } } };
    }
}