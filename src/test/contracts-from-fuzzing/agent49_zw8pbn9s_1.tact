struct Inner {
    x: Int;
    y: String;
    z: Bool?;
}

struct Outer {
    nested: Inner;
    optionalNested: Inner?;
}

contract NestedTest {
    value: Outer;

    init() {
        self.value = Outer{
            nested: Inner{ x: 1, y: "a", z: true },
            optionalNested: null
        };
    }
}