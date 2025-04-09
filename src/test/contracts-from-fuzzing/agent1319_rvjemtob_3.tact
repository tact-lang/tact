struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    x: Inner;
    y: Int?;
    z: Bool;
}

contract NestedStructTest {
    data: Outer;

    init() {
        self.data = Outer {
            x: Inner { a: 1, b: null },
            y: null,
            z: true
        };
    }
}