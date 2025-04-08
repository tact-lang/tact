struct OptionalNested {
    foo: Int?;
    nested: Nested?;
}

struct Nested {
    val: Int;
    flag: Bool;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            foo: null,
            nested: Nested{ val: 10, flag: true },
        };
    }
}
