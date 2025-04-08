struct Inner {
    a: Int as uint32;
    b: Bool;
    c: String?;
}

struct Mid {
    x: Inner;
    y: Int?;
    z: Bool;
}

struct Outer {
    first: Mid;
    second: Int;
}

contract NestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            first: Mid{
                x: Inner{ a: 10, b: true, c: null },
                y: null,
                z: false,
            },
            second: 42,
        };
    }
}