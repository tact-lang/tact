struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    z: Bool?;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{ inner: Inner{ x: 1, y: true }, z: null };
    }
}