struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
    y: Bool;
}

contract NestedStructField {
    param: Outer;

    init() {
        self.param = Outer{ inner: Inner{ x: 42 }, y: true };
    }
}