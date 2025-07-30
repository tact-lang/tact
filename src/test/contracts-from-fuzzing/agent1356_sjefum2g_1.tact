struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    first: Inner;
    second: Inner;
}

contract NestedStructContract {
    pos: Outer;

    init() {
        self.pos = Outer{
            first: Inner{ x: 1, y: 2 },
            second: Inner{ x: 3, y: 4 }
        };
    }
}