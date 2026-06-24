struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    a: Inner;
    b: Int;
}

contract NestedFieldsTest {
    data: Outer;
    init() {
        self.data = Outer{
            a: Inner{ x: 1, y: null },
            b: 2
        };
    }
}