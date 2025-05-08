struct Inner {
    a: Int;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Int;
}

contract NestedTest {
    val: Outer;

    init() {
        self.val = Outer{
            x: 1,
            y: Inner{ a: 2 },
            z: 3,
        };
    }
}