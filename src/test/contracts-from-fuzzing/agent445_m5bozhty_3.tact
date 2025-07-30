struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    a: Inner;
    b: Inner;
}

contract NestedStructs {
    data: Outer;
    init() {
        self.data = Outer{
            a: Inner{ x: 1, y: null },
            b: Inner{ x: 2, y: true }
        };
    }
}