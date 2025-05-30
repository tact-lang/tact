struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    point: Inner;
    label: String;
}

contract NestedStructTest {
    data: Outer;

    init() {
        self.data = Outer{
            point: Inner{ x: 1, y: 2 },
            label: "test"
        };
    }
}