struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract Test {
    data: Outer = Outer{ inner: Inner{ x: 1, y: false }, flag: true };

    init() {
        self.data = Outer{ inner: Inner{ x: 2, y: true }, flag: false };
    }
}
