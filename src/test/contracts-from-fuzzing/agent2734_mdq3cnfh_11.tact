struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Int;
    y: Inner;
}

contract Defaults {
    data: Outer = Outer{ x: 0, y: Inner{ a: 0, b: false } };

    init() {
        self.data = Outer{ x: 42, y: Inner{ a: 11, b: true } };
    }
}
