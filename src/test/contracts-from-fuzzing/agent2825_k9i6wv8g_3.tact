struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Inner;
}

contract NestedStructTest {
    stored: Outer;

    init() {
        self.stored = Outer{
            x: 7,
            y: Inner{ a: 1, b: null, c: "foo" },
            z: Inner{ a: 2, b: true, c: "bar" }
        };
    }
}