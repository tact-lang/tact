struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    nested: Inner;
    z: String;
}

contract NestedStructTest {
    example: Outer;

    init() {
        self.example = Outer{
            nested: Inner{ x: 1, y: true },
            z: "test"
        };
    }
}