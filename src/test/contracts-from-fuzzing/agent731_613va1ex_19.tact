struct Outer {
    inner: Inner;
}

struct Inner {
    val: Int;
}

contract NestedPrimitives {
    outer: Outer;

    init() {
        self.outer = Outer{ inner: Inner{ val: 5 } };
    }
}