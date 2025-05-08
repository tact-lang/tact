struct Inner {
    x: Int;
}

struct Outer {
    x: Int;
    inner: Inner;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer { x: 10, inner: Inner { x: 42 } };
    }
}
