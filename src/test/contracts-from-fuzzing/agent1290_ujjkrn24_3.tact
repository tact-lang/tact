struct Inner {
    x: Int;
    y: Bool?;
    z: String;
}

struct Outer {
    a: Int;
    b: Inner;
    c: Inner?;
    d: Bool;
}

contract NestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            a: 7,
            b: Inner{ x: 1, y: true, z: "hi" },
            c: null,
            d: false
        };
    }
}