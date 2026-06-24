struct Inner {
    value: Int;
    optionalFlag: Bool?;
}

struct Outer {
    nested: Inner;
    description: String;
}

contract NestedStructStorage {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                value: 42,
                optionalFlag: null,
            },
            description: "Test",
        };
    }
}