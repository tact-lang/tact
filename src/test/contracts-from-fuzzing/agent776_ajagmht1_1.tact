struct Inner {
    flag: Bool;
    value: Int;
}

struct Outer {
    nested: Inner;
    label: String;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Inner{ flag: true, value: 42 },
            label: "Nested Struct"
        };
    }
}
