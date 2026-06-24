struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    field1: Int;
    nested: Inner;
    field2: Bool;
    field3: String;
}

contract MixedOrder {
    data: Outer;

    init() {
        self.data = Outer{
            field1: 1,
            nested: Inner{ a: 2, b: null },
            field2: true,
            field3: "ok"
        };
    }
}
