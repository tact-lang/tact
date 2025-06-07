struct Inner {
    value: Int;
}

struct Outer {
    nested: Inner;
    number: Int;
}

contract NestedStructFields {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{ value: 1 },
            number: 2
        };
    }
}