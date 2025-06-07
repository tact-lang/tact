struct Inner {
    z: Int;
}

struct Outer {
    x: Int;
    y: Int;
    inner: Inner;
}

contract DoubleNested {
    data: Outer;

    init() {
        self.data = Outer{x: 1, y: 2, inner: Inner{z: 3}};
    }
}