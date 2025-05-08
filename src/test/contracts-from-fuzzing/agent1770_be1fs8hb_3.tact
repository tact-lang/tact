struct Inner {
    flag: Bool;
    note: String;
}

struct Outer {
    value: Int?;
    wrapper: Inner?;
    description: String;
}

contract NestedOptionalFields {
    data: Outer;

    init() {
        self.data = Outer{
            value: null,
            wrapper: null,
            description: "test",
        };
    }
}