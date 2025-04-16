struct Inner {
    x: Int as int10;
    y: Int as uint6;
}

struct Outer {
    f: Int as uint3;
    inner: Inner;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{ f: 5, inner: Inner{ x: -5, y: 5 } };
    }
}