struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    foo: Inner;
    bar: Cell?;
}

contract Test {
    s: Outer = Outer{ foo: Inner{ x: 1, y: null }, bar: null };

    init() {
        self.s = Outer{ foo: Inner{ x: 42, y: true }, bar: emptyCell() };
    }

    receive() {}
}