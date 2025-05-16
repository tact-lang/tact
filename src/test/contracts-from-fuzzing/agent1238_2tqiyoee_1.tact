struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner;
    description: String;
}

contract NestedStructContract {
    nestedField: Outer;

    init() {
        self.nestedField = Outer{
            inner: Inner{ value: 10 },
            description: "Deep nesting test"
        };
    }
}