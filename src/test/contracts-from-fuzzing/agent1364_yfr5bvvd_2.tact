struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    field1: Int;
    nested: Inner;
    field2: Bool;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            field1: 10,
            nested: Inner{ x: 5, y: null },
            field2: true,
        };
    }
}
